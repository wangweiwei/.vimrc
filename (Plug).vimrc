" return 2>1&- || "exit"
" ↑ 防止注释报错，这个顶部一定要放这句话
" ==================================================================================
" ----------------------------------------------------------------------------------
" ==================================================================================

" ----------------------------------- 插件区(Plug) ---------------------------------------
" ==================================================================================
" ----------------------------------------------------------------------------------
" 
" >>>>>>>>>>>> vim-plug前端开发 <<<<<<<<<<<<<"
" 插件管理器安装
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" >>>>>>>>>>>> 前端开发 <<<<<<<<<<<<<"
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'


" >>>>>>>>>>>> 括号自动配对 <<<<<<<<<<<<<
" https://github.com/jiangmiao/auto-pairs.git
Plug 'jiangmiao/auto-pairs'

" >>>>>>>>>>>> 自动缩进 <<<<<<<<<<<<<
" https://github.com/Yggdroot/indentLine.git
Plug 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'

" >>>>>>>>>>>> 成对符号<<<<<<<<<<<<<"
Plug 'kana/vim-surround' 

" >>>>>>>>>>>> nerdtree <<<<<<<<<<<<<"
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
if isdirectory(expand("~/.vim/plugged/nerdtree"))
  let g:NERDTreeGlyphReadOnly=0
  let NERDTreeShowBookmarks=1
  let NERDTreeChDirMode=0
  let NERDTreeQuitOnOpen=1
  let NERDTreeMouseMode=2
  let NERDTreeShowHidden=1
  let NERDTreeKeepTreeInNewTab=1
  let g:nerdtree_tabs_open_on_gui_startup=0

  let g:netrw_banner = 0
  let g:netrw_liststyle = 3
  let g:netrw_altv = 1

  let g:webdevicons_enable_nerdtree = 1
  let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
  " 目录图标和颜色
  let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
  highlight! link NERDTreeFlags NERDTreeDir

  " 自动开启Nerdtree 
  autocmd vimenter * NERDTree
  " 当通过nerdtree删除文件时自动删除其缓存文件
  let NERDTreeAutoDeleteBuffer = 1
  " 设定 NERDTree 视窗大小
  let g:NERDTreeWinSize = 32
  " For taglist, you set a similar option
  let g:Tlist_WinWidth = 32 
  " 高亮当前行
  let NERDTreeHighlightCursorline = 1
  " 从NERDTree打开文件后自动关闭NERDTree
  let NERDTreeQuitOnOpen = 0 
  " NERDTreeAutoCenter 
  " let NERDTreeAutoCenter = 0 
  " 进入nerdtree
  " nnoremap <C-e> :NERDTree<CR>
  " 开启/关闭nerdtree快捷键
  " map <C-f> :NERDTreeToggle<CR>
  " map <F2> :NERDTreeToggle<CR>
  map <silent> <C-n> :NERDTreeToggle<CR>
  " 获得jiaodian
  " map <silent> <C-n> :NERDTreeFocus<CR>
  " 开启Nerdtree时自动显示Bookmarks
  let NERDTreeShowBookmarks=1 
  " 光标位置默认在右侧文件编辑区
  autocmd VimEnter * NERDTree
  wincmd w
  autocmd VimEnter * wincmd w
  " 打开vim时如果没有文件自动打开NERDTree
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  " How can I open NERDTree automatically when vim starts up on opening a directory?
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
  " 当NERDTree为剩下的唯一窗口为目录窗口时自动关闭
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " 设置树的显示图标
  "let g:NERDTreeDirArrowExpandable = "\u00a0"
  "let g:NERDTreeDirArrowCollapsible = "\u00a0"
  let g:NERDTreeDirArrowExpandable = '▸'
  let g:NERDTreeDirArrowCollapsible = '▾'
  " 去掉目前前的^G
  " let g:NERDTreeNodeDelimiter = "\u00a0"
  " Making it prettier
  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 1
  " 是否显示行号
  " let g:NERDTreeShowLineNumbers=1  
  " 不显示隐藏文件
  " let g:NERDTreeHidden=0
  " 过滤: 所有指定文件和文件夹不显示
  let NERDTreeIgnore=['\.py[cd]$', 'node_modules', '\.DS_Store', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
  " 根据打开的文件来显示目录，而不是打开时的目录 
  autocmd BufEnter * lcd %:p:h
  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction
  call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('properties', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('rc', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('ignore', 'yellow', 'none', 'yellow', '#151515')
  call NERDTreeHighlightFile('yml', '177', 'none', '#d787ff', '#151515')
  call NERDTreeHighlightFile('yaml', '177', 'none', '#d787ff', '#151515')
  call NERDTreeHighlightFile('md', '135', 'none', '#af5fff', '#151515')
  call NERDTreeHighlightFile('html', '202', 'none', '#ff5f00', '#151515')
  call NERDTreeHighlightFile('hbs', '203', 'none', '#ff5f5f', '#151515')
  call NERDTreeHighlightFile('css', '159', 'none', '#afffff', '#151515')
  call NERDTreeHighlightFile('js', '172', 'none', '#d78700', '#151515')
  call NERDTreeHighlightFile('php', '027', 'none', '#005fff', '#151515')
  call NERDTreeHighlightFile('log', '240', 'none', '#585858', '#151515')
  call NERDTreeHighlightFile('sh', '117', 'none', '#87d7ff', '#151515')
  call NERDTreeHighlightFile('xml', '158', 'none', '#afffd7', '#151515')
  call NERDTreeHighlightFile('java', '141', 'none', '#af87ff', '#151515')
  syntax enable
endif

" >>>>>>>>>>>> vim-devicons <<<<<<<<<<<<<
"
" 字体设置相关
"   网址：
"     https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts
"   Mac安装方法：
"     brew tap caskroom/fonts
"     brew cask install font-hack-nerd-font
Plug 'ryanoasis/vim-devicons'
" 设置字体
" set guifont=DroidSansMono_Nerd_Font:h11
" set guifontwide=NSimsun:h14
set guifont=Hack_Nerd_Font:h14
set guifontwide=Hack_Nerd_Font:h14

" end vim-plug
call plug#end()

" ----------------------------------- 默认配置 -------------------------------------
" ==================================================================================
" ----------------------------------------------------------------------------------
" >>>>>>> 编码 <<<<<<<<
set fileencoding=utf-8
set fileencodings=utf-8,prc,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
scriptencoding utf-8
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\

" 忽略大小写
set ignorecase

" >>>>>> 语默认时,右键不能转到下一行.ww可以开启自动折向下行 <<<<<<<<
"   <>分别代表左右,=后是指定可以换行的.(ww)
set whichwrap=>

" >>>>>> 语缺省vi兼容模式,不能用退格.设置为不兼容模式(cp) <<<<<<<<
set nocompatible

" >>>>>> 语法高亮 <<<<<<<<
if has("syntax")
  syntax on
endif

" 开启真彩色
if has("termguicolors")
  " enable true color
  set termguicolors
endif

" >>>>>>> 离开时自动保存 <<<<<<<<
" set autowrite                       " Automatically write a file when leaving a modified buffer
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
" set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator

" >>>>>>> 显示行号 <<<<<<<<
set nu

" >>>>>>> 搜索高亮 <<<<<<<<
set hlsearch

" >>>>>>> 自动缩进 <<<<<<<<
" set autoindent " 每行的缩进值与上一行相等
" set noautoindent " 取消缩进
" set cindent " 按C语言的方式进行缩进
" 在这种缩进模式中，每一行都和前一行有相同的缩进量，
"   同时这种缩进形式能正确的识别出花括号，当遇到右花括号（}），则取消缩进形式
"   此外还增加了识别C语言关键字的功能。
"   如果一行是以#开头的，那么这种格式将会被特殊对待而不采用缩进格式。
" set smartindent

" >>>>>>> 输入一个字符马上自动匹配,而不是输入完再查找 <<<<<<<<
set incsearch

" >>>>>>> 输光标移动到buffer的顶部和底部时保持3行距离 <<<<<<<<
set scrolloff=3

" >>>>>>> 命令行（在状态行下）的高度，设置为1 <<<<<<<<
set cmdheight=1

" >>>>>>> 底部的行号等显示 <<<<<<<<
set ruler

" >>>>>>> ctags配置 <<<<<<<<
" 安装
"   brew install ctags
" 配置环境变量
"   alias ctags="`brew --prefix`/bin/ctags"
" 在~/.ctags 中添加typescript支持(https://github.com/jb55/typescript-ctags)
"   --langdef=typescript
"   --langmap=typescript:.ts
"   --regex-typescript=/^[ \t]*(export[ \t]+([a-z]+[ \t]+)?)?class[ \t]+([a-zA-Z0-9_$]+)/\3/c,classes/
"   --regex-typescript=/^[ \t]*(declare[ \t]+)?namespace[ \t]+([a-zA-Z0-9_$]+)/\2/c,modules/
"   --regex-typescript=/^[ \t]*(export[ \t]+)?module[ \t]+([a-zA-Z0-9_$]+)/\2/n,modules/
"   --regex-typescript=/^[ \t]*(export[ \t]+)?(default[ \t]+)?(async[ \t]+)?function[ \t]+([a-zA-Z0-9_$]+)/\4/f,functions/
"   --regex-typescript=/^[ \t]*export[ \t]+(var|let|const)[ \t]+([a-zA-Z0-9_$]+)/\2/v,variables/
"   --regex-typescript=/^[ \t]*(var|let|const)[ \t]+([a-zA-Z0-9_$]+)[ \t]*=[ \t]*function[ \t]*[*]?[ \t]*\(\)/\2/v,varlambdas/
"   --regex-typescript=/^[ \t]*(export[ \t]+)?(public|protected|private)[ \t]+(static[ \t]+)?(abstract[ \t]+)?(((get|set)[ \t]+)|(async[ \t]+[*]*[ \t]*))?([a-zA-Z1-9_$]+)/\9/m,members/
"   --regex-typescript=/^[ \t]*(export[ \t]+)?interface[ \t]+([a-zA-Z0-9_$]+)/\2/i,interfaces/
"   --regex-typescript=/^[ \t]*(export[ \t]+)?type[ \t]+([a-zA-Z0-9_$]+)/\2/t,types/
"   --regex-typescript=/^[ \t]*(export[ \t]+)?enum[ \t]+([a-zA-Z0-9_$]+)/\2/e,enums/
" 使用，在相应的项目目录中输入
"   ctags -R .
"set tags=tags;
"set autochdir
"let g:tagbar_ctags_bin='/usr/local/bin/ctags'

" >>>>>>> 关闭扫描到文件两端时重新搜索 <<<<<<<<
set nowrapscan

" >>>>>>> tab宽度为4个字符 <<<<<<<<
set tabstop=4

" >>>>>>> 自动缩进为4个字符 <<<<<<<<
set shiftwidth=4

" >>>>>>> 用space替代tab的输入 <<<<<<<<
set expandtab
" 不用space替代tab的输入
" set noexpandtab

" >>>>>>> 以特殊字符或字符串来显示制表符 <<<<<<<<
set list
set listchars=tab:--,trail:-
highlight SpecialKey ctermfg=Black guifg=Black

" >>>>>>> 禁止生成临时文件<<<<<<<<
set nobackup       " no backup files
set noswapfile     " no swap files
set nowritebackup  " only in case you don't want a backup file while editing
set noundofile     " no undo files

" >>>>>>> 短暂显示括号匹配 <<<<<<<<
" set showmatch
" 匹配时间，单位是十分之一秒
" set matchtime=10
" 括号自动匹配添加
" inoremap ( ()<LEFT>
" inoremap { {}<LEFT>
" inoremap [ []<LEFT>

" 忽视插件改变缩进,可以使用以下替代:
" filetype plugin on
" ----------------------------------------------------------------------------------
" ==================================================================================
" ----------------------------------------------------------------------------------
