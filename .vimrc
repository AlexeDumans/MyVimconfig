" setup folds {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" plugins {{{

" nerdtree
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

" gundo
nnoremap <Leader>u :GundoToggle<CR>
if has('python3')
    let g:gundo_prefer_python3 = 1
endif

" gundo
nnoremap <Leader>u :GundoToggle<CR>
if has('python3')
    let g:gundo_prefer_python3 = 1
endif
" ctrlp
nnoremap ; :CtrlPBuffer<CR>
let g:ctrlp_switch_buffer = 0
let g:ctrlp_show_hidden = 1

" ag / ack.vim
command -nargs=+ Gag Gcd | Ack! <args>
nnoremap K :Gag "\b<C-R><C-W>\b"<CR>:cw<CR>
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
    let g:ackprg = 'ag --vimgrep'
endif

" incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" }}}

" configs {{{ 
" zn .vimrc
" set nowrap   "不换行
" colorscheme darkblue  "颜色模式
set helplang=cn
set shiftwidth=4  "默认缩进4个空格
set softtabstop=4  "使用tab时 tab空格数
set tabstop=4  "tab代表4个空格
set expandtab "使用空格替换tab
set autoindent " 自动缩进
set smarttab
setlocal noswapfile " 不要生成swap文件
set bufhidden=hide "  当buffer被丢弃时隐藏它    
set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺
set nobackup " 覆盖文件时不备份
set autochdir " 自动切换到当前目录为当前文件所在位置
set backupcopy=yes " 设置备份时的d行为为覆盖
set noerrorbells  novisualbell t_vb = " isable audible bell because it's annoyin
set smartindent " 开启新行时使用智能自动缩进
set cmdheight=1 " z设定命令行的行数为1
filetype on "文件类型
    
filetype plugin indent on " enable file type detection
set encoding=utf-8 "编码为utf8
syntax on  "语法高亮

filetype on "文件类型
filetype plugin indent on " enable file type detection
set encoding=utf-8 "编码为utf8
syntax on  "语法高亮
set number   "显示行号
set mouse+=a " 允许使用鼠标 , Enable mouse support.
set laststatus=2  "总是显示状态行
set matchtime=2 " 短暂跳转到匹配括号的时间
set magic " 设置魔术


" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" backspace键
" indent 删除自动缩进的值
" eol 删除上一行行末尾的回车，两行合并
" start 除了刚输入的，还删除原来的字符
set backspace=indent,eol,start
set hidden  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存

set relativenumber " This enables relative line numbering mode.相对行号
set shortmess+=I " Disable the default Vim startup message. 
" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

set incsearch " Enable searching as you type, rather than waiting till you press enter.
set hls

set listchars=tab:>>,nbsp:~ " set list to see tabs and non-breakable spaces

" ------ disable settings ------- 
set noshowmode " hide mode
set nocompatible " vim - vi , default Vi-compatibility mode  turns out not
set noerrorbells visualbell t_vb= " Disable audible bell because it's annoyin
set nofoldenable " disable folding by default
" foldenable 折叠相关z设置
" set foldenable " 开始折叠
" set foldmethod-syntax " 设置语法折叠
" set foldcolumn=0 " 设置折叠区域的宽度
" setlocal foldlevel=1 " 设置s折叠层数为 1
"    nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> " 用空格键来开关折叠 
set nojoinspaces " suppress inserting two spaces between sentences

set showmatch " show matching braces when text indicator is over them

set scrolloff=5 " show lines above and below cursor (when possible)

set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts
set lazyredraw " skip redrawing screen in some cases
set history=8192 " more history

" tab completion for files/bufferss
set wildmode=longest,list
set wildmenu
set mouse+=a " enable mouse mode (scrolling, selection, etc)
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

"" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" vim can autodetect this based on $TERM (e.g. 'xterm-256color')
" but it can be set to force 256 colors
" set t_Co=256
if has('gui_running')
    colorscheme solarized
    let g:lightline = {'colorscheme': 'solarized'}
elseif &t_Co < 256
    colorscheme default
    set nocursorline " looks bad in this mode
else
    set background=dark
    let g:solarized_termcolors=256 " instead of 16 color with mapping in terminal
    colorscheme solarized
    " customized colors
    highlight SignColumn ctermbg=234
    highlight StatusLine cterm=bold ctermfg=245 ctermbg=235
    highlight StatusLineNC cterm=bold ctermfg=245 ctermbg=235
    let g:lightline = {'colorscheme': 'dark'}
    highlight SpellBad cterm=underline
    " patches
    highlight CursorLineNr cterm=NONE
endif

" markdown
let g:markdown_fenced_languages = [
    \ 'asm',
    \ 'bash=sh',
    \ 'c',
    \ 'erb=eruby',
    \ 'javascript',
    \ 'json',
    \ 'perl',
    \ 'python',
    \ 'ruby',
    \ 'yaml',
    \ 'go',
    \ 'rust',
\]
let g:markdown_syntax_conceal = 0
let g:markdown_folding = 1

" }}}


" mappings {{{
" Try to prevent bad habits like using the arrow keys for movement. 
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" 以 > 代替 >> 进行缩进调整
nnoremap > >> 
nnoremap < << 

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" v模式下的系统复制
vnoremap <C-c> "+y

" movement relative to display lines
nnoremap <silent> <Leader>d :call ToggleMovementByDisplayLines()<CR>
function SetMovementByDisplayLines()
    noremap <buffer> <silent> <expr> k v:count ? 'k' : 'gk'
    noremap <buffer> <silent> <expr> j v:count ? 'j' : 'gj'
    noremap <buffer> <silent> 0 g0
    noremap <buffer> <silent> $ g$
endfunction
function ToggleMovementByDisplayLines()
    if !exists('b:movement_by_display_lines')
        let b:movement_by_display_lines = 0
    endif
    if b:movement_by_display_lines
        let b:movement_by_display_lines = 0
        silent! nunmap <buffer> k
        silent! nunmap <buffer> j
        silent! nunmap <buffer> 0
        silent! nunmap <buffer> $
    else
        let b:movement_by_display_lines = 1
        call SetMovementByDisplayLines()
    endif
endfunction

" unbind keys
map <C-a> <Nop>
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.
map <C-x> <Nop>
" }}} 



" functions {{{ 
:command! -nargs=1 Hello echo "Hello " . <args>
" }}}


