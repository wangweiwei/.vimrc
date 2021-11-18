" return 2>1&- || "exit" 
" ↑ 防止注释报错，这个顶部一定要放这句话
" ==================================================================================
" ----------------------------------------------------------------------------------
" ==================================================================================

" ----------------------------------- 插件区 ---------------------------------------
" ==================================================================================
" ----------------------------------------------------------------------------------
" 设置包括vundle和初始化相关的runtime path(/Users/wangweiwei/.vim/bundle)
set rtp+=~/.vim/bundle/Vundle.vim
set term=xterm-256color
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
" call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

" >>>>>>>>>>>> typescript <<<<<<<<<<<<<
" https://github.com/leafgarland/typescript-vim.git
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
" let g:typescript_indent_disable = 1
let g:typescript_opfirst='\%([<>=,?^%|*/&]\|\([-:+]\)\1\@!\|!=\|in\%(stanceof\)\=\>\)'
let g:typescript_compiler_binary = 'tsc'
" let g:typescript_compiler_options = ''
autocmd FileType typescript :set makeprg=tsc
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.ts,*.tsx,*.jsx set filetype=typescript.tsx

" >>>>>>>>>>>> 注释 <<<<<<<<<<<<<
" https://github.com/tpope/vim-commentary.git
Plugin 'tpope/vim-commentary'
autocmd FileType apache setlocal commentstring=#\ %s

" >>>>>>>>>>>> 全文搜索 <<<<<<<<<<<<<
" 安装
"   brew install the_silver_searcher
"   cd ~/.vim/bundle && git clone https://github.com/rking/ag.vim
Plugin 'rking/ag.vim'
" You can configure ag.vim to always start searching from your project root instead of the cwd
let g:ag_working_path_mode="r"
" map <c-u> :Ag<space>

" >>>>>>>>>>>> 成对符号编辑 <<<<<<<<<<<<<
Plugin 'kana/vim-surround'

" >>>>>>>>>>>> 状态栏 <<<<<<<<<<<<<
" https://github.com/vim-airline/vim-airline.git
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" >>>>>>>>>>>> vue <<<<<<<<<<<<<
" https://github.com/posva/vim-vue
Plugin 'posva/vim-vue'
let g:vue_disable_pre_processors=1
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" >>>>>>>>>>>> 括号自动配对 <<<<<<<<<<<<<
" https://github.com/jiangmiao/auto-pairs.git
Plugin 'jiangmiao/auto-pairs'

" >>>>>>>>>>>> 自动缩进 <<<<<<<<<<<<<
" https://github.com/Yggdroot/indentLine.git
Plugin 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'

" >>>>>>>>>>>> markdown <<<<<<<<<<<<<
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" markdown view
" npm -g install instant-markdown-d
Plugin 'suan/vim-instant-markdown'
" 禁止折叠
let g:vim_markdown_folding_disabled = 1

" >>>>>>>>>>>> YouCompleteMe <<<<<<<<<<<<<
" 安装过程
"   npm install typescript -g
"   cd /Users/wangweiwei/.vim/bundle/YouCompleteMe
"   git submodule update --init --recursive
"   sudo python3 ./install.py --clang-completer --ts-completer --tern-complete " 安装typescript提示
"   更多安装: https://github.com/Valloric/YouCompleteMe
" 删除YouCompleteMe
"   rm -rf ~/.vim/bundle/YouCompleteMe/ 
"   vim +PluginInstall +qall
"   vim +PluginClean +qall
"   rm -rf ~/.vim/bundle/YouCompleteMe/  " 再运行一次
" 当前的补全函数(https://github.com/Valloric/YouCompleteMe/issues/2215)
"   :verbose set omnifunc " vim编辑中的命令
Plugin 'Valloric/YouCompleteMe'
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
" 寻找全局配置文件
"   路径： ~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py
"   或者copy到~/.vim后使用~/.vim/.ycm_extra_conf
"   let g:ycm_global_ycm_extra_conf = '$HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"   https://jonasdevlieghere.com/a-better-youcompleteme-config/
let g:ycm_global_ycm_extra_conf = '$HOME/.vim/.ycm_extra_conf.py'
" 禁用syntastic来对python检查
" let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_key_invoke_completion = '<M-;>'
" 使用ctags生成的tags文件
" let g:ycm_collect_identifiers_from_tag_files = 1
" 开启语义补全
" 修改对C语言的补全快捷键，默认是CTRL+space，修改为ALT+;未测出效果
" let g:ycm_key_invoke_completion = '<M-;>'
" 设置转到定义处的快捷键为ALT+G，未测出效果
" nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
" 关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
" 在接受补全后不分裂出一个窗口显示接受的项
set completeopt-=preview
" 让补全行为与一般的IDE一致
set completeopt=longest,menu
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0
" 每次重新生成匹配项，禁止缓存匹配项
let g:ycm_cache_omnifunc=0
" 在注释中也可以补全
let g:ycm_complete_in_comments=1
" 输入第一个字符就开始补全
let g:ycm_min_num_of_chars_for_completion=1
" 不查询ultisnips提供的代码模板补全，如果需要，设置成1即可
" let g:ycm_use_ultisnips_completer=0
" 错误标识符
let g:ycm_error_symbol='>>'
" 警告标识符
let g:ycm_warning_symbol='>*'
" 不查询ultisnips提供的代码模板补全，如果需要，设置成1即可
" let g:ycm_use_ultisnips_completer=0
" 回车不换行
let g:ycm_key_list_stop_completion = ['<CR>']
" 通过pyenv安装python不能设置如下变量！
" let g:ycm_server_python_interpreter="/Users/wangweiwei/.pyenv/shims/python3"
" let g:python_host_prog = '/Users/wangweiwei/.pyenv/shims/python3'
" debug
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_use_vim_stdout = 1
" let g:ycm_server_log_level = 'debug'

" >>>>>>>>>>>> tern-for-vim <<<<<<<<<<<<<
" https://efe.baidu.com/blog/vim-javascript-completion/
Plugin 'marijnh/tern_for_vim'

" >>>>>>>>>>>> 快速查找文件 <<<<<<<<<<<<<
" 安装ruby
"   brew install ruby
" 配置ruby
"   alias ruby="/usr/local/Cellar/ruby/2.6.0_1/bin/ruby"
"   alias rake="/usr/local/Cellar/ruby/2.6.0_1/bin/rake"
" 安装command-t
"   cd ~/.vim/bundle/command-t/
"   rake make
" 跟多配置参考：
"   https://stackoverflow.com/questions/7902821/searching-with-command-t
"   https://github.com/rtfeldman/Command-T
" 参考：
"   call plug#begin()
"   Plug 'wincent/command-t', {
"     \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
"     \ }
"   call plug#end()
" set wildignore+=*.o,*.obj,.git,node_modules
Plugin 'wincent/command-t'
set wildignore+=.git,node_modules
" let g:CommandTWildIgnore=&wildignore . ",**/node_modules/*"
" 设置最大寻找文件数
let g:CommandTMaxFiles=30000
" let g:CommandTFileScanner='find'

" >>>>>>>>>>>> nerdtree <<<<<<<<<<<<<
" https://github.com/scrooloose/nerdtree.git
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" 目录树
if isdirectory(expand("~/.vim/bundle/nerdtree"))
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
  " let g:NERDTreeDirArrowExpandable = "\u00a0"
  " let g:NERDTreeDirArrowCollapsible = "\u00a0"
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
endif

" >>>>>>>>>>>> vim-devicons <<<<<<<<<<<<<
"
" 字体设置相关
"   网址：
"     https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts
"   Mac安装方法：
"     brew tap caskroom/fonts
"     brew cask install font-hack-nerd-font
Plugin 'ryanoasis/vim-devicons'
" 设置字体
" set guifont=DroidSansMono_Nerd_Font:h11
" set guifontwide=NSimsun:h14
set guifont=Hack_Nerd_Font:h14
set guifontwide=Hack_Nerd_Font:h14

" 你的所有插件需要在下面这行之前
call vundle#end()  " 必须
" ----------------------------------------------------------------------------------
" ==================================================================================
" ----------------------------------------------------------------------------------


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
set tags=tags;
set autochdir
let g:tagbar_ctags_bin='/usr/local/bin/ctags'

" >>>>>>> 关闭扫描到文件两端时重新搜索 <<<<<<<<
set nowrapscan

" >>>>>>> tab宽度为2个字符 <<<<<<<<
set tabstop=2

" >>>>>>> 自动缩进为2个字符 <<<<<<<<
set shiftwidth=2

" >>>>>>> 用space替代tab的输入 <<<<<<<<
set expandtab
" 不用space替代tab的输入
" set noexpandtab

" >>>>>>> 以特殊字符或字符串来显示制表符 <<<<<<<<
set list
set listchars=tab:--,trail:-
highlight SpecialKey ctermfg=Black guifg=Black

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


" ----------------------------------- 插件区 ---------------------------------------
" ==================================================================================
" ----------------------------------------------------------------------------------
" 请将安装插件的命令放在vundle#begin和vundle#end之间.
" >>>>>>> Github上的插件 <<<<<<<
" >>>> 格式为 Plugin '用户名/插件仓库名'
" Plugin 'tpope/vim-fugitive'
" >>>>>>> 来自 http://vim-scripts.org/vim/scripts.html 的插件 <<<<<<<<<
" >>>> Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
" Plugin 'L9'
" >>>>>>> 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址' <<<<<<<
" Plugin 'git://git.wincent.com/command-t.git'
" >>>>>>> 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径' <<<<<<<
" Plugin 'file:///home/gmarik/path/to/plugin'
" >>>>>>> 插件在仓库的子目录中. <<<<<<<
" >>>> 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" >>>>>>> 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突 <<<<<<<
" Plugin 'ascenator/L9', {'name': 'newL9'}
" ----------------------------------------------------------------------------------
" ==================================================================================
" ----------------------------------------------------------------------------------


" --------------------------------- 资料区 -----------------------------------------
" ==================================================================================
" ----------------------------------------------------------------------------------
"
" 常用的命令
"   :PluginList        - 列出所有已配置的插件
"   :PluginInstall     - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
"   :PluginSearch foo  - 搜索 foo ; 追加 `!` 清除本地缓存
"   :PluginClean       - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 插件有三种类型:
"   1、Github上vim-scripts仓库的插件
"   2、Github上非vim-scripts仓库的插件
"   3、不在Github上的插件
" 对于不同的插件，vundle自动管理和下载插件的时候，有不同的地址填写方法，有如下三类：
"   1、在Github上vim-scripts用户下的仓库,只需要写出repos（仓库）名称
"   2、在Github其他用户下的repos, 需要写出”用户名/repos名”
"   3、不在Github上的插件，需要写出git全路径
"
" 安装需要的插件
"   1、将想要安装的插件，按照地址填写方法，将地址填写在vundle#begin和vundle#end之间就可以
"   2、保存之后，有两种方法安装插件
"     (1) 运行vim，再运行 :PluginInstall
"     (2) 命令行直接安装
"         vim +PluginInstall +qall
"
" 移除不需要的插件
"   1、编辑.vimrc文件移除的你要移除的插件所对应的plugin那一行
"   2、保存退出当前的vim
"   3、重新打开vim，输入命令BundleClean
"
" 其他常用命令
"   1、更新插件BundleUpdate
"   2、列出所有插件BundleList
"   3、查找插件BundleSearch
"
" --------------------------------------------------------------------------------------
" ======================================================================================
" --------------------------------------------------------------------------------------
