# Chris Leaman - CV

[![Build Status](https://github.com/chrisleaman/cv/actions/workflows/texlive.yaml/badge.svg?event=push)](https://github.com/chrisleaman/cv/actions/workflows/texlive.yaml)

<p align="center">
  <a href="https://github.com/chrisleaman/cv/releases/latest/download/cv.pdf">Download cv.pdf</a><br>
  <a href="https://github.com/chrisleaman/cv/releases/latest/download/cv.pdf">
  <img src="https://github.com/chrisleaman/cv/releases/latest/download/cv_thumbnail.png"
       alt="CV thumbnail" width="300"/>
  </a>
</p>

This repo contains contains the code for my resume. General workflow is to write to LaTeX, push to Github and then let a [Github Action](https://github.com/chrisleaman/cv/actions/workflows/texlive.yaml) automatically build the .pdf files using xelatex. The advantages of this workflow is that a working LaTeX distribution is not needed locally and different versions of the resume can be built on different branches.

The latest compiled `.pdf` can always be found on the [releases page](https://github.com/chrisleaman/cv/releases).

Useful references:
  - [depressiveRobot/friggeri-cv-a4](https://github.com/depressiveRobot/friggeri-cv-a4): Resume template, although I've made some tweaks to mine
