# BIBM / IEEE 课程论文模板（BioNLP）

基于 IEEEtran 的双栏课程论文示例，适用于生物文本挖掘等课程，支持中英文混排。示例包含行号、页码和课程用 Agent 内容声明；正式投稿前请按目标会议要求检查这些设置。

## 文件

- `main.tex`：论文入口，包含标题、作者、章节、图表和引用示例。
- `IEEEtran.cls`：IEEEtran 文档类，保留原有版权和许可说明。
- `reference.bib`：BibTeX 参考文献示例。
- `figure/`：示例图片，编译时保留相对目录结构。
- `main.pdf`：示例预览。

## 编译

默认使用 pdfLaTeX + BibTeX，在本目录执行：

```sh
pdflatex -interaction=nonstopmode -halt-on-error main.tex
bibtex main
pdflatex -interaction=nonstopmode -halt-on-error main.tex
pdflatex -interaction=nonstopmode -halt-on-error main.tex
```

需安装 `ctex`、`cite`、`amsmath`、`amssymb`、`algorithmic`、`graphicx`、`textcomp`、`xcolor`、`url`、`booktabs`、`fancyhdr` 和 `lineno` 等宏包，以及提供 `IEEEtran.bst` 的参考文献样式包。当前示例使用文献引用，需要运行 BibTeX。

## 字体与字号

西文字体由 IEEEtran 设置：正文使用 Times 系列（TeX 字体族 `ptm`），无衬线字体为 Helvetica 系列（`phv`），等宽字体为 Courier 系列（`pcr`）。这些是 TeX 字体族，不要求系统安装 Times New Roman。

中文由 `ctex` 按编译引擎和平台选择字体集。Windows 字体集的中文正文为宋体，粗体为黑体，斜体为楷体；其他字体集的实际字形取决于 TeX 配置。pdfLaTeX 需要对应的 CJK 字体、编码和映射支持，仅安装系统字体不一定足够。

以下是当前 `IEEEtran` 默认 10 pt、`conference` 模式的主要字号；中文随所在位置的字号排版：

| 位置 | 字体或样式 | 字号 |
| --- | --- | --- |
| 主标题 | Times 系列；中文由 `ctex` 字体集选择 | 24 pt（`\Huge`） |
| 副标题 | 同主标题 | 12 pt（`\large`） |
| 作者姓名 | 正文字体 | 11 pt（`\sublargesize`） |
| 作者信息、正文、页码 | 正文字体 | 10 pt |
| 一级标题 | 西文小型大写，中文由字体集选择 | 10 pt |
| 二级、三级标题 | 斜体；中文由字体集选择 | 10 pt |
| 摘要、关键词 | IEEEtran 默认样式 | 9 pt（`\small`） |
| 参考文献、图表题注 | IEEEtran 默认样式 | 8 pt（`\footnotesize`） |
| 页脚课程声明 | 灰色正文字体 | 7 pt（`\scriptsize`） |
| 行号 | `lineno` 默认无衬线字体 | 5 pt（`\tiny`） |

### 查询系统可用字体

缺少 Windows 常用中文字体时，请先扫描系统可用字体。Windows PowerShell：

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

系统列表仅供初筛。继续使用 pdfLaTeX 时，应配置该引擎支持的 `ctex` 字体集和字体映射，不能直接填入任意系统字体名称。

如需按系统字体名称配置中文，可改用 XeLaTeX，并将 `main.tex` 中唯一的 `\usepackage[UTF8]{ctex}` 替换为：

```latex
\usepackage[UTF8,fontset=none]{ctex}
\setCJKmainfont{SimSun}[BoldFont=SimHei,ItalicFont=KaiTi]
\setCJKsansfont{SimHei}
\setCJKmonofont{SimSun}
```

示例字体名称需按扫描结果替换为实际可用的字体，粗体和斜体也需分别确认。随后将编译命令中的 `pdflatex` 全部改为 `xelatex`，仍运行 BibTeX。安装字体后请重启编辑器；更换字体或引擎后请重新检查字形、换行和分页。

## 使用

在 `main.tex` 中替换标题、作者、摘要、关键词和各节示例内容；文献写入 `reference.bib`，图片放入 `figure/` 并用相对路径引用。

- 行号：不需要时注释 `\pagewiselinenumbers`。
- 页脚课程声明：需要修改或关闭时，同步处理普通页脚、`plain` 和 `IEEEtitlepagestyle` 三处的 `\fancyfoot[L]`。
- 字体和字号：中文字体在 `ctex` 配置处调整；局部字号可在 `main.tex` 中设置。保留第三方文档类的版权和许可说明。
