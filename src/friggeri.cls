\ProvidesClass{friggeri}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

% Can use the print option to print black and white
% e.g. \documentclass[print]{friggeri}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass[a4paper]{article}

\usepackage{changepage}



%%%%%%%%%%
% Colors %
%%%%%%%%%%

% Note that this may cause issues with hyperref
% https://tex.stackexchange.com/a/183340

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{darkblue}{HTML}{4685FB}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{darkblue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  % \colorlet{fillheader}{gray}
  % \colorlet{header}{white}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

% % Don't use colorfull headers
% \colorlet{green}{gray}
% \colorlet{orange}{gray}
% \colorlet{purple}{gray}
% \colorlet{brown}{gray}
% \colorlet{red}{gray}
% \colorlet{blue}{gray}
% \colorlet{darkblue}{gray}


%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage{unicode-math}

\newfontfamily\bodyfont[Path=fonts/, ItalicFont={HelveticaNeueLTStd-LtIt}]{HelveticaNeueLTStd-Lt}
\newfontfamily\thinfont[Path=fonts/, ItalicFont={HelveticaNeueLTStd-UltLtIt}]{HelveticaNeueLTStd-UltLt}
\newfontfamily\headingfont[Path=fonts/, ItalicFont={HelveticaNeueLTStd-BdCnO}]{HelveticaNeueLTStd-BdCn}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor, Path=fonts/, ItalicFont={HelveticaNeueLTStd-LtIt}]{HelveticaNeueLTStd-Lt}

%\setmathfont{XITS Math}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle,  anchor=north, minimum width=\paperwidth, minimum height=4.0cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        headercolor\or%
        headercolor\or%
        headercolor\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}

\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{16.0cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\}

\newcommand{\entrybullets}[4]{%
  #1&\parbox[t]{16.0cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}%
    #4\vspace{\parsep}%
  }\\}


\newcommand{\entrybulletsindented}[4]{%
  #1&\hspace{2em}\parbox[t]{14.0cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}%
    #4\vspace{\parsep}%
  }\\}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section%
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{3.6} (1.5, 4.33)
  \begin{flushright}
  \obeycr%
}{%
  \restorecr%
  \end{flushright}
  \end{textblock}
  \let\section\oldsection%
}


%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=1.5cm,top=1.5cm,right=1.5cm,bottom=1.5cm,nohead,nofoot]{geometry}
% \RequirePackage{hyperref}
% \hypersetup{
%     allbordercolors=blue,
%   pdfborderstyle={/S/U/W 1},
% }


% Reduce occurance of hyphernation
% https://tex.stackexchange.com/a/177179
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000