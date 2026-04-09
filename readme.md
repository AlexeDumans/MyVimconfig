# 我的linux私人配置
## vim 插件
### gundo
功能: 撤销树可视化
config:
\<leader\>u  开启

### ack.vim 
功能:代码模糊搜索

config:
**Gcd 的命令还没有找到对应的插件**
**K** 还不支持使用

### ctrlp 
功能：文件模糊搜索

config:
按键 `;` 

### lightline
功能：状态栏配色

### nerdtree 
功能：文件夹栏

config: 
1. \<leader\> n  弹出文件夹栏
2. \<leader\> f NERDTreeFind 定位

### vim-easymotion
功能：魔术操作

暂未探索

### vim 加载设置
1. vimrc 文件内容折叠 在前6行进行了配置
但是 set nofoldenable 禁止了折叠
2. 配置方案为colors/solarized.vim 

### vim 按键映射
** 还未解释** ： 将<CapsLk> 映射为 Esc

1. 禁用方向键
2. 使用 > 和 < 代替 << >> 进行缩进调整
3. 窗口切换 \<C-j\> \<C-k\>等等 替代 \<C-w\> j
4. \<leader\> d 切换 按照 *实际行* / *显示行* 移动模式，界面会折行显示
5. 禁用\<C-a\> \<C-x\> Q 等规避vim的某些问题

## 其他linux工具

### 一、 核心基础工具 (The Essentials)

为了让 Linux 终端从“好用”变为“强大”，建议首先安装以下现代化的命令行工具。

| 工具名称 | 功能描述 | 推荐理由 |
| --- | --- | --- |
| **tmux** | 终端复用器 | **远程连接必备**。支持分屏，且在 SSH 断开后程序仍能持续运行，重连后可一键恢复。 |
| **fzf** | 模糊搜索利器 | 支持在终端 `Ctrl+R` 搜索历史记录，或通过 `vim $(fzf)` 快速找文件。 |
| **btop** | 系统监视器 | 界面极度硬核，可直观查看 CPU 各核频率、内存以及 GPU (RTX 2060) 实时负载。 |
| **lazygit** | TUI Git 管理器 | 终端里的图形化 Git 工具，通过键盘快捷键极速完成暂存、提交和推送。 |
| **bat** | 增强版 cat | 带有语法高亮、代码折叠显示和 Git 修改标记的查看工具。 |
| **fd** | 增强版 find | 比传统 find 更快，且默认忽略 `.git` 等无关文件夹。 |
| **sgpt** | ShellGPT (AI) | 在终端直接通过自然语言获取 Linux 命令建议或生成代码片段。 |

---

### 二、 Shell 环境增强 (Terminal Bliss)

#### 1. Zsh + Oh My Zsh

相比默认的 Bash，Zsh 配合插件能大幅减少输入量：

* **zsh-autosuggestions**: 根据历史记录自动预测你要输入的命令（灰色提示，按右箭头补全）。
* **zsh-syntax-highlighting**: 实时检查命令拼写是否正确（正确为绿色，错误为红色）。

#### 2. Autojump (z)

* **功能**：通过 `z [模糊路径]` 直接跳转到你曾经去过的深层目录，无需一层层 `cd`。


---

### 三、 远程开发与网络优化

#### 1. SSH 与断线保护

既然主力机远程连接，建议所有开发任务都在 `tmux` 会话中进行。

* **命令**：`tmux new -s work` 创建会话，`tmux a` 重新连接。

#### 2. 网络代理快捷开关

在 `.bashrc` 或 `.zshrc` 中添加快捷函数，解决 Clash 等代理配置：

```bash
function proxy_on() {
    export http_proxy="http://127.0.0.1:7890"
    export https_proxy="http://127.0.0.1:7890"
    echo "Proxy Enabled"
}
function proxy_off() {
    unset http_proxy
    unset https_proxy
    echo "Proxy Disabled"
}

```

#### 3. 跨机代码传输

* **SCP**: `scp -r ./project user@ip:~/path` 快速同步。
* **LazyGit**: 直接在终端处理所有 Git 分支逻辑，适合无 IDE 环境下的高效协作。

