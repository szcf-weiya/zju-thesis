%%
%% This is file `zju-thesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% zju-thesis.dtx  (with options: `cls')
%% 
%% This is a generated file.
%% 
%% Copyright 2017 by szcf-weiya <szcfweiya@gmail.com>
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zju-thesis}
 [2018/04/10 v1.0 Thesis Template for Zhejiang University]

\hyphenation{zju-thesis}
\def\zjuthesis{\textsc{zju-thesis}}
\def\version{1.0}
\LoadClass[a4paper,12pt,openany]{book}
\RequirePackage{xkeyval}
\newif\ifzju@fang
\newif\ifzju@hei
\newif\ifzju@blind
\zju@fangfalse
\zju@heifalse
\zju@blindfalse
\RequirePackage{ifthen}
\DeclareOptionX{fangfont}{\def\fangfont{#1}\zju@fangtrue}%
\DeclareOptionX{heifont}{\def\heifont{#1}\zju@heitrue}%
\DeclareOptionX{blind}{\zju@blindtrue}
\ProcessOptionsX%
\ifzju@fang\relax\else
    \ClassError{zju-thesis}{%
                    Please specify fang font in option
                    }{}
\fi
\ifzju@hei\relax\else
    \ClassError{zju-thesis}{%
                    Please specify hei font in option
                    }{}
\fi
\RequirePackage{xeCJK}
\RequirePackage{fontspec}
\xeCJKsetup{AutoFakeBold=1}

\setCJKfamilyfont{fang}{\fangfont}
\setCJKfamilyfont{hei}{\heifont}

\newcommand*{\fang}{\CJKfamily{fang}}
\newcommand*{\hei}{\CJKfamily{hei}}

\setCJKmainfont{\fangfont}
\newcommand{\partheifont}{\fontsize{48pt}{\baselineskip}
        \CJKfontspec[AutoFakeBold=false]{\heifont}\bfseries}
\newcommand{\partfangfont}{\fontsize{36pt}{\baselineskip}
        \CJKfontspec[AutoFakeBold=4]{\fangfont}\bfseries}
\newcommand{\sanhao}{\fontsize{16pt}{\baselineskip}\selectfont}
\newcommand{\chap}{\@ifstar%
    {\fontsize{16pt}{\baselineskip}\CJKfontspec[AutoFakeBold=false]{\fangfont}\sanhao}
    {\fontsize{16pt}{\baselineskip}\CJKfontspec[AutoFakeBold=4]{\fangfont}\bfseries}}
\newcommand{\sect}{\@ifstar%
    {\fontsize{15pt}{\baselineskip}\CJKfontspec[AutoFakeBold=false]{\fangfont}}
    {\fontsize{15pt}{\baselineskip}\CJKfontspec[AutoFakeBold=4]{\fangfont}\bfseries}}
\newcommand{\subsec}{\@ifstar
    {\fontsize{14pt}{\baselineskip}\CJKfontspec[AutoFakeBold=false]{\fangfont}\bfseries}
    {\fontsize{14pt}{\baselineskip}\CJKfontspec[AutoFakeBold=4]{\fangfont}\bfseries}}
\newcommand{\xiaosihao}{\fontsize{12pt}{\baselineskip}\CJKfontspec[AutoFakeBold=false]{\fangfont}}
\newcommand{\wuhao}{\fontsize{10.5pt}{\baselineskip}\CJKfontspec[AutoFakeBold=false]{\fangfont}}
\RequirePackage[left=2.5cm,right=2.0cm,top=2.5cm,bottom=2.0cm]{geometry}

\renewcommand{\title}[2]{\gdef\titleown{#1}\gdef\titlezju{#2}}
\ifzju@blind%
    \renewcommand{\author}[2]{\gdef\name{\relax}\gdef\stuid{\relax}}
    \newcommand{\grade}[2]{\gdef\grade{\relax}\gdef\major{\relax}}
    \newcommand{\school}[1]{\gdef\school{\relax}}
    \newcommand{\mentor}[1]{\gdef\mentor{\relax}}
\else%
    \renewcommand{\author}[2]{\gdef\name{#1}\gdef\stuid{(#2)}}
    \newcommand{\grade}[2]{\gdef\grade{#1}\gdef\major{#2}}
    \newcommand{\school}[1]{\gdef\school{#1}}
    \newcommand{\mentor}[1]{\gdef\mentor{#1}}
\fi
\renewcommand{\date}[1]{\gdef\date{#1}}

\RequirePackage{fancyhdr}
\fancypagestyle{firstpage}{%
\fancyhf{} % clear fields
\renewcommand{\headrulewidth}{0pt} % no line
\renewcommand{\footrulewidth}{0pt} % no line
}
\fancypagestyle{guidepage}{%
\fancyhf{} % clear fields
\renewcommand{\headrulewidth}{0.7pt} % no line
\renewcommand{\footrulewidth}{0pt} % no line
\fancyhead[R]{\titleown}
}
\fancypagestyle{promise}{%
\fancyhf{} % clear fields
\fancyhead[RO]{\titleown}
\fancyhead[LE]{\titlezju}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.7pt}
\renewcommand{\footrulewidth}{0pt}
  \pagenumbering{Roman}
}

\fancypagestyle{followingpage}{%
\fancyhf{} % clear fields
\fancyhead[RO]{\titleown}
\fancyhead[LE]{\titlezju}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.7pt}
\renewcommand{\footrulewidth}{0pt}
}

\AtBeginDocument{\thispagestyle{firstpage}}
\AtBeginDocument{\assignpagestyle{\chapter}{followingpage}}
\pagestyle{followingpage}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\RequirePackage[labelfont=bf,tableposition=top]{caption}
\RequirePackage{float}
\RequirePackage[explicit]{titlesec}
\newcommand{\chapterbreak}{\clearpage}

\renewcommand\section{\@startsection
{section}{1}{\z@}%name, level, indent
{-3.5ex \@plus -1ex \@minus -.2ex}%             beforeskip
{2.3ex \@plus.2ex}%            afterskip
{\sect}}% style

\renewcommand\subsection{\@startsection
{subsection}{2}{\z@}%name, level, indent
{-3.25ex\@plus -1ex \@minus -.2ex}%             beforeskip
{1.5ex \@plus .2ex}%            afterskip
{\subsec}}% style

\renewcommand\subsubsection{\@startsection
{subsubsection}{3}{\z@}%name, level, indent
{-3.25ex\@plus -1ex \@minus -.2ex}%             beforeskip
{1.5ex \@plus .2ex}%            afterskip
{\subsec}}% style
\RequirePackage{csquotes}
\RequirePackage{xcolor} % DO NOT forget
\RequirePackage[backend=biber,citestyle=authoryear,sortcites=true,natbib]{biblatex}
%% set citation color as blue
\DeclareCiteCommand{\cite}
  {\color{blue}\usebibmacro{prenote}}%
  {\usebibmacro{citeindex}%
   \usebibmacro{cite}}
  {\multicitedelim}
  {\usebibmacro{postnote}}
\DeclareCiteCommand{\parencite}[\mkcolorbibparens]
  {\usebibmacro{prenote}}%
  {\usebibmacro{citeindex}%
   \usebibmacro{cite}}
  {\multicitedelim}
  {\usebibmacro{postnote}}
\DeclareCiteCommand{\textcite}
  {\color{blue}
  \renewcommand*\nameyeardelim{\addspace}%
  \boolfalse{cbx:parens}%
   \renewcommand*{\finalnamedelim}{% <---- this is new
     \ifnumgreater{\value{liststop}}{2}{\finalandcomma}{}%
     \addspace\bibstring{and}\space}}
  {\usebibmacro{citeindex}%
   \iffirstcitekey
     {\setcounter{textcitetotal}{1}}
     {\stepcounter{textcitetotal}%
      \textcitedelim}%
   \usebibmacro{textcite}}
  {\ifbool{cbx:parens}
     {\bibcloseparen\global\boolfalse{cbx:parens}}
     {}}
  {\usebibmacro{textcite:postnote}}
\makeatletter
\newrobustcmd{\mkcolorbibparens}[1]{%
\begingroup
\color{blue}%
\blx@blxinit
\blx@setsfcodes
\bibopenparen#1\bibcloseparen
\endgroup}
\makeatother
\bibliography{ref.bib}
\addbibresource{ref.bib}
\defbibheading{chapbib}[参考文献]{%
  \chapter{#1}%
  \markboth{#1}{#1}}
\defbibheading{secbib}[参考文献]{%
  \section{#1}%
  \markboth{#1}{#1}}
\RequirePackage{zhnumber}
\RequirePackage{chngcntr}
\counterwithin{chapter}{part}
\counterwithin*{page}{part}

\AtBeginDocument{\assignpagestyle{\part}{empty}}
\renewcommand\thepart{第\zhnum{part}部分}
\renewcommand{\partname}{}
\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand{\thesection}{\arabic{chapter}.\arabic{section}}
\titleformat{\chapter}{\chap}{\thechapter}{1em}{#1}
\titlespacing*{\chapter}{0pt}{0pt}{2.3ex plus .2ex}

\makeatletter
\renewcommand{\part}{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi%
  \thispagestyle{empty}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi%
  \null\vfil%
  \secdef\@part\@spart%
}
\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
        \refstepcounter{part}%
        \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
        \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
    \interlinepenalty \@M
    \normalfont
    \ifnum \c@secnumdepth >-2\relax
    {\partheifont \partname\nobreakspace\thepart}
    \par
    \vskip 72\p@
    \fi
    {\partfangfont #2}\par}%
    \@endpart\pagenumbering{arabic}} % add 20180513 20:58
\makeatother




%% fix section numbering bug
\RequirePackage{etoolbox}%
\makeatletter
\patchcmd{\ttlh@hang}{\parindent\z@}{\parindent\z@\leavevmode}{}{}%
\patchcmd{\ttlh@hang}{\noindent}{}{}{}%
\makeatother
\setcounter{tocdepth}{6}
\setcounter{secnumdepth}{6}
\RequirePackage{titletoc}

\titleclass{\alonepage}{straight}[\part]
\newcounter{alonepage}
\titleclass{\contabpage}{straight}[\part]
\newcounter{contabpage}
\contentsmargin{0pt}
\titlecontents{alonepage}[0pc]{}{}{}{}
\titlecontents{contabpage}[0pc]{}{}{}{\titlerule*[1pc]{.}\thecontentspage}
\titlecontents{part}[0pc]{\chap\bfseries}{}{}{}
\titlecontents{chapter}[0pc]{\addvspace{0pt}\hspace*{0pc}}{\thecontentslabel}{}{
\titlerule*[1pc]{.}\thecontentspage}%[\addvspace{3pt}]
\titlecontents{section}[2pc]{}{\makebox[0pt][l]{\hspace*{-2pc}\thecontentslabel}}{}{\titlerule*[1pc]{.}\thecontentspage}
\titlecontents{subsection}[3pc]{}{\makebox[0pt][l]{\hspace*{-3pc}\thecontentslabel}}{
}{\titlerule*[1pc]{.} \thecontentspage}
\titlecontents{subsubsection}[4pc]{\small}{\makebox[0pt][l]{\hspace{-4pc}\thecontentslabel}}{
}{\titlerule*[1pc]{.} \thecontentspage}

\titleformat{name=\chapter,numberless}{\chap\centering}{}{1em}{#1}
\preto{\chapter}{\def\leveltitle{\chaptertitle}}
\pretocmd{\@schapter}
  {\expandafter\gdef\leveltitle{#1}}
  {}{}
\newcommand{\keywords}[1]{%
  \ifthenelse{\equal{\chaptertitle}{Abstract}}{%
    \textbf{Key Words：}#1
  }{%
    \textbf{关键字：}#1
  }
}

\makeatletter
\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{\begingroup%
  \patchcmd{\@makeschapterhead}% <cmd>
    {\vspace*{50\p@}}% <search>
    {}% <replace>
    {}{}% <success><failure>
  \oldtableofcontents%
  \endgroup%
}
\makeatother
\renewcommand{\contentsname}{{\centerline{目\hspace*{1em}录}}}
\RequirePackage{setspace}
\spacing{1.5}
\RequirePackage{indentfirst}
\RequirePackage[title]{appendix}
\renewcommand\appendixname{附录}
\renewcommand\appendixtocname{附录}
\RequirePackage{graphicx}
\newcommand\hp{\hspace{0.35em}}
\newcommand*{\makecoverprop}
{
\begingroup
\begin{center}

\includegraphics[width=0.8\textwidth]{../assets/zju-text.png}
\\[1.2\baselineskip]
{\Huge{\hei\bfseries {本\hp 科\hp 生\hp 毕\hp 业\hp 论\hp 文（设\hp 计） \\[0.8\baselineskip]文献综述和开题报告}}}\\[1.2\baselineskip] % Title
\includegraphics[width=0.35\textwidth]{../assets/zju-xiaohui.jpg}
\vspace*{3\baselineskip} % Whitespace between
\begin{table}[h!]
  \begin{center}
\begin{tabular}{ll}
\subsec{姓名与学号} & \underline{\makebox[7cm][c]{\name (\stuid)}}  \\[5ex]
\subsec{指导教师} & \underline{\makebox[7cm][c]{\mentor}}\\[5ex]
\subsec{年级与专业} & \underline{\makebox[7cm][c]{\grade\major}}\\[5ex]
\subsec{所在学院} & \underline{\makebox[7cm][c]{\school}}\\[5ex]
\end{tabular}
\end{center}
\end{table}
\vspace*{1\baselineskip}
\end{center}
\vfill
\endgroup
\clearpage
}

\newcommand*{\makecover}
{
\begingroup
\begin{center}

\includegraphics[width=0.8\textwidth]{../assets/zju-text.png}
\\[1.2\baselineskip]
{\Huge{\hei\bfseries {本\hp 科\hp 生\hp 毕\hp 业\hp 论\hp 文（设\hp 计）}}}\\[1.2\baselineskip] % Title
\includegraphics[width=0.32\textwidth]{../assets/zju-xiaohui.jpg}\\[1\baselineskip]
        \chap{题目}\ \underline{\makebox[11cm][c]{\chap\titleown}} \\[1.8\baselineskip]
\begin{table}[h!]
  \begin{center}
\begin{tabular}{ll}
\chap{姓名与学号} & \underline{\makebox[7cm][c]{\chap*{\name \stuid}}}  \\[4ex]
\chap{指导教师} & \underline{\makebox[7cm][c]{\chap*{\mentor}}}\\[4ex]
\chap{年级与专业} & \underline{\makebox[7cm][c]{\chap*{\grade\major}}}\\[4ex]
\chap{所在学院} & \underline{\makebox[7cm][c]{\chap*{\school}}}\\[8ex]
            \chap{提交日期} & \underline{\makebox[7cm][c]{\chap*{\date}}}\\[4ex]
\end{tabular}
\end{center}
\end{table}
\vspace*{1\baselineskip}
\end{center}
\vfill
\endgroup
\clearpage
}
\RequirePackage{longtable}
\newcommand\file[1]{\textsf{#1}}
\RequirePackage{pdfpages}
\RequirePackage[ruled,linesnumbered]{algorithm2e}
\SetAlgoCaptionSeparator{\quad}
\SetAlgorithmName{算法}{算法}{算法}

\endinput
%%
%% End of file `zju-thesis.cls'.
