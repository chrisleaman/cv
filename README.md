# Chris Leaman - Resume

[![Build Status](https://travis-ci.com/chrisleaman/cv.svg?branch=master)](https://travis-ci.com/chrisleaman/cv)

<p align="center">
  <a href="https://github.com/chrisleaman/cv/releases/download/untagged-fefa30c938b113622f50/cv.pdf">
  <img src="https://github.com/chrisleaman/cv/releases/download/20190805091518-HEAD-b19a73c/cv_thumbnail.png"
       alt="CV thumbnail" width="300"/>
  </a>
</p>

This repo contains contains the code for my resume. General workflow is to write to LaTeX, push to git and then let Travis-CI automatically build the .pdf files using xelatex. The advantages of this workflow is that a working LaTeX distribution is not needed locally and different versions of the resume can be built on different branches.

The latest compiled `.pdf` can always be found on the [releases page](https://github.com/chrisleaman/cv/releases).

Useful references:
  - [PHPirates/travis-ci-latex-pdf](https://github.com/PHPirates/travis-ci-latex-pdf#deploy): For instructions on setting up Travis-CI integration
  - [depressiveRobot/friggeri-cv-a4](https://github.com/depressiveRobot/friggeri-cv-a4): Resume template, although I've made some tweaks to mine
