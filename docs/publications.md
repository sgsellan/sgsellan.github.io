# Publications

<style>
:root {
  --green: #51cc37;
  --red:   #cc334D;
  --blue:  #334DCC;
  --yellow: #ffed91;
  --darkblue:  #131D4D;
  --lightblue:  #7585D5;
  --lightgray:  #f2f2f2;
  --darkgray:  #333;
}
.column, .columns
{
  padding-left: 1em;
  padding-right: 1em;
  float:left;
}
.large-5
{
  min-width: calc(0.5*(100% - 150px - 6em));
}
.large-10
{
  width: calc(100% - 200px - 4em);
}
.row
{
  width: 100%;
  max-width: 90em;
  margin: 0.6em auto;
}
.row:before, .row:after
{
  content: " ";
  display: table;
}
.row:after
{
  clear: both;
}
.me
{
  font-weight: bold;
}
.notme
{
}
.title{
  font-weight: bold;
  line-height: 0.8em;
}
.thumbnail
{
  width: 200px;
}
.thumbnail img
{
  max-width: 100%;
}
.venue
{
  font-style: italic;
  line-height: 0.8em;
  font-size: small;
}
p
{
 display: block;
 margin-top: 0;
 margin-bottom: 0.2em;
}
.publication p, .course p
{
 display: block;
 margin-top: -1.5em ;
 margin-bottom: -1.5em ;
}
/*
a[href$=".pdf"]:after
{
  content: " [pdf]";
}
*/
.links{
  line-height: 1em;
}
.authors{
  line-height: 1em;
  font-size: small;
}
.links a
{
  background-color: var(--lightgray);
}
.links a:hover
{
  background-color: var(--yellow);
}
.footer
{
  font-size: 0.7em;
  text-align: center;
}
</style>

<br>

<!-- ### Conference & Journal Publications -->

<!-- <div class="row publication">
    <div class="columns thumbnail">
      <img src=images/paper-thumbnails/stochastic-psr.jpeg>
    </div>
    <div class="columns large-10">
      <p class="title">Stochastic Poisson Surface Reconstruction</p>
      <p class="authors"><span class=me>Silvia Sell&aacuten</span>, <span class=notme>Alec Jacobson</span></p>
      <p class="venue">Under Submission</p>
      <p class="links"> <a>Paper (TBD)</a></p>
    </div>
  </div> -->


<div class="row publication">
    <div class="columns thumbnail">
      <img src=images/paper-thumbnails/breaking-bad.png>
    </div>
    <div class="columns large-10">
      <p class="title">Breaking Bad: A Dataset for Geometric Fracture and Reassembly</p>
      <p class="authors"><span class=me>Silvia Sell&aacuten*</span>, <span class=notme>Yun-Chun Chen*, Ziyi Wu*, Animesh Garg, Alec Jacobson</span> (*joint first authors)</p>
      <p class="venue">Submitted to NeurIPS 2022</p>
      <p class="links"> <a>Paper (TBD)</a>  <a href="">Arxiv (TBD)</a> <a href="https://breaking-bad-dataset.github.io">Website</a> <a href="https://doi.org/10.5683/SP3/LZNPKB">Dataset</a> </p>
    </div>
  </div>

<div class="row publication">
  <div class="columns thumbnail">
    <img src=images/paper-thumbnails/fracture-modes.jpg>
  </div>
  <div class="columns large-10">
    <p class="title">Breaking Good: Fracture Modes for Realtime Destruction</p>
    <p class="authors"><span class=me>Silvia Sell&aacuten</span>, <span class=notme> Jack Luong, Leticia Mattos Da Silva, Aravind Ramakrishnan, Yuchuan Yang, Alec Jacobson</span></p>
    <p class="venue">Accepted to TBD Journal, 2022</p>
    <p class="links"> <a href="pdf/papers/fracture-harmonics-preprint.pdf">High-resolution Preprint</a> <a href="https://arxiv.org/abs/2111.05249">Arxiv</a> <a href="https://github.com/sgsellan/fracture-modes">Code</a> <a href="video/paper-videos/fracture-modes.mp4">Video</a></p>
  </div>
</div>

<div class="row publication">
  <div class="columns thumbnail">
    <img src=images/paper-thumbnails/gender.jpg>
  </div>
  <div class="columns large-10">
    <p class="title">Sex and Gender in the Computer Graphics Literature</p>
    <p class="authors"><span class=notme>Ana Dodik*</span>, <span class=me>Silvia Sell&aacuten*</span>, <span class=notme>Theodore Kim, Amanda Phillips</span> (*joint first authors)</p>
    <p class="venue">SIGGRAPH Talk, 2022</p>
    <p class="links"> <a href="pdf/papers/gender-as-a-variable.pdf">Paper</a> <a href="pdf/papers/gender-as-a-variable-supplement.pdf">Supplement</a> <a href="http://arxiv.org/abs/2206.00480">Arxiv</a> <a href="">Talk (TBD)</a></p>
  </div>
</div>

<div class="row publication">
  <div class="columns thumbnail">
    <img src=images/paper-thumbnails/blender-course.jpg>
  </div>
  <div class="columns large-10">
    <p class="title">Blender for Academic Papers</p>
    <p class="authors"><span class=me>Silvia Sell&aacuten</span></p>
    <p class="venue">Symposium on Geometry Processing (SGP) Course, 2022</p>
    <p class="links"> <a href="./blender_figure.html">Guide</a> <a href="https://research.siggraph.org/blog/guides/rendering-a-paper-figure-with-blender/">Guide (SIGGRAPH mirror)</a> <a>Video (TBD)</a></p>
  </div>
</div>



<div class="row publication">
  <div class="columns thumbnail">
    <img src=images/paper-thumbnails/swept-volumes.jpg>
  </div>
  <div class="columns large-10">
    <p class="title">Swept Volumes via Spacetime Numerical Continuation</p>
    <p class="authors"><span class=me>Silvia Sell&aacuten</span>, <span class=notme> Noam Aigerman, Alec Jacobson</span></p>
    <p class="venue">ACM Transactions on Graphics (SIGGRAPH), 2021</p>
    <p class="links"> <a href="pdf/papers/swept-volumes.pdf">Paper</a> <a href="pdf/papers/swept-volumes-low-res.pdf">Paper (low res)</a> <a href="https://github.com/sgsellan/swept-volumes">Code</a> <a href="https://youtu.be/6iLqMQ3kd24">Video</a> <a href="https://youtu.be/tic3dLcCE8U">Talk</a> <a href="https://www.dgp.toronto.edu/projects/swept-volumes/">Project Page</a></p>
  </div>
</div>

<div class="row publication">
  <div class="columns thumbnail">
    <img src=images/paper-thumbnails/gp-tutorial.jpg>
  </div>
  <div class="columns large-10">
    <p class="title">Geometry Processing in Matlab using gptoolbox</p>
    <p class="authors"><span class=notme>Hsueh-Ti Derek Liu*</span>, <span class=me>Silvia Sell&aacuten*</span>, <span class=notme>Oded Stein*</span> (*joint first authors)</p>
    <p class="venue">Symposium on Geometry Processing (SGP) Course, 2021</p>
    <p class="links"> <a href="http://odedstein.com/projects/sgp-2021-gp-matlab-course/index.html">Project Page</a> <a href="https://youtu.be/NGathaVRyDA">Video Tutorial</a> <a href="https://github.com/odedstein/gp-matlab-tutorial">Github Tutorial</a></p>
  </div>
</div>

<div class="row publication">
  <div class="columns thumbnail">
    <img src=images/paper-thumbnails/opening-and-closing-surfaces.jpg>
  </div>
  <div class="columns large-10">
    <p class="title">Opening and Closing Surfaces</p>
    <p class="authors"><span class=me>Silvia Sell&aacuten</span>, <span class=notme>Jacob Kesten, Ang Yan Sheng, Alec Jacobson</span></p>
    <p class="venue">ACM Transactions on Graphics (SIGGRAPH Asia), 2020</p>
    <p class="links"> <a href="pdf/papers/opening-and-closing-surfaces.pdf">Paper</a> <a href="pdf/papers/opening-and-closing-surfaces-low-res.pdf">Paper (low res)</a> <a href="https://github.com/sgsellan/opening-and-closing-surfaces.git">Code</a> <a href="https://youtu.be/KfiqhyhWFnY">Video</a> <a href="https://youtu.be/bBsudsHZPmw">Talk</a> <a href="https://www.dgp.toronto.edu/projects/opening-and-closing-surfaces/">Project Page</a></p>
  </div>
</div>

<div class="row publication">
  <div class="columns thumbnail">
    <img src=images/paper-thumbnails/developability-of-heightfields.jpg>
  </div>
  <div class="columns large-10">
    <p class="title">Developability of Heightfields via Rank Minimization</p>
    <p class="authors"><span class=me>Silvia Sell&aacuten</span>, <span class=notme>Noam Aigerman, Alec Jacobson</span></p>
    <p class="venue">ACM Transactions on Graphics (SIGGRAPH), 2020</p>
    <p class="links"> <a href="pdf/papers/compressed-developables.pdf">Paper</a> <a href="pdf/papers/compressed-developables-low-res.pdf">Paper (low res)</a> <a href="https://github.com/sgsellan/developability-of-heightfields.git">Code</a> <a href="https://youtu.be/mfJB7ehxWPY">Talk</a> <a href="https://www.dgp.toronto.edu/projects/compressed-developables/">Project Page</a></p>
  </div>
</div>

<div class="row publication">
  <div class="columns thumbnail">
    <img src=images/paper-thumbnails/overlapping.jpg>
  </div>
  <div class="columns large-10">
    <p class="title">Solid Geometry Processing on Deconstructed Domains</p>
    <p class="authors"><span class=me>Silvia Sell&aacuten</span>, <span class=notme>Herng Yi Cheng, Yuming Ma, Mitchell Dembowski, Alec Jacobson</span></p>
    <p class="venue">Computer Graphics Forum (SGP), 2019</p>
    <p class="links"> <a href="pdf/papers/overlapping.pdf">Paper</a> <a href="https://github.com/sgsellan/solid-geometry-processing-on-deconstructed-domains.git">Code</a> <a href="https://youtu.be/yjiHuoxQII8">Talk</a> <a href="https://www.dgp.toronto.edu/projects/deconstructed-domains/">Project Page</a></p>
  </div>
</div>





## Software

<div class="row publication">
  <div class="columns thumbnail">
    <img src=images/paper-thumbnails/gpytoolbox.png>
  </div>
  <div class="columns large-10">
    <p class="title">Gpytoolbox</p>
    <p class="authors"><span class=me>Silvia Sell&aacuten</span></p>
    <p class="venue">A Python geometry processing toolbox</p>
    <p class="links"> <a href="https://github.com/sgsellan/gpytoolbox">Code</a>  <a href="https://github.com/sgsellan/python-project-with-gpytoolbox">Project template</a></p>
  </div>
</div>

<div class="row publication">
  <div class="columns thumbnail">
    <img src=images/paper-thumbnails/remesher.png>
  </div>
  <div class="columns large-10">
    <p class="title">Botsch-Kobbelt Local Remesher</p>
    <p class="authors"><span class=me>Silvia Sell&aacuten</span></p>
    <p class="venue">A C++ and Python remeshing library</p>
    <p class="links"> <a href="https://github.com/sgsellan/botsch-kobbelt-remesher-libigl">Code</a></p>
  </div>
</div>


<div class="row footer">
    html and css lifted and adapted from Yotam Gingold, with special thanks to Alec Jacobson</a>.
</div>

