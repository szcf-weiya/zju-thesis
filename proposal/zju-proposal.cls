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
\renewcommand{\title}[2]{\gdef\titleown{#1}\gdef\titlezju{#2}}
\renewcommand{\author}[2]{\gdef\name{#1}\gdef\stuid{#2}}
\newcommand{\grade}[2]{\gdef\grade{#1}\gdef\major{#2}}
\newcommand{\school}[1]{\gdef\school{#1}}
\newcommand{\mentor}[1]{\gdef\mentor{#1}}
\RequirePackage{fancyhdr}
%% no header and footer at the first page
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
%% pagestyle in the main body
\fancypagestyle{followingpage}{%
	\fancyhf{} % clear fields
	% thesis title on the right header on the odd-number pages
	\fancyhead[RO]{\titleown}
	\fancyhead[LE]{\titlezju}
	% official name on the left header of the even-number pages	
	% page number on the center footer of all pages
	\fancyfoot[C]{\thepage}
	\renewcommand{\headrulewidth}{0.7pt}
	\renewcommand{\footrulewidth}{0pt}
}

\AtBeginDocument{\thispagestyle{firstpage}}
\AtBeginDocument{\assignpagestyle{\chapter}{followingpage}}
%\AtBeginDocument{\assignpagestyle{\guide}{followingpage}}
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

\RequirePackage{xeCJK} 
\RequirePackage{fontspec} 
\xeCJKsetup{AutoFakeBold=1}

\setCJKfamilyfont{fang}{\fangfont}
\setCJKfamilyfont{hei}{\heifont}

\newcommand*{\fang}{\CJKfamily{fang}}
\newcommand*{\hei}{\CJKfamily{hei}}

\setCJKmainfont{\fangfont}

% 三号仿宋加粗
\newcommand{\chap}{\fontsize{16pt}{\baselineskip}\CJKfontspec[AutoFakeBold=5]{\fangfont}\bfseries} 
% 小三号仿宋加粗
\newcommand{\sect}{\fontsize{15pt}{\baselineskip}\CJKfontspec[AutoFakeBold=4]{\fangfont}\bfseries} % 四号仿宋加粗    
\newcommand{\subsec}{\fontsize{14pt}{\baselineskip}\CJKfontspec[AutoFakeBold=4]{\fangfont}\bfseries}
% 小四号仿宋（正文字体）     
\newcommand{\xiaosihao}{\fontsize{12pt}{\baselineskip}\CJKfontspec[AutoFakeBold=false]{\fangfont}} 

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

%\renewcommand{\thechapter}{\CJK}

%% 注意放置顺序
\RequirePackage[american]{babel}
\RequirePackage{csquotes}
\RequirePackage{xcolor} % DO NOT forget
\RequirePackage[backend=biber,citestyle=authoryear,sortcites=true,natbib,sorting=nyt,style=apa]{biblatex}
%% set citation color as blue
\DeclareCiteCommand{\textcite}
  {\color{blue}
    \usebibmacro{cite:init}%
   \usebibmacro{prenote}}
  {\usebibmacro{citeindex}%
   \usebibmacro{textcite}}
  {}
  {\usebibmacro{textcite:postnote}%
   \usebibmacro{cite:post}}
  \DeclareCiteCommand{\cite}
  {\color{blue}
    \usebibmacro{cite:init}%
   \usebibmacro{prenote}}
  {\usebibmacro{citeindex}%
   \usebibmacro{cite}}
  {}
  {\usebibmacro{postnote}%
   \usebibmacro{cite:post}}
\DeclareCiteCommand{\parencite}[\mkbibparens]
  {\renewcommand{\finalnamedelim}{\ifnum\value{liststop}>2 \finalandcomma\fi\addspace\&\space}%
  \color{blue}
   \usebibmacro{cite:init}%
   \usebibmacro{prenote}}
  {\usebibmacro{citeindex}%
   \usebibmacro{cite}}
  {}
  {\usebibmacro{postnote}%
   \usebibmacro{cite:post}}
\DeclareLanguageMapping{american}{american-apa}
%\patchcmd{\thebibliography}{\chapter*}{\section*}{}{}
\bibliography{ref.bib}
\addbibresource{ref.bib}
%\defbibheading{secbib}[]{% rename and change style to section
\defbibheading{secbib}[参考文献]{%
  \section{#1}%
  \markboth{#1}{#1}}


\RequirePackage{zhnumber}

%\renewcommand{\chaptername}{}
\addto\captionsamerican{\renewcommand{\chaptername}{}}


\renewcommand\thechapter{\zhnum{chapter}、} 

%\renewcommand{\thechapter}{\arabic{chapter}} 
\renewcommand\thesection{\arabic{section}}
\titleformat{\chapter}[hang]{\centering\chap}{\chaptertitlename\ \thechapter}{0pt}{}
\titlespacing*{\chapter}{0pt}{0pt}{40pt}
%\titleformat{\section}{\sect}{\sectiontitlename\ \thesection}{1em}{}
%\titleformat{\subsection}{\sihao}{\thesubsection}{}{}
%\titleformat{\subsubsection}{\sihao}{\thesubsubsection}{}{}
%% fix section number error
\RequirePackage{etoolbox}%
\makeatletter
\patchcmd{\ttlh@hang}{\parindent\z@}{\parindent\z@\leavevmode}{}{}%
\patchcmd{\ttlh@hang}{\noindent}{}{}{}%
\makeatother
%\makeatletter
%% \patchcmd{<cmd>}{<search>}{<replace>}{<success>}{<failure>}
%% --- Patch \chapter
%\patchcmd{\@makechapterhead}{50\p@}{\chapheadtopskip}{}{}% Space from top of page to CHAPTER X
%\patchcmd{\@makechapterhead}{20\p@}{\chapheadsep}{}{}% Space between CHAPTER X and CHAPTER TITLE
%\patchcmd{\@makechapterhead}{40\p@}{\chapheadbelowskip}{}{}% Space between CHAPTER TITLE and text
%% --- Patch \chapter*
%\patchcmd{\@makeschapterhead}{50\p@}{\chapheadtopskip}{}{}% Space from top of page to CHAPTER TITLE
%\patchcmd{\@makeschapterhead}{40\p@}{\chapheadbelowskip}{}{}% Space between CHAPTER TITLE and text
%% Set new lengths
%\newlength{\chapheadtopskip}\setlength{\chapheadtopskip}{-10pt}
%\newlength{\chapheadsep}\setlength{\chapheadsep}{0pt}
%\newlength{\chapheadbelowskip}\setlength{\chapheadbelowskip}{5pt}
%\makeatother
\setcounter{tocdepth}{6}
\setcounter{secnumdepth}{6}

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% table of contents
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titletoc}
\titleclass{\guide}{straight}[\part]
\titleclass{\assess}{straight}[\part]
\newcounter{assess}
\contentsmargin{0pt}
\titlecontents{guide}[0pc]{}{}{}{}[\addvspace{0pt}]
\titlecontents{assess}[0pc]{\addvspace{0pt}}{}{}{}
\titlecontents{chapter}[0pc]{\addvspace{0pt}\bfseries}{\thecontentslabel}{}{
	\titlerule*[1pc]{.}\thecontentspage}[\addvspace{3pt}]
%\titlecontents{section}[1.8pc]{\addvspace{3pt}\bfseries}{
%	\thecontentslabel }{}{\titlerule*[1pc]{.}\thecontentspage}
\titlecontents{section}[1.8pc]{\addvspace{3pt}\bfseries}{
	\contentslabel{1em}}{}{\titlerule*[1pc]{.}\thecontentspage}
\titlecontents{subsection}[3.8pc]{\small}{\contentslabel{1.8em}}{
	}{\titlerule*[1pc]{.} \thecontentspage}
\titlecontents{subsubsection}[5.8pc]{\small}{\contentslabel{2.4em}}{
	}{\titlerule*[1pc]{.} \thecontentspage}

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1.5 倍数行距
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{setspace}
%\onehalfspacing
%\linespread{1.5}
%\setstretch{1.5}
\spacing{1.5}

\addto\captionsamerican{\renewcommand{\contentsname}{\centerline{目\hspace*{1em}录}}}

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% numbering
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\theequation}{\arabic{equation}}
%\RequirePackage{chngcntr}
%\counterwithout{equation}{chapter} % without chapter number
%\RequirePackage[american]{babel}
%\RequirePackage[style=apa,backend=biber,sortcites=true,citestyle=authoryear,natbib]{biblatex}

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
			\subsec{姓名与学号} & \underline{\makebox[5cm][c]{\name (\stuid)}}  \\[5ex]
			\subsec{指导教师} & \underline{\makebox[5cm][c]{\mentor}}\\[5ex]
			\subsec{年级与专业} & \underline{\makebox[5cm][c]{\grade\major}}\\[5ex]
			\subsec{所在学院} & \underline{\makebox[5cm][c]{\school}}\\[5ex]
			\end{tabular}
		\end{center}
		\end{table}
		\vspace*{1\baselineskip}
	\end{center}
	\vfill
	\endgroup
	\clearpage
}

\setcounter{page}{-1}