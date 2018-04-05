%!TEX encoding = UTF-8
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bachelor's thesis template of Zhejiang University          
%%  															
%% author: weiya <szcfweiya@gmail.com> 						
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zju-proposal}[2018/04/03 Thesis Proposal for Zhejiang University]
\LoadClass[a4paper,12pt,openany]{book}

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Page size
%% 
%% Refer to Section 2.3.2.4 of 浙江大学本科生毕业论文(设计)编写规则：
%%
%%   论文在打印和印刷时需纸张的四周留足空白边缘,每一面的上方和左侧分别留
%%   25mm以上间隙,下方和右侧留20mm以上间隙。
%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[left=2.5cm,right=2.0cm,top=2.5cm,bottom=2.0cm]{geometry}

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Headers and footer
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\title}[2]{\gdef\@titleown{#1}\gdef\@titlezju{#2}}
\RequirePackage{fancyhdr}
%% no header and footer at the first page
\fancypagestyle{firstpage}{%
	\fancyhf{} % clear fields
	\renewcommand{\headrulewidth}{0pt} % no line
	\renewcommand{\footrulewidth}{0pt} % no line
}
%% pagestyle in the main body
\fancypagestyle{followingpage}{%
	\fancyhf{} % clear fields
	% thesis title on the right header on the odd-number pages
	\fancyhead[RO]{\@titleown}
	\fancyhead[LE]{\@titlezju}
	% official name on the left header of the even-number pages	
	% page number on the center footer of all pages
	\fancyfoot[C]{\thepage}
	\renewcommand{\headrulewidth}{0.7pt}
	\renewcommand{\footrulewidth}{0pt}
}

\AtBeginDocument{\thispagestyle{firstpage}}
\AtBeginDocument{\assignpagestyle{\chapter}{followingpage}}
\pagestyle{followingpage}


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Font face and font size
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{xkeyval}%
\define@key{zju-proposal.cls}{fangfont}[]{%
  \def\fangfont{#1}%
}

\define@key{zju-proposal.cls}{heifont}[]{%
  \def\heifont{#1}%
}
\ExecuteOptionsX{fangfont,heifont}
\ProcessOptionsX%

%\newcommand{\myfonts}[2]{\def\@fang{#1}\def\@hei{#2}}
%\def\@fang{STFANGSO.TTF}
%\def\@hei{YaHeiConsolas.ttf}
\RequirePackage{xeCJK} 
\RequirePackage{fontspec} 
\xeCJKsetup{AutoFakeBold=1}
%% 仿宋
%\setCJKfamilyfont{fang}{STFANGSO.TTF}
%\setCJKfamilyfont{hei}{YaHeiConsolas.ttf}

\setCJKfamilyfont{fang}{\fangfont}
\setCJKfamilyfont{hei}{\heifont}


\newcommand*{\fang}{\CJKfamily{fang}}
\newcommand*{\hei}{\CJKfamily{hei}}

%\setCJKmainfont{simfang.ttf}
\newcommand{\chap}{\fontsize{16pt}{\baselineskip}\CJKfontspec[AutoFakeBold=5]{STFANGSO.TTF}\bfseries}     
\newcommand{\sect}{\fontsize{15pt}{\baselineskip}\CJKfontspec[AutoFakeBold=4]{STFANGSO.TTF}\bfseries}     
\newcommand{\subsec}{\fontsize{14pt}{\baselineskip}\CJKfontspec[AutoFakeBold=4]{STFANGSO.TTF}\bfseries}     
\newcommand{\xiaosihao}{\fontsize{12pt}{\baselineskip}\selectfont} 

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Section style
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titlesec}
\newcommand{\chapterbreak}{\clearpage}


%\renewcommand\chapter{\clearpage\@startsection
%	{chapter}{0}{\z@}%name, level, indent
%	{1.5\baselineskip}%             beforeskip
%	{1.5\baselineskip}%            afterskip
%	{\centering\chap}}% style

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

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% biblatex
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 注意放置顺序
\RequirePackage{csquotes}
\RequirePackage{xcolor} % DO NOT forget
\RequirePackage[backend=biber,citestyle=authoryear,sortcites=true,natbib]{biblatex}
%\RequirePackage{chapterbib}
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
%\defbibheading{secbib}[]{% rename and change style to section
\defbibheading{secbib}[参考文献]{%
  \section{#1}%
  \markboth{#1}{#1}}


\RequirePackage{zhnumber}

\renewcommand{\chaptername}{}

\renewcommand\thechapter{\zhnum{chapter}、} 

%\renewcommand{\thechapter}{\arabic{chapter}} 
\renewcommand\thesection{\arabic{section}}
\titleformat{\chapter}[hang]{\centering\chap}{\chaptertitlename\ \thechapter}{0pt}{}
\titlespacing*{\chapter}{0pt}{0pt}{40pt}

%% fix section number error
\RequirePackage{etoolbox}%
\makeatletter
\patchcmd{\ttlh@hang}{\parindent\z@}{\parindent\z@\leavevmode}{}{}%
\patchcmd{\ttlh@hang}{\noindent}{}{}{}%
\makeatother

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% table of contents
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{tocdepth}{6}
\setcounter{secnumdepth}{6}

\RequirePackage{titletoc}
\titleclass{\guide}{straight}[\part]
\titleclass{\assess}{straight}[\part]
\newcounter{assess}
\contentsmargin{0pt}
\titlecontents{guide}[0pc]{}{}{}{}[\addvspace{5pt}]
\titlecontents{assess}[0pc]{\addvspace{5pt}}{}{}{}
\titlecontents{chapter}[0pc]{\addvspace{3pt}\bfseries}{\thecontentslabel}{}{
	\titlerule*[1pc]{.}\thecontentspage}[\addvspace{3pt}]
%\titlecontents{section}[1.8pc]{\addvspace{3pt}\bfseries}{
%	\thecontentslabel }{}{\titlerule*[1pc]{.}\thecontentspage}
\titlecontents{section}[1.8pc]{\addvspace{3pt}\bfseries}{
	\contentslabel{1em}}{}{\titlerule*[1pc]{.}\thecontentspage}
\titlecontents{subsection}[3.8pc]{\small}{\thecontentslabel}{
	}{\titlerule*[1pc]{.} \thecontentspage}
\titlecontents{subsubsection}[5.8pc]{\small}{\thecontentslabel}{
	}{\titlerule*[1pc]{.} \thecontentspage}

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1.5 倍数行距
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{setspace}
\onehalfspacing

\renewcommand{\contentsname}{{\centerline{目\hspace*{1em}录}}}

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% numbering
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\theequation}{\arabic{equation}}

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% indent for the first paragraph
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{indentfirst}

%%　%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%　cover
%%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}
\newcommand\hp{\hspace{0.35em}}
\newcommand*{\makecover}
{	
	\begingroup 
	\begin{center}

		\includegraphics[width=0.8\textwidth]{zju-text.png}
		\\[1.2\baselineskip]
		%\vspace*{0.05\paperheight} % White space at the top of the page
		{\Huge{\hei\bfseries {本\hp 科\hp 生\hp 毕\hp 业\hp 论\hp 文（设\hp 计） \\[0.8\baselineskip]文献综述和开题报告}}}\\[1.2\baselineskip] % Title
		\includegraphics[width=0.35\textwidth]{xiaohui.jpg}
		\vspace*{3\baselineskip} % Whitespace between 
		\begin{table}[h!]
		  \begin{center}
			\begin{tabular}{ll} 
			\subsec{姓名与学号} & \underline{\hspace{5cm}}  \\[5ex]
			\subsec{指导教师} & \underline{\hspace{5cm}}\\[5ex]
			\subsec{年级与专业} & \underline{\hspace{5cm}}\\[5ex]
			\subsec{所在学院} & \underline{\hspace{5cm}}\\[5ex]
			\end{tabular}
		\end{center}
		\end{table}
		\vspace*{1\baselineskip}
	\end{center}
	\vfill
	\endgroup
}