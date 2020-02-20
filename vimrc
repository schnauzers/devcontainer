set nocompatible
filetype off
let mapleader = ";"

"graphviz 生成图片快捷键
map <f9> :w<CR>:!dot -Tpng -o %:r.png %<CR><CR>
map <f10> :w<CR>:!dot -Tsvg -o %:r.svg %<CR><CR>
map <f11> :w<CR>:!rm -f %:r.svg<CR><CR>:!dot -Tsvg -o %:r.svg %<CR><CR>
map <f5> :w<CR>:!./movetoserver.sh <CR><CR>
autocmd FileType python noremap <buffer> <F1> :call Autopep8()<CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
" All of your Plugins must be added before the following line

" 自动格式化PEP8标准
Plugin 'tell-k/vim-autopep8'

" 自动补全神器
Plugin 'Valloric/YouCompleteMe'
let g:ycm_python_binary_path = '/root/.pyenv/versions/3.6.3/bin/python3'
"let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['standard']
"let g:syntastic_javascript_standard_generic = 1
let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_javascript_eslint_exec = 'eslint'


"let g:ycm_python_binary_path = '/usr/bin/python'
"设置error和warning的提示符，如果没有设置，ycm会以syntastic的
"" g:syntastic_warning_symbol 和 g:syntastic_error_symbol 这两个为准
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'
"设置跳转的快捷键，可以跳转到definition和declaration
"nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
""nmap <F4> :YcmDiags<CR>
"设置全局配置文件的路径
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files = 1
"开启语义补全
let g:ycm_seed_identifiers_with_syntax = 1
"在接受补全后不分裂出一个窗口显示接受的项
set completeopt-=preview
"不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0
""每次重新生成匹配项，禁止缓存匹配项
let g:ycm_cache_omnifunc=0
"在注释中也可以补全
let g:ycm_complete_in_comments=1
"输入第一个字符就开始补全
let g:ycm_min_num_of_chars_for_completion=1
"不查询ultisnips提供的代码模板补全，如果需要，设置成1即可
let g:ycm_use_ultisnips_completer=0

Plugin 'scrooloose/nerdtree'
let NERDTreeWinPos='left'
let NERDTreeWinSize=21
"let NERDTreeShowBookmarks=1
"let NERDTreeShowLineNumbers=1
"map <F1> :NERDTreeToggle<CR>
" autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

Plugin 'taglist.vim'
"不同时显示多个文件的tag，只显示当前文件的。
let Tlist_Show_One_File = 1
"如果 taglist 窗口是最后一个窗口，则退出 vim。
let Tlist_Exit_OnlyWindow = 1
"在右侧窗口中显示 taglist 窗口。
let Tlist_Use_Right_Window = 1
"设置窗体宽度
let Tlist_WinWidth = 21"

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme="bubblegum"
"这个是安装字体后 必须设置此项"
let g:airline_powerline_fonts = 1

"设置为双字宽显示，否则无法完整显示如:☆
set ambiwidth=double

"set guifont=Consolas\ for\ Powerline\ FixedD:h11
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
        endif

"打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'

Plugin 'winmanager'
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|TagList"

function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

"nmap wm :WMToggle<CR>
"防止winmanager空白页
nmap wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>

Plugin 'kien/rainbow_parentheses.vim'

"Plugin 'nathanaelkane/vim-indent-guides'
"自动添加括号
Plugin 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1
au FileType python let b:delimitMate_nesting_quotes = ['"']

"批量注释
Plugin 'scrooloose/nerdcommenter'

Plugin 'https://github.com/scrooloose/syntastic'

let g:syntastic_python_python_exec = '/root/.pyenv/versions/3.6.3/bin/python3'
"let g:syntastic_python_python_exec = '/usr/bin/python'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"对齐
"Plugin 'nathanaelkane/vim-indent-guides'
"let g:indent_guides_auto_colors = 0
"hi IndentGuidesOdd  guibg=red   ctermbg=3
"hi IndentGuidesEven guibg=green ctermbg=4
"let g:indent_guides_enable_on_vim_startup = 1

"对齐
Plugin 'Yggdroot/indentLine'
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
"let g:indentLine_char = '┆'

"自动添加括号
Plugin 'tpope/vim-surround'

"ctrl+p
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }

let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

"scala
Plugin 'derekwyatt/vim-scala'

"html
Plugin 'mattn/emmet-vim'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"这里开始是默认配置
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | 
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif

    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"start from here:

"1.下面是平台相关的配置
"1.10 设置背景色
"set background=dark

"1.20 选择配色方案
"colorscheme solarized

"1.30 设置字体，注意，linux下用斜杠\，windows下用冒号:,字体:字号:编码方式
set guifont=Consolas:h14:cANSI
"set guifont=Monaco:80

"1.40 以下为解决中文显示问题,以及相应带来的提示及菜单乱码问题
set fileformats=unix,dos
set encoding=utf-8 " 设置vim内部使用的字符编码,原来是cp936
set fileencodings=utf-8,chinese,latin-1
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif
"lang messages zh_CN.UTF-8 " 解决console输出乱码
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"下面是设置中文字体的方法
"set guifontwide=幼圆:h13:cANSI

"1.50 去掉vim的GUI版本中的toolbar
"set guioptions=T

"1.60 默认不备份文件
set nobackup "do not keep a backup file, use versions instead

"2.下面是通用选项的配置
"2.10 去掉有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
"2.20 显示行号
set nu

"2.30 自动检测文件的类型
"filetype on

"2.40 记录历史的行数
set history=1000

"2.50 语法高亮显示
syntax on

"2.60 代码对齐相关
set autoindent "自动对齐，也就是把当前行的对齐格式应用到下一行
set smartindent "依据上面的对齐格式，智能地选择对齐方式
set tabstop=4 "设置tab键为4个空格
set shiftwidth=4 "设置当行之间交错时使用4个空格

"2.70 设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set showmatch

"2.80 当vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声
set vb t_vb=

"2.90 在编辑过程中，在右下角显示光标位置的状态行
set ruler

"2.100 "查询时非常方便，如：查找'book'，当输入到/b时，会自动找到第一个
"b开头的单词，当输入到/bo时，会自动找到第一个bo开头的单词，依次类推
set incsearch

"2.110 匹配时忽略大小写
set ignorecase

"2.120 代码折叠
"set foldenable
"set foldmethod=syntax
"默认不打开折叠
"set foldlevel=99

" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler

" 高亮显示当前行/列
set cursorline
hi CursorLine   cterm=none ctermbg=black

set cursorcolumn
hi CursorColumn cterm=none ctermbg=black

"highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
highlight Pmenu ctermfg=86 ctermbg=8 guifg=#ffffff guibg=#000000

" 高亮显示搜索结果
set hlsearch

" 开启语法高亮功能
syntax enable
set t_Co=256
let python_highlight_all = 1

"PEP8风格
au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix |

"js,html,css style:
au BufNewFile,BufRead *.js,*.html,*.css
\ set tabstop=2 |
\ set softtabstop=2 |
\ set shiftwidth=2 |

"显示行尾空格
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
"制表符和空格的显示方式
set listchars=tab:>-,trail:-

set mouse=c
set sw=4
set ts=4
filetype indent on
autocmd FileType c setlocal et sta sw=4 sts=4
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType javascript setlocal et sta sw=4 sts=4

"代码折叠
"按缩进进行折叠
set foldmethod=indent
"默认不折叠
set foldlevelstart=99
