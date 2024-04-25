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
\usepackage[fontsize=9pt]{fontsize}

\usepackage{changepage}
\usepackage{tabularray}
\usepackage{placeins}
\usepackage[nobottomtitles]{titlesec}
\usepackage{tabularx}
\usepackage{enumitem}
\setlist[itemize]{topsep=-\parskip, itemsep=0pt, parsep=0pt, topsep=0pt, left=0pt..1em}

% \usepackage{fixltx2e}
\usepackage{fancyhdr}
\usepackage{lastpage}
\usepackage{tabulary,booktabs}
\usepackage{ragged2e}
\usepackage{rotating}
\usepackage{needspace}


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
\colorlet{textcolor}{darkgray}
\colorlet{headercolor}{black}

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
\usepackage{fontawesome5}

\RequirePackage[quiet]{fontspec}
\RequirePackage{unicode-math}
\defaultfontfeatures{Mapping=tex-text}

\newfontfamily\bodyfont[Path=fonts/, ItalicFont={HelveticaNeueLTStd-LtIt.otf}]{HelveticaNeueLTStd-Lt}
\newfontfamily\thinfont[Path=fonts/, ItalicFont={HelveticaNeueLTStd-UltLtIt.otf}]{HelveticaNeueLTStd-UltLt}
\newfontfamily\headingfont[Path=fonts/, ItalicFont={HelveticaNeueLTStd-BdCnO.otf}]{HelveticaNeueLTStd-BdCn}
\newfontfamily\medfont[Path=fonts/, ItalicFont={HelveticaNeueLTStd-Lt.otf}]{HelveticaNeueLTStd-Lt}

\setmainfont[Color=textcolor, Path=fonts/, ItalicFont={HelveticaNeueLTStd-LtIt}]{HelveticaNeueLTStd-Lt}
% \setmainfont[Color=textcolor, Path=fonts/, ItalicFont={LibertinusSerif-Italic}]{LibertinusSerif-Regular}

\newcommand{\projectfont}[1]{{\medfont \textcolor{gray}{#1}}}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

% \newcommand{\rolefont}{%
%   \fontsize{14pt}{24pt}\selectfont%
%   \thinfont%
%   \color{white}%
% }

% \newcommand{\header}[3]{%
%   \begin{tikzpicture}[remember picture,overlay]
%     \node [rectangle,  anchor=north, minimum width=\paperwidth, minimum height=4.0cm] (box) at (current page.north){};
%     \node [anchor=center] (name) at (box) {%
%       \fontsize{40pt}{72pt}\color{header}%
%       {\thinfont #1}{\bodyfont  #2}
%     };
%     \node [anchor=north] at (name.south) {%
%       \fontsize{14pt}{24pt}\color{header}%
%       \thinfont #3%
%     };
%   \end{tikzpicture}
%   \vspace{2.5cm}
%   \vspace{-2\parskip}
% }


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
\filbreak
  \needspace{3.0 \baselineskip}%
  \par\vspace{1.5\parskip}
  {%
    \Large\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  {\titlerule[0.2pt]}
  \par\vspace{0.1\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


% https://tex.stackexchange.com/a/94702
\newenvironment{absolutelynopagebreak}
  {\par\nobreak\vfil\penalty0\vfilneg
   \vtop\bgroup}
  {\par\xdef\tpd{\the\prevdepth}\egroup
   \prevdepth=\tpd}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}


% \setlength{\tabcolsep}{0pt}
% \newenvironment{entrylist}{%
%   \begin{longtblr}
% }{%
%   \end{longtblr}
% }

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

\newcommand{\entrytable}[6]{
\begin{adjustwidth}{1.0cm}{}
\begin{tabularx}{\linewidth}{X r}
   \textbf{#1}  & {\footnotesize\addfontfeature{Color=lightgray} #3} {\footnotesize\addfontfeature{Color=darkgray} #2} \\ 
   \small{\textit{#4}}  & {\footnotesize\addfontfeature{Color=lightgray} #5} \\
\end{tabularx}\\
\vspace{-\parsep}
\end{adjustwidth}
\begin{adjustwidth}{1.0cm}{}
{{\small #6}}
\end{adjustwidth}
\vspace{\parsep}

}

\newcommand{\entrytableproject}[7]{
\filbreak
\begin{adjustwidth}{1.0cm}{}
\begin{tabularx}{\linewidth}{X r}
   \textbf{#1}  & {\footnotesize\addfontfeature{Color=lightgray} #3} {\footnotesize\addfontfeature{Color=darkgray} #2} \\ 
   \small{\textit{#4}}  & {\footnotesize\addfontfeature{Color=lightgray} #5} \\
\end{tabularx}\\
\vspace{-\parsep}
\end{adjustwidth}
\begin{adjustwidth}{1.0cm}{}
{{\small 
  \begin{tabularx}{\linewidth}{p{2.6cm} X}
     Project description:  & {#6} \\ 
     Responsible for:  & {#7}
  \end{tabularx}
}}
\end{adjustwidth}
\vspace{\parsep}
}


\newcommand{\entrytableprojecthighlight}[7]{
\filbreak
\begin{adjustwidth}{1.0cm}{}
\begin{tabularx}{\linewidth}{X r}
   \textbf{#1}  & {\footnotesize\addfontfeature{Color=lightgray} #3} {\footnotesize\addfontfeature{Color=darkgray} #2} \\ 
   \small{\textit{#4}}  & {\footnotesize\addfontfeature{Color=lightgray} #5} \\
   \small{\textit{#6}} &  \\
\end{tabularx}\\

{{\small 
  {#7}
}}
\end{adjustwidth}
\vspace{\parsep}
}

\newcommand{\entrybulletindent}[1]{
\begin{adjustwidth}{2.0cm}{}
{\small #1}
\end{adjustwidth}
}

\newcommand{\entryitemindent}[1]{
\begin{adjustwidth}{1.0cm}{}
\small{#1}
\end{adjustwidth}
\vspace{\parsep}}

%%%%%%%%%%%%%%
% Date calculations %
%%%%%%%%%%%%%%
% https://tex.stackexchange.com/a/14519
\usepackage{datenumber}
\usepackage{calc}

\newcounter{datetoday}
\newcounter{diffyears}
\newcounter{diffmonths}
\newcounter{diffdays}

\newcommand{\difftoday}[3]{%
      \setmydatenumber{datetoday}{\the\year}{\the\month}{\the\day}%
      \setmydatenumber{diffdays}{#1}{#2}{#3}%
      \addtocounter{diffdays}{-\thedatetoday}%
      \ifnum\value{diffdays}>0
        \def\diffbefore{}%
        \def\diffafter{}%
      \else
        \def\diffbefore{}%
        \def\diffafter{}%
        \setcounter{diffdays}{-\value{diffdays}}%
      \fi
      \setcounter{diffyears}{\value{diffdays}/365}%
      \setcounter{diffdays}{\value{diffdays}-365*\value{diffyears}}%
      \setcounter{diffmonths}{\value{diffdays}/30}%
      \setcounter{diffdays}{\value{diffdays}-30*\value{diffmonths}}%
      %
      \diffbefore
      \ifnum\value{diffyears}=0
      \else
        \ifnum\value{diffyears}>1
          \ifnum\value{diffmonths}=0
            \thediffyears\space years%
          \else
          \thediffyears\space years, %
        \fi
        \else
          \ifnum\value{diffmonths}=0
            \thediffyears\space year%
          \else
          \thediffyears\space year, %
        \fi
        \fi
      \fi
      \ifnum\value{diffmonths}=0
      \else
        \ifnum\value{diffmonths}>1
            \thediffmonths\space months%
        \else
            \thediffmonths\space month%
        \fi
      \fi
      \diffafter
}

\newcommand{\diffdates}[6]{%
      \setmydatenumber{datetoday}{#4}{#5}{#6}%
      \setmydatenumber{diffdays}{#1}{#2}{#3}%
      \addtocounter{diffdays}{-\thedatetoday}%
      \ifnum\value{diffdays}>0
        \def\diffbefore{}%
        \def\diffafter{}%
      \else
        \def\diffbefore{}%
        \def\diffafter{}%
        \setcounter{diffdays}{-\value{diffdays}}%
      \fi
      \setcounter{diffyears}{\value{diffdays}/365}%
      \setcounter{diffdays}{\value{diffdays}-365*\value{diffyears}}%
      \setcounter{diffmonths}{\value{diffdays}/30}%
      \setcounter{diffdays}{\value{diffdays}-30*\value{diffmonths}}%
      %
      \diffbefore
      \ifnum\value{diffyears}=0
      \else
        \ifnum\value{diffyears}>1
          \ifnum\value{diffmonths}=0
            \thediffyears\space years%
          \else
          \thediffyears\space years, %
        \fi
        \else
          \ifnum\value{diffmonths}=0
            \thediffyears\space year%
          \else
          \thediffyears\space year, %
        \fi
        \fi
      \fi
      \ifnum\value{diffmonths}=0
      \else
        \ifnum\value{diffmonths}>1
            \thediffmonths\space months%
        \else
            \thediffmonths\space month%
        \fi
      \fi
      \diffafter
}

\newcommand{\difftodayyears}[3]{%
      \setmydatenumber{datetoday}{\the\year}{\the\month}{\the\day}%
      \setmydatenumber{diffdays}{#1}{#2}{#3}%
      \addtocounter{diffdays}{-\thedatetoday}%
      \ifnum\value{diffdays}>0
        \def\diffbefore{}%
        \def\diffafter{}%
      \else
        \def\diffbefore{}%
        \def\diffafter{}%
        \setcounter{diffdays}{-\value{diffdays}}%
      \fi
      \setcounter{diffyears}{\value{diffdays}/365}%
      \setcounter{diffdays}{\value{diffdays}-365*\value{diffyears}}%
      \setcounter{diffmonths}{\value{diffdays}/30}%
      \setcounter{diffdays}{\value{diffdays}-30*\value{diffmonths}}%
      %
      \diffbefore
      \ifnum\value{diffyears}=0
      \else
        \ifnum\value{diffyears}>1
            \thediffyears\space years%
        \else
            \thediffyears\space year%
        \fi
      \fi
      \diffafter
}


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

\RequirePackage[left=1.5cm,top=.5cm,right=1.5cm,bottom=.75cm,headsep=0.5cm,includehead,includefoot]{geometry}
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
