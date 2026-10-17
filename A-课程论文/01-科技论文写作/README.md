# 《科技论文写作》课程论文 LaTeX 模板（2026）

适用于《科技论文写作》课程论文，提供中文标题、摘要、分级标题、图表和作者—年代制参考文献格式。

## 文件

- `techpaper2026.cls`：页面、字体、标题、摘要、图表、公式、引用与参考文献格式。
- `科技论文写作.tex`：可直接编译的示例论文；写作时替换其中内容即可。

## 编译

必须使用 XeLaTeX。

需安装 `ctex`、`fontspec`、`xeCJK`、`geometry`、`fancyhdr`、`lastpage`、`setspace`、`titlesec`、`indentfirst`、`enumitem`、`amsmath`、`amssymb`、`graphicx`、`booktabs`、`longtable`、`array`、`caption`、`natbib`、`etoolbox` 和 `hyperref` 等依赖，并安装 `latexmk` 命令。

在本目录运行：

```bash
latexmk -xelatex 科技论文写作.tex
```

清理辅助文件：

```bash
latexmk -C
```

## 字体与字号

字体按名称检测和加载。中文正文优先使用 `SimSun`（宋体），标题优先使用 `SimHei`（黑体），西文优先使用 `Times New Roman`。宋体和黑体的加粗采用伪粗体。

| 位置 | 字体 | 字号 |
| --- | --- | --- |
| 论文题目 | 黑体，加粗 | 三号（16 pt） |
| 作者、学号、班级 | 宋体 | 六号（7.5 pt） |
| 正文、摘要正文、关键词内容、参考文献 | 中文宋体，西文 Times New Roman | 五号（10.5 pt） |
| 摘要标题、一级标题 | 黑体，加粗 | 四号（14 pt） |
| 关键词标签、二级标题 | 黑体，加粗 | 小四（12 pt） |
| 三级、四级标题 | 宋体 | 小四（12 pt） |
| 图题、表题 | 宋体，加粗 | 五号（10.5 pt） |
| 页眉 | 黑体 | 小五（9 pt） |
| 页脚 | 宋体 | 五号（10.5 pt） |

缺少首选字体时，模板依次检测以下替代字体，使用首个可用项：

- 宋体：`AR PL SungtiL GB` → `Noto Serif CJK SC` → `FandolSong-Regular`。
- 黑体：`Noto Sans CJK SC` → `FandolHei-Regular`。
- 西文：`Liberation Serif` → `TeX Gyre Termes`。

最后一项也需由 TeX 发行版或系统提供。使用替代字体可能改变字宽、换行和分页；有指定字体要求时，应安装所需字体后再生成最终 PDF。

### 查询系统可用字体

缺少 Windows 常用字体时，先扫描可用字体，不要只根据操作系统判断字体是否存在。Windows PowerShell 可列出字体族名称：

```powershell
Add-Type -AssemblyName System.Drawing
$fontCollection = New-Object System.Drawing.Text.InstalledFontCollection
$fontCollection.Families.Name | Sort-Object -Unique
$fontCollection.Dispose()
```

已安装 Fontconfig 的环境（包括提供 `fc-list` 的 TeX 环境）也可运行：

```sh
fc-list : family
```

根据扫描结果安装缺失字体，或在 `techpaper2026.cls` 中调整字体名称和回退顺序。系统列表仅供初筛，最终以 XeLaTeX 能否加载为准；安装字体后请重启编辑器再编译。

## 使用说明

1. 在 `科技论文写作.tex` 开头填写论文题目、姓名、学号和班级。题目命令的可选参数用于设置较短的页眉标题。
2. 用 `paperabstract` 环境撰写摘要，用 `\paperkeywords{...}` 填写 3～5 个关键词。
3. 使用 `\section`、`\subsection`、`\subsubsection`、`\paragraph` 对应一至四级标题。
4. 图、表和公式使用标准 LaTeX 环境，模板会自动连续编号。
5. 参考文献使用作者—年代制。条目需按“中文在前、外文在后”手工排序；中文按第一作者姓名拼音排序，西文按第一作者姓氏字母排序。

## 页面设置

采用 A4 纸，上、下页边距 2.54 cm，左、右页边距 3.17 cm；页脚为“第 n 页 共 N 页”。这些边距为模板默认值，如课程另有要求，请调整 `techpaper2026.cls` 中的 `geometry` 设置。
