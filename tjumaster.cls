%% FileName = tjumaster.cls
%% CreatedBy = Doris Yang
%% CreatedDate = 11/12/2014
%% ModifiedBy = Chris
%% ModifiedDate = 02/22/2015

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{tjumaster}[03/08/2015 Chris]

%----------------------------------------------------------%
%                    General Settings                      %
%----------------------------------------------------------%

\LoadClass[a4paper,twoside]{article}

\RequirePackage{etoolbox}
\RequirePackage{verbatim}
\RequirePackage[top=2.54cm, bottom=2.54cm, left=3.17cm, right=3.17cm]{geometry}
\RequirePackage{indentfirst}
\RequirePackage{blindtext}

\setcounter{secnumdepth}{4}  % Set paragraph as 4th depth
\setlength{\parindent}{2em}  % Indentation for first line
\let\cleardoublepage\clearpage  % For twosided book

%----------------------------------------------------------%
%                         Fonts                            %
%----------------------------------------------------------%

\RequirePackage{fontspec}
\RequirePackage{xltxtra,xunicode}
\RequirePackage[slantfont,boldfont,CJKnumber]{xeCJK}

\setCJKmainfont{SimSun}
\setCJKsansfont{SimSun}

\newCJKfontfamily[song]\song{SimSun}
\newCJKfontfamily[hei]\hei{Heiti SC}
\newCJKfontfamily[kai]\kai{Kaiti SC}
\newCJKfontfamily[fangsong]\fangsong{STFangsong}
\newCJKfontfamily[li]\li{Libian SC}

\setmainfont{Times New Roman}
\setsansfont{Arial}

\newcommand{\arial}{\fontspec{Arial}\selectfont}
\newcommand{\timesnew}{\fontspec{Times New Roman}\selectfont}

\newcommand{\chuhao}{\fontsize{42pt}{\baselineskip}\selectfont}
\newcommand{\xiaochu}{\fontsize{36pt}{\baselineskip}\selectfont}
\newcommand{\yihao}{\fontsize{26pt}{\baselineskip}\selectfont}
\newcommand{\xiaoyi}{\fontsize{24pt}{\baselineskip}\selectfont}
\newcommand{\erhao}{\fontsize{22pt}{\baselineskip}\selectfont}
\newcommand{\xiaoer}{\fontsize{18pt}{\baselineskip}\selectfont}
\newcommand{\sanhao}{\fontsize{16pt}{\baselineskip}\selectfont}
\newcommand{\xiaosan}{\fontsize{15pt}{\baselineskip}\selectfont}
\newcommand{\sihao}{\fontsize{14pt}{\baselineskip}\selectfont}
\newcommand{\xiaosi}{\fontsize{12pt}{\baselineskip}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{\baselineskip}\selectfont}
\newcommand{\xiaowu}{\fontsize{9pt}{\baselineskip}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5pt}{\baselineskip}\selectfont}
\newcommand{\qihao}{\fontsize{5.5pt}{\baselineskip}\selectfont}
\newcommand{\bahao}{\fontsize{5pt}{\baselineskip}\selectfont}
\renewcommand{\normalsize}{\fontsize{12pt}{20pt}\selectfont}

%----------------------------------------------------------%
%                        Page Style                        %
%----------------------------------------------------------%

\RequirePackage{fancyhdr}

% Leave plain page style for TOC
% Do NOT change plain page style for other pages
\fancypagestyle{plain}{
  \fancyhead{}
  \fancyhead[LE,RO]{\song \wuhao 同济大学\hspace*{0.5em}硕士学位论文\hspace*{0.5em}目录}
  \pagenumbering{Roman}
  \setcounter{page}{3}  % Manually set page number for TOC
}

\newcommand{\covermatter}{
  \pagestyle{empty}
}

\newcommand{\frontmatter}{
  \pagenumbering{Roman}
  \setcounter{page}{1}
  \pagestyle{fancy}
}

\newcommand{\mainmatter}{
  \makeatletter
  \renewcommand{\sectionmark}[1]{ \markboth{##1}{} }
  \fancyhead[RO]{\song \wuhao
      第 \thesection 章\hspace*{0.5em}\leftmark}
  \fancyhead[LE]{\song \wuhao
      同济大学\hspace*{0.5em}硕士学位论文\hspace*{0.5em}\thesis@ctitle}
  \pagenumbering{arabic}
  \setcounter{page}{1}
  \makeatother
}

\newcommand{\backmatter}{
  \pagestyle{fancy}
}

%----------------------------------------------------------%
%                      Table/Chart                         %
%----------------------------------------------------------%
%TODO

%\newcommand{/tabincell}[2]{/begin{tabular}{@{}#1@{}}#2/end{tabular}}
%表格换行支持

\renewcommand\tablename{表}
\renewcommand\figurename{图}

%带章节号的图表
%comment掉qihang版
%  \makeatletter
%   \renewcommand{\thefigure}{\ifnum \c@section>\z@ \thesection.\fi \@arabic\c@figure}
%   \renewcommand{\thetable}{\ifnum \c@section>\z@ \thesection.\fi \@arabic\c@table}
% \makeatother

\renewcommand{\thefigure}{\thesection.\arabic{figure}}
\renewcommand{\thetable}{\thesection.\arabic{table}}
\renewcommand{\theequation}{\thesection.\arabic{equation}}

%图表目录
%\patchcmd{\listoffigures}{\section*}{\subsection*}{}{}
%\renewcommand{\listfigurename}{图目录}
%
%\patchcmd{\listoftables}{\section*}{\subsection*}{}{}
%\renewcommand{\listtablename}{表目录}
%\thispagestyle{appendix}

%----------------------------------------------------------%
%                        Thesis Info                       %
%----------------------------------------------------------%

% Pervert!
\def \thesis@define #1{
  \expandafter \def \csname #1\endcsname ##1{%
    \expandafter \def \csname thesis@#1\endcsname{##1}
  }
  \csname #1\endcsname{}
}

% \def \thesistype #1{\def thesis@thesistype {#1}}
% \thesistype{}
% <==>
% \def thesis@thesistype {}
\thesis@define{thesistype}

\thesis@define{ctitle}
\thesis@define{etitle}
\thesis@define{vtitle} % English letter is followed by a space

\thesis@define{csubtitle}
\thesis@define{esubtitle}

\thesis@define{cauthor}
\thesis@define{eauthor}

\thesis@define{studentid}

\thesis@define{cdepartment}
\thesis@define{edepartment}

\thesis@define{cdiscipline}
\thesis@define{ediscipline}

\thesis@define{cmajor}
\thesis@define{emajor}

\thesis@define{csupervisor}
\thesis@define{esupervisor}

\thesis@define{cvicesupervisor}
\thesis@define{evicesupervisor}

\thesis@define{cdate}
\thesis@define{edate}

%----------------------------------------------------------%
%                         Cover                            %
%----------------------------------------------------------%

\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{array}

\newcommand{\thesis@cncover}{
  \begin{center}
    \vspace*{0.6cm}
    \includegraphics[width=10cm, height=2.6cm]{tongjilogo.jpg} \\
    \vspace*{0.6cm}
    {\li \erhao \bfseries 硕士学位论文} \\
    \vspace*{0.4cm}
    \ifdefempty{\thesis@thesistype}{}{{\bfseries \li \sihao \thesis@thesistype}} \\
    \vspace*{1.8cm}
    {\hei \erhao \bfseries \thesis@ctitle} \\
    \vspace*{3.95cm}
    \begin{table}[ht]
      \fangsong \sanhao
      \centering
      \begin{tabular}{ll}
        姓\hspace{2em}名：& \thesis@cauthor \\[0.4cm]
        学\hspace{2em}号：& \thesis@studentid \\[0.4cm]
        所在院系：& \thesis@cdepartment \\[0.4cm]
        职业类型：& \thesis@cdiscipline\\[0.4cm]
        专业领域：& \thesis@cmajor \\[0.4cm]
        指导教师：& \thesis@csupervisor \\[0.4cm]
        副指导教师：& \thesis@cvicesupervisor \\[0.4cm]
      \end{tabular}
    \end{table}
    \vspace*{0.7cm}
    {\sanhao \song \thesis@cdate}
  \end{center}
}

\newcommand{\thesis@encover}{
  \begin{center}
    \vspace*{1cm}
    \includegraphics[width=10cm, height=2.6cm]{tongjilogo.jpg} \\
    \vspace*{1em}
    \begin{spacing}{1.6}
    \timesnew \sihao
    A dissertation submitted to \\
    Tongji University in comformity with the requirements for \\
    the degree of Master of Computer Science \\
    \end{spacing}
    \vspace*{1cm}
    {\arial \xiaoer \bfseries \thesis@etitle} \\
    \vspace*{3cm}
    \begin{table}[ht]
      \timesnew \sanhao
      \centering
      \begin{tabular}{ll}
        Candidate: & \thesis@eauthor \\[0.4cm]
        Student Number: & \thesis@studentid \\[0.4cm]
        School/Department: & \thesis@edepartment \\[0.4cm]
        Discipline: & \thesis@ediscipline \\[0.4cm]
        Major: & \thesis@emajor \\[0.4cm]
        Supervisor: & \thesis@esupervisor \\[0.4cm]
      \end{tabular}
    \end{table}
    \vspace*{1.5cm}
    {\song \sanhao \thesis@edate}
  \end{center}
}

\newcommand{\thesis@titlepage}{
  \begin{table}
    \centering
    \vspace*{-1cm}
    \fangsong \bfseries \sihao
    \begin{tabular}{|m{1em}<{\centering}|}
      \hline
      \vspace*{1cm}
      \ifdefempty{\thesis@vtitle}{\thesis@ctitle}{\thesis@vtitle} \\
      \vspace*{0.5cm}
      \thesis@cauthor
      \vspace*{0.5cm}
      同济大学
      \vspace*{1em}\\
      \hline
    \end{tabular}
  \end{table}
}

\newcommand{\thesis@authpage}{
  \vspace*{0.5cm}
  \begin{center}
    \hei \xiaoer \bfseries
    学位论文版权使用授权书\\
  \end{center}
  \vspace*{0.5cm}
  \begin{spacing}{1.65}
    \song \sihao
    本人完全了解同济大学关于收集、保存、使用学位论文的规定，
    同意如下各项内容：按照学校要求提交学位论文的印刷本和电子版
    本；学校有权保存学位论文的印刷本和电子版，并采用影印、缩印、
    扫描、数字化或其它手段保存论文；学校有权提供目录检索以及提供
    本学位论文全文或者部分的阅览服务；学校有权按有关规定向国家有
    关部门或者机构送交论文的复印件和电子版；在不以赢利为目的的前
    提下，学校可以适当复制论文的部分或全部内容用于学术活动。\\
  \end{spacing}
  \begin{flushright}
    \song \sihao \linespread{1.5} \selectfont
    学位论文作者签名：\hspace*{3cm} \\
    年 \hspace{2em} 月 \hspace{2em} 日 \hspace*{2em} \\
  \end{flushright}
}

\newcommand{\thesis@originpage}{
  \vspace*{0.5cm}
  \begin{center}
    \hei \xiaoer \bfseries
    同济大学学位论文原创性声明\\
  \end{center}
  \vspace*{0.5cm}
  \begin{spacing}{1.65}
    \song \sihao
    本人郑重声明:所呈交的学位论文,是本人在导师指导下,进行
    研究工作所取得的成果。除文中已经注明引用的内容外,本学位论文
    的研究成果不包含任何他人创作的、已公开发表或者没有公开发表的
    作品的内容。对本论文所涉及的研究工作做出贡献的其他个人和集
    体,均已在文中以明确方式标明。本学位论文原创性声明的法律责任由本人承担。\\
  \end{spacing}
  \begin{flushright}
    \song \sihao \linespread{1.5} \selectfont
    学位论文作者签名：\hspace*{3cm} \\
    年 \hspace*{2em} 月 \hspace*{2em} 日 \hspace*{2em} \\
  \end{flushright}
}

\newcommand{\makecover}{
  \begin{titlepage}
    \thesis@cncover
    \clearpage
    \thesis@encover
    \clearpage
    \thesis@titlepage
    \clearpage
    \thesis@authpage
    \clearpage
    \thesis@originpage
  \end{titlepage}
}

%----------------------------------------------------------%
%                       Abstract                           %
%----------------------------------------------------------%
% 摘要：黑体，三号，加粗居中，单倍行距，段前24磅，段后18磅
% 内容：宋体，小四，行距20磅，段前段后0磅

\newenvironment{cabstract}{
  \fancyhead[LE,RO]{\song \wuhao 同济大学\hspace*{0.5em}硕士学位论文\hspace*{0.5em}摘要}
  \begin{center}
    {\hei \sanhao \bfseries 摘\hspace{2em}要}
  \end{center}
  \begin{spacing}{1.5}
  \song \xiaosi
}{
  \end{spacing}
  \clearpage
}

\newcommand{\makeckeyword}[1]{%
  \vspace*{0.6cm} \noindent \textbf{关键词：}#1
}

% 标题：Arial，三号，加粗居中，单倍行距，段前24磅，段后18磅
% 内容：Times New Roman，小四，行距20磅，段前段后0磅

\newenvironment{eabstract}{
  \fancyhead[LE,RO]{Tongji University Master Abstract}
  \begin{center}
    {\arial \sanhao \bfseries Abstract}
  \end{center}
  \begin{spacing}{1.5} \timesnew \xiaosi
}{
  \end{spacing}
  \clearpage
}

\newcommand{\makeekeyword}[1]{%
  \vspace*{0.6cm} \noindent \textbf{Kew Words: }#1
}

%----------------------------------------------------------%
%                    Table of Contents                     %
%----------------------------------------------------------%
% 标题：黑体，三号，加粗居中，单倍行距，段前24磅，段后18磅
% 目录：宋体，小四，行距18磅，段前段后0磅，两端对齐，页码右对齐

\RequirePackage{titletoc}

%\renewcommand{\contentsname}{\centering \hei \sanhao 目\hspace*{0em}录}

\titlecontents{section}[0em]{\addvspace{4pt}}%
  {\xiaosi\song 第 \thecontentslabel 章 \enspace}%
  {\xiaosi\song}{\dotfill\contentspage}[\addvspace{0pt}]

\titlecontents{subsection}[2em]{\addvspace{4pt}}%
  {\xiaosi\song\thecontentslabel\enspace}%
  {\xiaosi\song}{\dotfill\contentspage}[\addvspace{0pt}]

\titlecontents{subsubsection}[4em]{\addvspace{4pt}}%
  {\xiaosi\song\thecontentslabel\enspace}%
  {\xiaosi\song}{\dotfill\contentspage}[\addvspace{0pt}]

% Hide the section in toc

\newcommand{\nocontentsline}[3]{}
\newcommand{\tocless}[2]{\bgroup\let\addcontentsline=\nocontentsline#1{#2}\egroup}

%----------------------------------------------------------%
%                    Chapter/Section                       %
%----------------------------------------------------------%
% 章节标题:黑体,三号,加粗居中,单倍行距,段前24磅,段后18磅,章序号与章名间空一个字符
% 一级标题:黑体,小三号,顶左,单倍行距,段前24磅,段后6磅,序号与题名间空一个字符
% 二级标题:黑体,四号,顶左,单倍行距,段前12磅,段后6磅,序号与题名间空一个字符
% 三级标题:黑体,小四顶左,单倍行距,段前空12磅,段后空6磅,序号与题名间空一个字符

\RequirePackage{titlesec}

\titleformat{\section}{\centering \bf \hei \sanhao}{第 \thesection 章}{1em}{}
\titleformat{\subsection}{\hei \xiaosan}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\hei \sihao}{\thesubsubsection}{1em}{}
\titleformat{\paragraph}{\hei \xiaosi}{\theparagraph}{1em}{}

\let\stdsection\section
\renewcommand\section{
  \clearpage
  \setcounter{table}{0}
  \setcounter{figure}{0}
  \setcounter{equation}{0}
  \stdsection
}

%----------------------------------------------------------%
%                      Acknowledgement                     %
%----------------------------------------------------------%
% 标题：黑体，三号，加粗居中，单倍行距，段前24磅，段后18磅
% 正文：仿宋，小四，行距16磅，段前段后0磅，首行缩进2个汉字符

\def\ackname{致谢} 

\newenvironment{acknowledge}{
  \addcontentsline{toc}{section}{\ackname}
  \fancyhead[LE,RO]{\song \wuhao 同济大学\hspace*{0.5em}硕士学位论文\hspace*{0.5em}\ackname}
  \begin{center}
    {\hei \sanhao \bfseries \ackname}
  \end{center}
  \begin{spacing}{1.3}
  \fangsong \xiaosi
}{
  \end{spacing}
  \clearpage
}

\newcommand{\makeackdate}[2]{%
  \vspace*{2cm}
  \begin{flushright}
    #1 年 #2 月
  \end{flushright}
}

%----------------------------------------------------------%
%                       Reference                          %
%----------------------------------------------------------%

\renewcommand{\refname}{参考文献}
\newcounter{savepage}
\newcommand{\makeref}[1]{
  \begingroup
  \setcounter{savepage}{\arabic{page}}
  \fancypagestyle{plain}{
    \fancyhead[LE,RO]{\song \wuhao 同济大学\hspace*{0.5em}硕士学位论文\hspace*{0.5em}参考文献}
    \pagenumbering{arabic}
    \setcounter{page}{\thesavepage}
  }
  \pagestyle{plain}
  \addcontentsline{toc}{section}{\refname}
  \bibliographystyle{ieeetr}
  \bibliography{#1}
  \nocite{*}
  \clearpage
  \endgroup
}

%----------------------------------------------------------%
%                       Appendix                           %
%----------------------------------------------------------%
% 标题：要求同各章标题
% 正文：宋体,小四,(英文用 Times New Roman 体,小四),两端对齐书写,段落首行左缩进 2 个汉 字符。行距 20 磅(段落中有数学表达式时,可根据表达需要设 置该段的行距),段前 0 磅,段后 0 磅。

\def\appendixname{附录}

\newenvironment{tjuappendix}[1][\unskip]{
  \addcontentsline{toc}{section}{\appendixname}
  \fancyhead[LE,RO]{\song \wuhao 同济大学\hspace*{0.5em}硕士学位论文\hspace*{0.5em}附录}
  \begin{center}
    {\hei \sanhao \bfseries \appendixname #1}
  \end{center}
  \begin{spacing}{1.3}
  \song \xiaosi
}{
  \end{spacing}
  \clearpage
}

%----------------------------------------------------------%
%                         Resume                           %
%----------------------------------------------------------%
% 标题：要求同各章标题
% 正文：宋体，五号(英文用Times New Roman体,五号)，行距16磅，段前段后0磅
% 学术论文：同参考文献；“个人简历”、“已发表论文”等字加粗

\def\resumename{个人简历、在读期间发表的学术论文与研究成果}

\newenvironment{resume}{
  \addcontentsline{toc}{section}{\resumename}
  \fancyhead[LE,RO]{\song \wuhao 同济大学\hspace*{0.5em}硕士学位论文\hspace*{0.5em}个人简历、在读期间发表的学术论文与研究成果}
  \begin{center}
    {\hei \sanhao \bfseries 个人简历、在读期间发表的学术论文与研究成果}
  \end{center}
  \begin{spacing}{1.3}
}{
  \end{spacing}
  \clearpage
}

\newcommand{\resumesec}[1]{
  \vspace*{1em}
  {\bfseries \noindent #1}\\{}
}

\newcommand{\resumeitem}[1]{
  {\song \wuhao \noindent #1}\\{}
}

%----------------------------------------------------------%
%                     Miscellaneous                        %
%----------------------------------------------------------%
%TODO

%% Code
\RequirePackage{listings}
% \lstloadlanguages{[Visual]C++,[ISO]C++}
\renewcommand\lstlistingname{代码}
\renewcommand\lstlistlistingname{代码}

%% Algorithms
\RequirePackage[algoruled,lined]{algorithm2e}
\renewcommand{\listalgorithmcfname}{算法清单}
\renewcommand{\algorithmcfname}{算法}
\renewcommand{\algorithmautorefname}{算法}
\SetAlCapHSkip{2em}
\SetAlgoCaptionSeparator{\hspace*{1em}}
\SetAlgoSkip{bigskip}
\setlength{\algomargin}{2em}
\SetKw{KwContinue}{continue\\}
\SetKw{KwBreak}{break\\}

