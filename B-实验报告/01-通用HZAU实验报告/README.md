# 通用 HZAU 实验报告模板

适用于华中农业大学实验报告，提供完整报告和仅封面两个版本。

GitHub 仓库：[ZonesTissyc/myLaTex-template](https://github.com/ZonesTissyc/myLaTex-template)

## 文件说明

| 文件 | 用途 |
| --- | --- |
| `实验报告.tex` | 完整报告，包含封面、正文、页眉和代码块示例 |
| `实验报告.pdf` | 完整报告的编译预览 |
| `实验报告（仅封面）.tex` | 可独立编译的封面 |
| `实验报告（仅封面）.pdf` | 封面的编译预览 |
| `assets/` | 校徽和校名图片，编译时须保留 |

## 编译方法

使用安装了中文支持及所需宏包的 TeX Live 或 MiKTeX，编译引擎选择 **XeLaTeX**。

在本目录打开终端，根据需要执行：

```sh
xelatex -interaction=nonstopmode -halt-on-error "实验报告.tex"
xelatex -interaction=nonstopmode -halt-on-error "实验报告（仅封面）.tex"
```

输出为同名 PDF。修改内容后需重新编译；如使用交叉引用，可再编译一次。若 PDF 被阅读器占用导致无法覆盖，请先关闭对应文件。

也可以在支持 LaTeX 的编辑器中打开 `.tex` 文件，选择 XeLaTeX 后编译。请保持 `assets/` 与源文件的相对位置不变。

### 字体与宏包

模板按名称加载系统字体：

- 中文：`SimSun`（宋体）；粗体、斜体分别使用 `SimHei`（黑体）、`KaiTi`（楷体）。
- 英文：`Times New Roman`。
- 代码：`Consolas`。

| 位置 | 字体 | 字号 |
| --- | --- | --- |
| 封面英文校名 | Times New Roman，加粗 | 15 pt |
| 封面课程名、文档类型 | 黑体 | 30 pt |
| 封面信息字段、地点 | 黑体 | 小三（15 pt） |
| 封面日期 | 宋体 | 小三（15 pt） |
| 正文 | 中文宋体，西文 Times New Roman | 小四（12 pt） |
| 正文一级、二级、三级标题 | 由 `ctexart` 默认标题样式控制，中文粗体为黑体 | 一级小二（18 pt），二级小三（15 pt），三级小四（12 pt） |
| 正文页眉 | 中文宋体，西文 Times New Roman | 五号（10.5 pt） |
| 正文页码 | Times New Roman | 小四（12 pt） |
| 代码、行号 | Consolas | 代码 10 pt，行号六号（7.5 pt，`\scriptsize`） |
| 代码块标题 | 中文宋体，西文 Times New Roman | 五号（10.5 pt） |

两个版本的封面字体与字号一致；仅封面版不包含正文、页眉和代码块。校徽和中文校名为图片，不受字体设置影响。

### 查询系统可用字体

Windows 常用字体在其他系统、在线环境或部分 Windows 安装中也可能缺失。本模板没有自动回退，遇到找不到字体时，应先扫描系统可用字体。Windows PowerShell：

```powershell
Add-Type -AssemblyName System.Drawing
$fontCollection = New-Object System.Drawing.Text.InstalledFontCollection
$fontCollection.Families.Name | Sort-Object -Unique
$fontCollection.Dispose()
```

已安装 Fontconfig 的环境也可运行：

```sh
fc-list : family
```

根据扫描结果安装所需字体，或将源文件中的 `\setmainfont`、`\setCJKmainfont`、`\setCJKsansfont`、`\setCJKmonofont`、`\setmonofont` 及封面字体定义改为可用字体名称。替换时也需检查粗体和斜体字体是否存在。系统列表仅供初筛，最终以 XeLaTeX 能否加载为准；安装字体后请重启编辑器再编译，并检查换行和分页。

主要宏包包括 `ctex`、`geometry`、`array`、`graphicx`、`fontspec`、`xeCJK`；完整版还使用 `fancyhdr`、`xcolor`、`listings` 和 `tcolorbox`。代码高亮无需 Python、Pygments 或 `-shell-escape`。

## 修改封面信息

编辑源文件开头的封面字段，例如：

```latex
\newcommand{\CoverCourse}{课程名称}
\newcommand{\CoverDocumentType}{实验报告}
\newcommand{\CoverSubject}{实验题目}
\newcommand{\CoverStudentName}{张三}
\newcommand{\CoverStudentID}{填写学号}
\newcommand{\CoverCollege}{学院名称}
\newcommand{\CoverLocation}{中国 · 武汉}
\newcommand{\CoverDate}{2026 年 9 月}
```

两个版本的字段各自独立。如同时使用，请分别修改。题目可以包含 LaTeX 数学公式，例如 `$\pi$`。

## 正文与页眉

在 `实验报告.tex` 的封面结束处（`\end{titlepage}`）之后替换示例正文。模板包含实验目的、实验环境、实验原理与方法、实验过程与代码、实验结果与分析、实验总结六个示例章节，可按需要增删。

- 正文中文为宋体小四（12 pt），英文为 Times New Roman，首行缩进两个汉字。
- 正文页眉左侧为课程名，右侧为题目，自动引用 `\CoverCourse` 和 `\CoverSubject`。
- 正文页码从 1 开始，居中显示在页脚；封面不显示页眉和页码。
- 页眉使用五号字；题目过长时请检查左右内容是否重叠，必要时缩短页眉中的题目或调整页眉定义。

## 使用代码块

完整版使用 `tcolorbox + listings`，提供圆角浅色背景、标题栏、自动编号、行号、语法高亮、自动换行和跨页排版。

C++ 示例：

```latex
\begin{reportcode}[language=C++]{C++ 示例}
#include <iostream>
int main() {
    std::cout << "Hello, world!" << std::endl;
}
\end{reportcode}
```

Python 示例：

```latex
\begin{reportcode}[language=Python]{Python 示例}
for i in range(3):
    print(i)
\end{reportcode}
```

方括号中可传入 `listings` 选项；省略时默认使用 C++。花括号中的内容为标题，编号由模板自动生成。

如需调整配色、代码字号或卡片边距，修改导言区的 `code...` 颜色定义、`\lstdefinestyle{reportcode}` 和 `\newtcblisting` 设置。
