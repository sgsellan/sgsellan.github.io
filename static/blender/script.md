# Blender video script

Hi everyone! I am Silvia, a PhD student at the University of Toronto, and welcome to my Blender tutorial!

One of the first things I noticed when I was starting out in computer graphics and geometry processing was just how amazing all the SGP and SIGGRAPH paper figures look, so much aesthetically nicer that in any other field I had done research in. And it makes sense: we are computer graphics researchers, of course we want to showcase our results in the best possible light using state of the art computer graphics techniques. But when you are starting out this can feed a lot of your impostor syndrome: the results from my matlab, python or c++ project don't look anything near as nice as the ones in the papers I read, which can be discouraging. So today I am going to teach you how to render pretty pictures of your results using Blender.

Blender is a free and open source computer graphics piece of software which includes a massive amount of functionality. It is one of the greatest open software sucess stories I can think of, but it can also be quite overwhelming to start in. There are many great general-purpose Blender tutorials online, but these are usually aimed at aspiring artists so they cover much, much more than what you need just to have a pretty picture in your paper, and in much more detail. If it's three days from the SIGGRAPH deadline, you don't have the time to go through 20 hours of video on how to model a donut. That's the kind of audience this tutorial wants.

Finally, this is an absolute beginner tutorial, so I will take it easy and explain everything I am doing so that people who have no experience with Blender can follow along. If you're just looking for a quick step-by-step reference, you can go to `bit.ly/blender-guide`.

Okay, let's jump in! Let's assume my set-up is like this: I coded some algorithm using some programming language and wrote my output geometry as an .obj file, here my-shape.obj, and I want to render it in a nice way for a paper figure. Let's open blender

[open blender]

Let's click somewhere to get rid of this welcome window and we can now see the familiar, maybe slightly overwhelming Blender user interface.

The first thing we're going to do is actually the most critical, and it will help us navigate the blender functionality without having to remember very elaborate key bindings or UI button placement, which by the way Blender likes changing up with every different version.

[change preferences thing]

What this has done is now we can use the spacebar as a search field, meaning that if we want to use some blender option but we don't know or don't remember where it is in the UI, we can just type it. [examples]

Okay! Now we can start moving around in the viewer. In my Macbook, I rotate by dragging two fingers in the trackpad, I can pan by holding SHIFT and zoom by holding CMD. Your own controls may vary, especially if you're using a mouse, but they're generally very intuitive. 

Let's begin by removing the default cube by selecting it with left click, pressing X and then enter to remove it.

At this point we can already import our geometry. So let's go to file import obj and choose our file. Yay! we can now see it in our Blender viewer. We can use the controls in the right sidebar to move the object around, or drag with the controls on the left.

Now, to make a pretty picture of this geometry, we need to render it, which is a fancy way of saying we will simulate taking a photograph of it. And the process from here on will be very similar to taking a picture of something in the real world. The first thing we need is, of course, a camera. The easiest way to set up a camera is to move around in the viewer until we see a view angle that we like, and then press SPACEBAR and type "align camera to view", press enter and this camera frame will appear showing the angle and region of space that will appear in the rendered image.

By pressing spacebar there that was our first time using that option we changed in the blender preferences. If you google how to add a camera that is aligned with your current blender view, you'll find very confusing key bindings that you need to memorize. By making the spacebar a search field, we can just type what we want without needing to remember all that. 

Okay good! So we have a camera. But what we're looking at right now is not the image we'd get if we pressed the shutter and took a picture. Instead, we are looking at a simplified Blender view that is optimized to show us all the geometry in the scene. Blender calls this solid shading. To look at the render preview, we can search for render shading, enter and see this. 

Okay! This starts to look more like a picture, at least we have a shadow and a light and stuff. Now this is slightly hard to see but you can try it in your computer too. If we move around we can see that the shadow changes as I move. Now, physically, that shouldn't happen, right? The shadow depends on the position of the light and the object, not on where the viewer is. The reason this happens is because, by default, Blender isn't actually simulating how the light would physically interact with the scene; instead, it is using Blender's approximate render engine that does a lot of very fancy approximations in order to render things really fast. But we don't need it to be very fast: we can spend some extra time if that means our paper figure will look nicer. So let's go to the render properties and change the render engine to "Cycles".

As you can see our image has completely changed, and instead of that static image now we see it sort of grainy and converging to a less noisy one. This is because now, the engine is actually tracing many light rays to physically simualte how they would interact with the scene, which is computationally expensive but with a little time and enough samples converges to a nicer picture.

Something that didn't use to happen in previous Blender version but suddenly happens now is that, by default, this rendering engine will simulate way way way too many light rays to produce the image, which can take a very long time. So let's quickly change it to more reasonable amounts. [change the thing]

Okay! So now let's look at our render preview. What is wrong with this picture? Well, the first thing that jumps to mind to me is that our geometry looks like it has this chalk material that isn't very aesthetically pleasing. In fact this is Blender's default material, we haven't selected a material for it yet. So let's do just that.

Designing a material is super interesting, and you can find many great tutorials online depending if you want it to look photorrealistic, or to have specific properties and colors and all that. But for a paper figure you usually don't need all that: you want materials that are aesthetically pleasing, aren't too reflective but enough to show differences in geometry, and with colors that can be different enough to show different algorithms or differentiate between input and output. So I made a bunch of materials that do just that: all you need to do is go to bit.ly/blender-guide and click on the template link here. No need to open it, just downloading the file is fine.

All we're going to do now is grab the materials from my template file and import them into our current file. To do this we go to file-> append, navigate to the file in my downloads folder, and navigate to the materials. Select all of them and click "Append". At this point nothing has changed because we haven't yet assigned a material to our object. To do it let's go to the material properties, to this arrow and choose any one of these. I always like the green one, but for this shape I think the yellow one looks better. The colors follow colormaps designed by Dr Cynthia Brewer that I'll link in the video's description.

Okay! So we finally have a material. This may be a nice point to look at what our rendered image would look like, so let's render it by searching for "render image". This can take a few minutes, especially if your computer is also doing screen capture and video recording at the same time like mine. Fortunately, I can skip forward in time...

...and we're done! Here's our rendering. Now, what are some things that we can easily improve? Well, one thing you'll notice if you look at SGP or SIGGRAPH papers often is that objects aren't usually just floating in space, instead they are usually resting on the ground, and they cast a shadow on that ground which makes the image much nicer.

[images of that]

To do this, we're going to add a ground plane. Again, we could remember what key bindings we need for it but why not just press spacebar and search for "add plane". Now, let's scale the plane using the controls in the right sidebar and great! We have a ground plane, and the object casts a shadow on it. That's great but it's still not exactly what we want. Instead, in academic papers, usually you don't actually see this ground be rendered, all that is shown is the shadow that it casts on it. Of course this is not physically realistic, but it looks much better when you place it on a paper with a white background. To do this we will need to turn our groundplane into what's called a "shadowcatcher", which we can do by going to the ground's object properties, visibility, shadowcatcher; and make the rendered image transparent, which we can do in the render properties -> film -> transparent.

So let's see how this looks! Again, skipping forward in time... 

... great! our object now casts a shadow. Still, right now all looking at this shadow is doing is very loudly pointing out the one element of our scene that we have ignored so far: the lighting. Here the shadow is extremely sharp, it's like the object is being hit by direct sunlight from one side and the other is almost completely pitch black. That may look good if you want to make a nice artistic image, but if the point is to showcase the geometry of the shape, we will need a lighting setup that lights up every part of the shape in a more balanced way.

Well, much like with material design, lighting setup is also extremely hard! You need only ask a photographer. If this is interesting to you, you can go online and take a look at Blender tutorials for how to set up nice studio lighting, they usually involve many different light sources and strategically placed reflective panels and all that. But (and you may be sensing a pattern by this point), you may not have time or want to go through hours of tutorials. For that, I actually found a trick that we can do to use Blender's default environment lighting setups and never have to think about setting up our own lights.

[guide through steps to getting world light]

Ta-dah! Now our shadows are much nicer and softer. I can't wait to see what the final rendering looks like! Let's press render image again...

...and there you go! We have a really nice picture that you can now paste into your next SGP or SIGGRAPH papers.

I hope you enjoyed this tutorial! You can find more information as well as slightly more advanced tricks at bit.ly/blender-guide!

---- if there's extra time ----

So, I'd say this is a perfectly fine image for a figure already. But what are some slightly more advanced tricks one can do to improve it? Well, one thing that may look slightly ugly is that you can see the actual flat triangles and quads of the mesh in the render. This is known as flat shading, and it's good if we're, for example, highlighting an algorithm where the specific mesh is important. But sometimes it isn't, and it can even be distracting. In those cases, we can just search for "smooth shade" and make it seem smoother (google vertex normals vs face normals to know why this is the case).




