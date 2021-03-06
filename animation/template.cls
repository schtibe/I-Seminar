%**********************************************************************************
%
% o   o   o   o          Berne University of Applied Sciences
%             :          Engineering and Information Technology
%             :......o   Computer Science Division
%
% OOPLSS - Object-Oriented Programming Language with Subtyping and Subclassing
% Ruben Bär, Stefan Heinemann
%******************************************************************************
\NeedsTeXFormat{LaTeX2e}\relax
\ProvidesClass{ooplssReport}[2011/03/03 Template for OOPLSS Documentation]

%% Load the book class with the following parameters:
%% a4 paper, 10pt, two side pages, titlepage
\DeclareOption{a4paper}{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\DeclareOption{oneside}{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\DeclareOption{twoside}{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\DeclareOption{titlepage}{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\DeclareOption{numbers}{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\DeclareOption{todo}{\def \showtodo {showtodo}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\ExecuteOptions{a4paper,11pt,titlepage}
\ProcessOptions\relax

%% Load reprt class
\LoadClass[numbers=noenddot]{scrreprt} % report better for pdf 


\usepackage[ngerman]{babel}
\usepackage{etex}
\usepackage{tocbasic}
\usepackage[utf8x]{inputenc}
\pdfminorversion=5

%
% Symbol Footnote without switch forth and back
%
\long\def\symbolfootnote[#1]#2{\begingroup%
\def\thefootnote{\fnsymbol{footnote}}\footnote[#1]{#2}\endgroup}

%
% Real empty pages between chapters on right side
%
%Copy cleadoublepage
\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{%
  \clearpage
  {\pagestyle{empty}\origdoublepage}%
}
% overwrite cleardoublepage with clearemptydoublepage
% Works because origdoublepage made a copy
\let\cleardoublepage\clearemptydoublepage

%
% Clear page for bibliography
%
\if@twoside
	\def \clrpage {\cleardoublepage}
\else
	\def \clrpage {\clearpage}
\fi

%
% Package for headers
%
\usepackage{fancyhdr}

%
% include graphics
%
\usepackage{graphicx}

%
% improved tabulars
%
\usepackage{array}
\usepackage{tabularx}

\usepackage{xcolor}
\usepackage{url}
\usepackage{lastpage}

%
% formatting the captions
%
\usepackage[hang,small,bf]{caption}

%
% Subfig
%
\usepackage{subfig}

%
% Package for formatting Listings
%
\usepackage{listings}
\renewcommand*\lstlistlistingname{List of Listings}
\definecolor{lbcolor}{rgb}{0.90,0.90,0.90}
\definecolor{commentcolor}{rgb}{0.0,0.80,0.0}
\lstset{ %
	float=h,
  language=Java,
  basicstyle=\footnotesize,
  numbers=left,
  numberstyle=\tiny,
  stepnumber=1,
 % numbersep=5pt,
  backgroundcolor=\color{white},
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  frame=single,
  tabsize=2,
  captionpos=b,
  breaklines=true,
  breakatwhitespace=false,
  escapeinside={/*}{*/},
	basicstyle=\ttfamily\footnotesize,
	keywordstyle=\color{blue}\bfseries,
	identifierstyle=\color{black},
	commentstyle=\color{commentcolor},
	stringstyle=\color{red}\ttfamily
}

%
% "define" OOPLSS (Based on scala syntax)
%
\lstdefinelanguage{ooplss}{
  morekeywords={abstract,case,catch,class,def,%
    do,else,extends,false,final,finally,%
    for,if,implicit,import,match,mixin,%
    new,null,object,override,package,%
    private,protected,requires,return,sealed,%
    super,this,throw,trait,true,try,self,base,__construct,%
    type,val,var,while,with,yield,MyType,subtypeOf,subclassOf},
  otherkeywords={=>,<-,<\#,<:,>:,\#,@},
  sensitive=true,
  escapeinside={\%}{)},
  morecomment=[l]{//},
  morecomment=[n]{/*}{*/},
  morestring=[b]",
%  morestring=[b]',
  morestring=[b]"""
}

%
% "define" Scala
%
\lstdefinelanguage{scala}{
  morekeywords={abstract,case,catch,class,def,%
    do,else,extends,false,final,finally,%
    for,if,implicit,import,match,mixin,%
    new,null,object,override,package,%
    private,protected,requires,return,sealed,%
    super,this,throw,trait,true,try,self,base,%
    type,val,var,while,with,yield},
  otherkeywords={=>,<-,<\#,<:,>:,@},
  sensitive=true,
  morecomment=[l]{//},
  escapeinside={/*}{*/},
%  morecomment=[n]{/*}{*/},
  morestring=[b]",
%  morestring=[b]',
  morestring=[b]"""
}

%
% Package for links (ref and cite), no box and blue
%
\usepackage[pdftex]{hyperref}
\usepackage{cleveref}
\usepackage{nameref}

%
% Rename "fig." to figure
%
\crefname{figure}{figure}{figures}
\Crefname{figure}{Figure}{Figures}
\crefname{subfigure}{figure}{figures}
\Crefname{subfigure}{Figure}{Figures}

%
% Nomenclatur
%
\usepackage[intoc,refpage]{nomencl}
\renewcommand{\nomname}{Glossary}
\renewcommand{\nomlabel}[1]{\textbf{#1}}

\def\@@@nomenclature[#1]#2#3{%
 \def\@tempa{#2}\def\@tempb{#3}%
 \protected@write\@nomenclaturefile{}%
  {\string\nomenclatureentry{#1\nom@verb\@tempa @[{\nom@verb\@tempa}]%
    |nompageref{\begingroup\nom@verb\@tempb\protect\nomeqref{\theequation}}}%
    {\thepage}}%
 \endgroup
 \@esphack}

\def\nompageref#1#2{%
  \if@printpageref\pagedeclaration{#2}\else\null\fi
  \linebreak#1\nomentryend\endgroup}

\def\pagedeclaration#1{\dotfill\nobreakspace\nobreakspace#1}
\def\nomentryend{.}
\def\nomlabel#1{\sffamily\bfseries{#1}\hfil}

\makenomenclature

%
% for reference to last page
%
\usepackage{lastpage}

%
% for image floating
%
\usepackage{wrapfig}
\usepackage{float}

%
% Numbering style
%
\bibliographystyle{alpha}
\pagenumbering{arabic}

% numbering depth
\setcounter{secnumdepth}{2}

%
% Titlepage
%
\renewcommand{\maketitle} {
    \begin{titlepage}
    \begin{flushright}
    \vspace*{4cm}
    %\includegraphics[height=4\baselineskip]{imgs/logo}\\ \vspace{0.2cm}
        \sffamily{\bfseries{ \Large \@subtitle}}\\
        \vspace{0.2cm}
        \sffamily{\bfseries{ \Huge \@title}}
        \vspace{0.6cm}
        \small \\
        Eine Seminararbeit an der Berner Fachhochschule Abteilung Technik und Informatik \\
        \vspace{0.1cm}
        von \@author\\
        betreut von Professor Jürgen Eckerle\symbolfootnote[3]{\href{mailto:juergen.eckerle@bfh.ch}{juergen.eckerle@bfh.ch}}\\
        \vspace{0.2cm}
        \@date
        \vspace{0.5cm}
    \hrule
    \end{flushright}
		\vfill
    %\includegraphics[height=\baselineskip]{imgs/by-sa}\\ \small{\sffamily{Licensed under the Creative Commons Attribution-ShareAlike 3.0 License}}
    \end{titlepage}
}

%
% Headers and footers
%
\pagestyle{fancy}
\fancyhf{}

% no numbers for sections and chapters in headers
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{#1}{}}

\if@twoside
	% even pages footer
	\fancyfoot[EL]{\thepage}
	% odd pages footer
	\fancyfoot[OR]{\thepage}
	% even pages header
	\fancyhead[EC] {
			%chapter name
			\rightmark
	}
	\fancyhead[EL] {
			%\includegraphics[height=2\baselineskip]{imgs/logo}
	}
	% odd pages header
	\fancyhead[OC] {
			%chapter name
			\leftmark
	}
	\fancyhead[OR]{
			%\includegraphics[height=2\baselineskip]{imgs/logo}
	}
\else
	\fancyfoot[C]{\thepage}
	\fancyhead[C] {
			%chapter name
			\rightmark
	}
	\fancyhead[R] {
			%\includegraphics[height=2\baselineskip]{imgs/logo}
	}
\fi


% Table of content not contents
%\renewcommand\contentsname{Table of Contents}

%\addtolength{\headheight}{2\baselineskip}
\addtolength{\headheight}{32pt}

%\renewcommand{\chaptermark}[1]{%
%\markboth{#1}{}}

% switch back to Latin Modern
\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage{amsthm}
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{ucs}
\usepackage{emp}
\usepackage{xspace}
\usepackage{relsize}

%
% Theorem environments
%
\theoremstyle{plain}% default
\newtheorem{thm}{Theorem}[section]
\newtheorem{lem}[thm]{Lemma}
\newtheorem{prop}[thm]{Proposition}
\newtheorem*{cor}{Corollary}

\theoremstyle{definition}
\newtheorem{defn}{Definition}[section]
\newtheorem{conj}{Conjecture}[section]
\newtheorem{exmp}{Example}[section]

\theoremstyle{remark}
\newtheorem*{rem}{Remark}
\newtheorem*{note}{Note}
\newtheorem{case}{Case}

%c C plus plus
\def\cpp{%
\if monospace%
    C++%
\else%
    C\kern-.1667em\raise.30ex\hbox{\smaller{++}}%
\fi%
\xspace }

%c C sharp
\def\cs{%
\if monospace%
    C$\sharp$%
\else%
    C\raise.30ex\hbox{\smaller{$\sharp$}}%
\fi%
\xspace }

%
% Some shortcuts
%
\def \match {<\#\xspace}
\def \mmatch {<\!\!\#~}
\def \subt {\vartriangleleft}
\def \subc {\blacktriangleleft}
\def \subtc {\trianglelefteq} % Closure
\def \subcc {~\underline{\blacktriangleleft}~} % Closure
\def \mytype {\emph{MyType}\xspace}
\def \self {\emph{self}\xspace}
\def \base {\emph{base}\xspace}
\def \Self {\emph{Self}\xspace}
\def \Base {\emph{Base}\xspace}
\def \A {\emph{A}\xspace}
\def \B {\emph{B}\xspace}
\def \C {\emph{C}\xspace}
\def \D {\emph{D}\xspace}
\def \E {\emph{E}\xspace}
\def \T {\emph{T}\xspace}
\def \X {\emph{X}\xspace}
\def \Y {\emph{Y}\xspace}
\def \Z {\emph{Z}\xspace}
\def \subclassOf {\emph{subclassOf}\xspace}
\def \subtypeOf {\emph{subtypeOf}\xspace}
\def \object {$\emph{Object}$\xspace}
\def \st {$\emph{StringTemplate}$\xspace}
\def \ra {$\rightarrow$\xspace}
\def \lra {$\longrightarrow$\xspace}
\newcommand{\oper}[1]{\textit{Oper}$\langle$#1$\rangle$}
\newcommand{\type}[1]{\textit{Type}$\langle$#1$\rangle$}

% this is apparently used for the metauml stuff
\ifx\pdftexversion\undefined
\usepackage[dvips]{graphicx}
\else
\usepackage{graphicx}
\DeclareGraphicsRule{*}{mps}{*}{}
\fi

%
% A TO DO List
%
\ifx \showtodo \undefined
  \newcommand{\todo}[1]{}
	\newcommand{\listoftodos}{}
\else
	\newcommand{\todo}[1]{
	% Add to to do list
	\addcontentsline{tdo}{todo}{\protect{#1}}
	%
	\begin{tikzpicture}[remember picture, baseline=-0.75ex]
			\node [coordinate] (inText) {};
	\end{tikzpicture}
	%
	% Make the margin par
	\marginpar{
			\begin{tikzpicture}[remember picture]
					\definecolor{orange}{rgb}{1,0.5,0}
					\draw node[font=\footnotesize, draw=black, fill=orange, text width = 2.2cm] (inNote) {#1};
			\end{tikzpicture}
	}
	%
	\begin{tikzpicture}[remember picture, overlay,>=stealth]
			\draw[draw = orange, thick]
					([yshift=-0.2cm] inText)
							-| ([xshift=-0.2cm] inNote.west)
							-| (inNote.west);
	\end{tikzpicture}
	%
	}

	% TO DO List
	\makeatletter \newcommand \listoftodos{\clrpage \@starttoc{tdo}}
		\newcommand\l@todo[2]
		{\par\noindent \textit{#2}, \parbox{10cm}{#1}\par} \makeatother
\fi

% journal itemize
\newenvironment{journal}%
  {\vspace{-0.45cm}
    \begin{itemize}%
      \setlength{\itemsep}{0pt}%
      \setlength{\parskip}{0pt}}%
  {\end{itemize}}


\newcommand{\squishlist}{
 \begin{itemize}
   \setlength{\itemsep}{0pt}
   \setlength{\parsep}{2pt}
   \setlength{\topsep}{2pt}
   \setlength{\partopsep}{0pt}
   \setlength{\labelsep}{0.5em}
	}

\newcommand{\squishend}{
  \end{itemize}  }


\makeatletter
\renewcommand*{\dotfill}{%
  \leavevmode\leaders
  \hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}
  \hfill\kern\z@
}
\makeatother

\newcolumntype{?}{>{\global\let\currentrowstyle\relax}}
\newcolumntype{!}{>{\currentrowstyle}}
\newcommand{\rowstyle}[1]{\gdef\currentrowstyle{#1}%
  #1\ignorespaces
}
