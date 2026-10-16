\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{techpaper2026}[2026/10/13 科技论文写作课程论文模板]

\LoadClass[UTF8,a4paper,zihao=5,fontset=none]{ctexart}

\RequirePackage{iftex}
\ifXeTeX\else
  \ClassError{techpaper2026}{请使用 XeLaTeX 编译}{运行：latexmk -xelatex 科技论文写作.tex}
\fi

\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{indentfirst}
\RequirePackage{enumitem}
\RequirePackage{amsmath,amssymb}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{array}
\RequirePackage{caption}
\RequirePackage[authoryear,round,sort]{natbib}
\RequirePackage{etoolbox}
\RequirePackage[hidelinks]{hyperref}

% 字体：优先读取用户提供的 Windows 字体文件；找不到时才使用系统字体。
\newcommand{\PaperWindowsFontPath}{/home/ztc/share/Windows系统字体/Fonts/}
\IfFileExists{\PaperWindowsFontPath simsun.ttc}{
  \setmainfont[
    Path=\PaperWindowsFontPath,
    BoldFont=timesbd.ttf,
    ItalicFont=timesi.ttf,
    BoldItalicFont=timesbi.ttf
  ]{times.ttf}
  \setCJKmainfont[
    Path=\PaperWindowsFontPath,
    AutoFakeBold=2
  ]{simsun.ttc}
  \newCJKfontfamily\PaperSong[
    Path=\PaperWindowsFontPath,
    AutoFakeBold=2
  ]{simsun.ttc}
  \newCJKfontfamily\PaperHei[
    Path=\PaperWindowsFontPath,
    BoldFont=simhei.ttf
  ]{simhei.ttf}
  \setCJKmonofont[Path=\PaperWindowsFontPath]{simsun.ttc}
}{
  \IfFontExistsTF{Times New Roman}
    {\setmainfont{Times New Roman}}
    {\setmainfont{Liberation Serif}}
  \ExplSyntaxOn
  \sys_if_platform_windows:TF
    {
      \setCJKmainfont[AutoFakeBold=2.5]{SimSun}
      \newCJKfontfamily\PaperSong[AutoFakeBold=2.5]{SimSun}
      \newCJKfontfamily\PaperHei[AutoFakeBold=2.5]{SimHei}
      \setCJKmonofont{SimSun}
    }
    {
      \IfFontExistsTF{AR~PL~SungtiL~GB}
        {
          \setCJKmainfont[AutoFakeBold=2.5]{AR~PL~SungtiL~GB}
          \newCJKfontfamily\PaperSong[AutoFakeBold=2.5]{AR~PL~SungtiL~GB}
        }
        {
          \setCJKmainfont[BoldFont=Noto~Serif~CJK~SC~SemiBold]{Noto~Serif~CJK~SC}
          \newCJKfontfamily\PaperSong[BoldFont=Noto~Serif~CJK~SC~SemiBold]{Noto~Serif~CJK~SC}
        }
      \newCJKfontfamily\PaperHei[BoldFont=Noto~Sans~CJK~SC~Bold]{Noto~Sans~CJK~SC}
      \setCJKmonofont{Noto~Sans~Mono~CJK~SC}
    }
  \ExplSyntaxOff
}

% 示例页面量得的版心接近 Word 中文文档常用边距；原 PDF 未提供数值。
\geometry{
  a4paper,
  left=3.17cm,
  right=3.17cm,
  top=2.54cm,
  bottom=2.54cm,
  headheight=14pt,
  headsep=6mm,
  footskip=12mm
}

\setstretch{1}
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}
\setlength{\emergencystretch}{2em}
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}

% 论文信息。
\newcommand\paper@title{}
\newcommand\paper@headtitle{}
\newcommand\paper@author{}
\newcommand\paper@studentid{}
\newcommand\paper@class{}

\newcommand{\papertitle}[2][]{%
  \gdef\paper@title{#2}%
  \ifstrempty{#1}{\gdef\paper@headtitle{#2}}{\gdef\paper@headtitle{#1}}%
}
\newcommand{\paperauthor}[1]{\gdef\paper@author{#1}}
\newcommand{\paperstudentid}[1]{\gdef\paper@studentid{#1}}
\newcommand{\paperclass}[1]{\gdef\paper@class{#1}}

% 页眉与页脚。
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\zihao{-5}\PaperHei《科技论文写作》课程论文}
\fancyhead[R]{\zihao{-5}\PaperHei\paper@headtitle}
\fancyfoot[C]{\zihao{5}\PaperSong 第~\thepage~页\ 共~\pageref{LastPage}~页}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}

% 首页题目与作者信息。
\newcommand{\makepapertitle}{%
  \thispagestyle{fancy}%
  \vspace*{\baselineskip}%
  \begin{center}
    {\zihao{3}\PaperHei\bfseries\paper@title\par}
  \end{center}
  \vspace{\baselineskip}%
  \begin{flushright}
    {\zihao{6}\PaperSong
      作者姓名：\paper@author\par
      作者学号：\paper@studentid\par
      作者班级：\paper@class\par
    }
  \end{flushright}
  \vspace{\baselineskip}%
}

% 摘要与关键词。
\newenvironment{paperabstract}{%
  \par\vspace{\baselineskip}%
  {\noindent\zihao{4}\PaperHei\bfseries 摘要\par}%
  \begingroup\zihao{5}\PaperSong\setstretch{1}\setlength{\parindent}{2em}%
}{%
  \par\endgroup
}

\newcommand{\paperkeywords}[1]{%
  \par\vspace{\baselineskip}%
  \noindent{\zihao{-4}\PaperHei\bfseries 关键字：}%
  {\zihao{5}\PaperSong #1\par}%
}

% 标题：编号后间隔一个汉字；三级、四级标题缩进两个汉字。
\titleformat{\section}
  {\zihao{4}\PaperHei\bfseries}{\thesection}{1em}{}
\titlespacing*{\section}{0pt}{\baselineskip}{0pt}

\titleformat{\subsection}
  {\zihao{-4}\PaperHei\bfseries}{\thesubsection}{1em}{}
\titlespacing*{\subsection}{0pt}{0pt}{0pt}

\titleformat{\subsubsection}
  {\zihao{-4}\PaperSong}{\thesubsubsection}{1em}{}
\titlespacing*{\subsubsection}{2em}{0pt}{0pt}

\titleformat{\paragraph}[block]
  {\zihao{-4}\PaperSong}{\theparagraph}{1em}{}
\titlespacing*{\paragraph}{2em}{0pt}{0pt}

% 分项编号。
\setlist[enumerate,1]{label=(\arabic*),leftmargin=4em,labelsep=1em,itemsep=0pt,topsep=0pt}

% 图表题均为五号宋体加粗；表题在上、图题在下。
\DeclareCaptionFont{paperwuhao}{\zihao{5}\PaperSong}
\captionsetup{
  font={paperwuhao,bf},
  labelfont=bf,
  textfont=bf,
  labelsep=space,
  justification=centering,
  singlelinecheck=false,
  skip=6pt
}
\captionsetup[table]{position=top}
\captionsetup[figure]{position=bottom}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

% 作者—年代引用：作者与年份之间空一格，多篇文献以分号分隔。
\bibpunct{（}{）}{;}{a}{ }{;}
% 各条文献之间留半行空白；单条文献内部仍保持单倍行距。
\setlength{\bibsep}{0.5\baselineskip}
\setlength{\bibhang}{2em}
\renewcommand{\refname}{参考文献}
\renewcommand{\bibsection}{\section*{\refname}}
\AtBeginEnvironment{thebibliography}{\zihao{5}\PaperSong\setstretch{1}}

% 三类参考文献条目的便捷命令。
\newcommand{\JournalRef}[6]{#1. #2. #3. #4, #5: #6.}
\newcommand{\BookRef}[7]{%
  #1. #2. \ifstrempty{#3}{}{#3, }#4: #5. #6: #7.}
\newcommand{\ThesisRef}[7]{#1. #2. #3, #4: #5. #6: #7.}

\AtBeginDocument{\zihao{5}\PaperSong\setstretch{1}}
