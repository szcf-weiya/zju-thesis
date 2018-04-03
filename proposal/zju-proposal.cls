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
\RequirePackage{xeCJK} 
\RequirePackage{fontspec} 
\xeCJKsetup{AutoFakeBold=1}
%% 仿宋
\setCJKfamilyfont{fang}{STFANGSO.TTF}


\newcommand*{\fang}{\CJKfamily{fang}}
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
	{-\baselineskip}%             beforeskip
	{\baselineskip}%            afterskip
	{\sect}}% style

\renewcommand\subsection{\@startsection
	{subsection}{2}{\z@}%name, level, indent
	{-\baselineskip}%             beforeskip
	{1.5\baselineskip}%            afterskip
	{\subsec}}% style

\renewcommand\subsubsection{\@startsection
	{subsubsection}{3}{\z@}%name, level, indent
	{-\baselineskip}%             beforeskip
	{\baselineskip}%            afterskip
	{\subsec}}% style

%\renewcommand{\thechapter}{\CJK}
\RequirePackage{zhnumber}

\renewcommand{\chaptername}{}

\renewcommand\thechapter{\zhnum{chapter}、} 

%\renewcommand{\thechapter}{\arabic{chapter}} 
\renewcommand\thesection{\arabic{section}}
\titleformat{\chapter}[hang]{\centering\chap}{\chaptertitlename\ \thechapter}{0pt}{}
\titlespacing*{\chapter}{0pt}{0pt}{40pt}
%\titleformat{\section}{\xiaosanhao}{\thesection}{}{}
%\titleformat{\subsection}{\sihao}{\thesubsection}{}{}
%\titleformat{\subsubsection}{\sihao}{\thesubsubsection}{}{}
%% fix section number error
\usepackage{etoolbox}%
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
\titlecontents{guide}[0pc]{}{}{}{}[\addvspace{5pt}]
\titlecontents{assess}[0pc]{\addvspace{5pt}}{}{}{}
\titlecontents{chapter}[0pc]{\addvspace{3pt}\bfseries}{\thecontentslabel}{}{
	\titlerule*[1pc]{.}\thecontentspage}[\addvspace{3pt}]
\titlecontents{section}[1.8pc]{\addvspace{3pt}\bfseries}{
	\thecontentslabel}{}{\titlerule*[1pc]{.}\thecontentspage}
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
