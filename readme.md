# 我的Vim私人配置
# vim 插件
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

## vim 加载设置
1. vimrc 文件内容折叠 在前6行进行了配置
但是 set nofoldenable 禁止了折叠
2. 配置方案为colors/solarized.vim 

## vim 按键映射
** 还未解释** ： 将<CapsLk> 映射为 Esc

1. 禁用方向键
2. 使用 > 和 < 代替 << >> 进行缩进调整
3. 窗口切换 \<C-j\> \<C-k\>等等 替代 \<C-w\> j
4. \<leader\> d 切换 按照 *实际行* / *显示行* 移动模式，界面会折行显示
5. 禁用\<C-a\> \<C-x\> Q 等规避vim的某些问题


