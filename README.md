# Chris Leaman - Resume

[![Build Status](https://travis-ci.com/chrisleaman/cv.svg?branch=master)](https://travis-ci.com/chrisleaman/cv)

This repo contains contains the code for my resume. General workflow is to write to LaTeX, push to git and then let Travis-CI automatically build the .pdf files using xelatex. The advantages of this workflow is that a working LaTeX distribution is not needed locally and different versions of the resume can be built on different branches.

Useful references:
  - [PHPirates/travis-ci-latex-pdf](https://github.com/PHPirates/travis-ci-latex-pdf#deploy): For instructions on setting up Travis-CI integration
  - [depressiveRobot/friggeri-cv-a4](https://github.com/depressiveRobot/friggeri-cv-a4): Resume template, although I've made some tweaks to mine
