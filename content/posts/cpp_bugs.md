---
title: "Bugs I often write in C++"
date: 2022-01-27
draft: false
---

Every time I try to code a project in C++ I run into the same bugs, and I keep forgetting how to solve them. So, I decided to write this list here for my own reference.

### Eigen initialization bug

**Symptoms:** The code compiles and runs properly, but the output seems random and changes from one run to the next, despite the code being theoretically deterministic.

**Diagnosis:** This happens because you am declaring a variable and calling it without initializing it. For example, `Eigen::Matrix<int,3,5> A;` will not create a matrix `A` of zeros, instead it will fill with entries with garbage from the computer's memory. 

**Treatment:** Go variable by variable and ensure that it is being properly initialized after being declared. For example, instead of `Eigen::Matrix<int,3,5> A;`, write
```cpp
Eigen::Matrix<int,3,5> A;
A.setZero();
```
### Linker error

**Symptoms:** The code seems to compile well but breaks just at the end of the compilation process, returning an error like `ld: symbol(s) not found for architecture x86_64`.

**Diagnosis:** This happens because you are not compiling one of the source files you're using. For example, you wrote `main.cpp` which itself includes another function you wrote in `func.cpp`,`func.h`, but you are only compiling `main` and not `func`.

**Treatment:** If you are using CMake (and `func` is in a path that CMake checks for source code, e.g., `include/` or `/src` if you are using CMake best practices), remove all CMake cache and build the project again,
```shell
rm -rf build
mkdir build
cd build
cmake ../
```

If you are not using CMake (even though you should) and instead compiling by calling your compiler directly from the terminal like `gcc main.cpp -o main`, then add `func.cpp` to the source files being compiled by calling instead `gcc main.cpp func.cpp -o main`.

### Multiple inclusions

**Symptoms:** Compiling fails with errors like `error: redefinition of ...` or `... included multiple times`.

**Diagnosis:** This happens because, when compiling, the compiler is reaching the same function or variable definition many times. For example, say we have a function `main.cpp`:
```cpp
#include "func.h"
#include "func2.h"
int main(int argc, char *argv[])
{
    func(0);
    func2(0);
}
```
which calls functions `func.cpp`
```cpp
#include "func.h"
void func(int a){ std::cout << a << std::endl; }
```
with header file `func.h`:
```cpp
void func(int a)
```
and 
`func2.cpp`
```cpp
#include "func2.h"
void func2(int a){ func(a+1); }
```
with header file `func2.h`:
```cpp
#include "func.h"
void func2(int a)
```
When the compiler sees an `include` statement, it will literally just copy that file at that position in the code; and, of course, this works recursively. Therefore, since `main` is including `func.h` and `func2.h`, which in turn also includes `func.h`, when the compiler starts reading `main.cpp` and sees
```cpp
#include "func.h"
#include "func2.h"
```
it will interpret it as
```cpp
void func(int a)
#include "func2.h"
```
and then
```cpp
void func(int a)
#include "func.h"
void func2(int a)
```
which recursively turns into
```cpp
void func(int a)
void func(int a)
void func2(int a)
```
Thus, even without knowing it, we were defining the same function twice to the compiler's eyes, and that makes it crash.

**Treatment:** The best way to be protected against this is always using [include guards](https://en.wikipedia.org/wiki/Include_guard), a smart trick to ensure that the compiler will only enter the main text of each header file once. Basically, envelop *every* header file you ever write in an if statement like this:
```cpp
#ifndef UNIQUE_NAME
#define UNIQUE_NAME

// header code here

#endif
```
Make sure that `UNIQUE_NAME` is unique for each header file and it never shares a name with any file or variable or functions ever read by the compiler. For example, you can make them all caps and make sure you never write all caps variable or function names.

So, in our example, we would make `func.h` 
```cpp
#ifndef FUNC
#define FUNC
void func(int a)
#endif
```
and `func2.h`
```cpp
#ifndef FUNC2
#define FUNC2
#include "func.h"
void func2(int a)
#endif
```
By doing this, we avoid the compiler entering the same code twice and we avoid the error
