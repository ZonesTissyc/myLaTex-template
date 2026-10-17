# myLaTex-template

收集、整理课程论文与实验报告等场景下的 LaTeX 模板，提供可修改的源码、示例和独立下载的模板压缩包。

**欢迎提交模板 PR！** 无论是分享新模板、改进已有排版，还是补充使用说明，都欢迎参与。

## 下载与使用

前往 [最新 Release](https://github.com/ZonesTissyc/myLaTex-template/releases/latest)，在 **Assets** 中选择需要的模板 ZIP，无需下载整个仓库。GitHub 可能简化附件中的中文文件名，可结合附件显示名称和编号选择：`A01`、`A02`、`B01` 分别对应下表的模板。

也可以克隆仓库获取源码：

```bash
git clone https://github.com/ZonesTissyc/myLaTex-template.git
```

解压后保留模板内部目录结构，先编译示例确认环境，再替换标题、姓名、正文与参考文献。各模板的编译引擎、字体和依赖可能不同，请参考对应目录的 README 或源文件开头的说明。

## 模板目录

| 编号 | 模板 | 说明 | 编译引擎 |
| --- | --- | --- | --- |
| A01 | [科技论文写作](A-课程论文/01-科技论文写作/) | 《科技论文写作》课程论文，含自定义文档类与示例 | XeLaTeX |
| A02 | [BIBM 会议（BioNLP）](<A-课程论文/02-BIBM会议(BioNLP)/>) | 基于 IEEEtran 的课程论文示例，支持中英文混排 | pdfLaTeX + BibTeX |
| B01 | [通用 HZAU 实验报告](B-实验报告/01-通用HZAU实验报告/) | 华中农业大学实验报告，提供完整报告与仅封面版本 | XeLaTeX |

推荐安装包含中文支持的 TeX Live 或 MiKTeX。若提示缺少字体或宏包，请按照模板说明补齐依赖；修改交叉引用或参考文献后，可能需要多次编译。

## 字体与字号

| 模板 | 主要字体 | 正文字号 |
| --- | --- | --- |
| A01 科技论文写作 | 宋体、黑体、Times New Roman；支持按名称检测替代字体 | 五号（10.5 pt） |
| A02 BIBM 课程论文 | 西文 Times 系列，中文由 `ctex` 字体集选择 | 10 pt |
| B01 HZAU 实验报告 | 宋体、黑体、楷体、Times New Roman；代码 Consolas | 小四（12 pt） |

各模板 README 列有标题、正文、页眉等位置的字号、字体依赖和替换方法。字体均按名称或 TeX 字体集加载，字体是否可用取决于系统及 TeX 环境。

### 查询系统可用字体

缺少 Windows 常用字体（如宋体、黑体、Times New Roman、Consolas）时，请先扫描可用字体。Windows PowerShell：

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

使用扫描结果中的字体名称调整模板，或安装所需字体。系统列表仅供初筛，XeLaTeX 模板还需确认 `fontspec` 能加载所选字体；pdfLaTeX 模板需要匹配的 TeX 字体支持，不能直接使用任意系统字体。更换字体后请检查字形、换行和分页。

## 欢迎提交模板 PR

欢迎贡献课程论文、实验报告、毕业论文、学术会议等模板，也欢迎修复编译问题、调整格式和完善文档。

1. Fork 本仓库，并创建用于本次修改的分支。
2. 按下方目录约定添加或修改模板。
3. 在本地编译示例，检查页面、字体、图片和参考文献是否正常。
4. 提交 [Pull Request](https://github.com/ZonesTissyc/myLaTex-template/pulls)，说明模板用途、改动内容、编译方式和验证结果；涉及排版时，欢迎附上预览截图或 PDF。

有需求或遇到问题，也可以提交 [Issue](https://github.com/ZonesTissyc/myLaTex-template/issues)。

### 新模板目录约定

按「分类 / 编号-模板名称」组织，每个模板使用独立的二级目录，例如：

```text
A-课程论文/
  01-科技论文写作/
    README.md
    科技论文写作.tex
    techpaper2026.cls
B-实验报告/
  01-通用HZAU实验报告/
    README.md
    实验报告.tex
    assets/
```

- 分类目录采用 `大写字母-分类名称`，模板目录采用 `两位数字-模板名称`；同一分类内使用未占用的编号。
- 将可编译的 `.tex` 入口放在模板目录根部，并附上所需的 `.cls`、`.sty`、图片及参考文献文件。
- 在模板 README 中说明适用场景、主文件、编译引擎、字体与字号、依赖宏包、系统字体查询方法，以及需要修改的字段；不要写入个人环境路径或对话语境。
- 示例内容请使用占位信息，移除个人隐私；提交第三方模板或素材时，请注明来源并保留原有版权和许可说明。
- 不提交 `.aux`、`.log`、`.out` 等编译临时文件；可提供示例 PDF 方便预览。
- 添加新模板时，请同步更新上方的模板目录。

## Release 打包

仓库在推送 `v*` 标签时自动创建 Release。工作流会将直接包含 `.tex` 文件的二级模板目录分别打包为 ZIP，并保留模板内部结构。

压缩包名称由分类字母和模板目录名组成，例如 `A01-科技论文写作.zip`。合并 PR 后的改动会在后续发布版本中提供下载。
