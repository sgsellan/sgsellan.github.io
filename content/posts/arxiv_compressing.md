---
title: "Compressing a massive TeX folder for submitting to arxiv"
date: 2022-03-30
draft: false
aliases:
  - /arxiv_compressing.html
---

I keep forgetting how to do this well, and most of the tricks I find if I just google don't work for me. So, future Silvia, here's what you do:

1. Run `pip install arxiv-latex-cleaner`
2. Run `arxiv_latex_cleaner --compress_pdf path/to/tex/folder`
3. Compress the new folder `path/to/tex/folder-ArXiv` and upload that to ArXiv