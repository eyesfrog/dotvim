call plug#begin('~/.config/nvim/plug')

Plug 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '/Users/eyefrog/.config/nvim/plug/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_python_binary_path = '/usr/bin/python3'


Plug 'morhetz/gruvbox'
let g:gruvbox_italic=1

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme="tomorrow"

Plug 'edkolev/tmuxline.vim'
let g:tmuxline_powerline_separators = 0

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger       = "<c-k>"
let g:UltiSnipsJumpForwardTrigger  = "<c-f>"
let g:UltiSnipsJumpBackwardTrigger = "<c-b>"
Plug 'honza/vim-snippets'

Plug 'majutsushi/tagbar'
let tagbar_right=1
nnoremap <Leader>tl :TagbarToggle<CR>
let g:tagbar_compact=1

Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/paredit.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Mizuchi/STL-Syntax'
Plug 'vim-scripts/a.vim'
Plug 'lervag/vimtex'


" *.cpp 和 *.h 间切换
nmap <Leader>ch :A<CR>
" 子窗口中显示 *.cpp 或 *.h
nmap <Leader>sch :AS<CR>

Plug 'sjl/tslime.vim'
let g:tslime_ensure_trailing_newlines = 1
let g:tslime_normal_mapping = '<leader>t'
let g:tslime_visual_mapping = '<leader>t'
let g:tslime_vars_mapping = '<leader>T'

Plug 'scrooloose/nerdtree'
nmap <Leader>tr :NERDTreeToggle<CR>

Plug 'Yggdroot/indentLine'

Plug 'chilicuil/vim-sml-coursera'

call plug#end()

"Basic
color gruvbox
set nocompatible
set guifont=Inconsolata\ for\ Powerline:h22
set background=dark
set number
set smartindent
set expandtab
set laststatus=2
set ruler
set tabstop=4
set shiftwidth=4
set softtabstop=4
set incsearch
set hlsearch
set cursorline
set history=1000
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1
set ignorecase
set gcr=a:block-blinkon0
set foldmethod=syntax
set shell=bash\ -l
set nofoldenable
let g:rehash256 = 1

" No backup files
set nobackup
set nowritebackup
set noswapfile

" SICP
autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.rkt

" Leadermap
let mapleader = ";"

" <F5>编译和运行C程序
map <F5> :call CompileRunClang()<CR>
func! CompileRunClang()
    exec "w"
    exec "!clang % -o %<"
    exec "! ./%<"
endfunc

" <F6>编译和运行C++程序
map <F6> :call CompileRunCpp()<CR>
func! CompileRunCpp()
    exec "w"
    exec "!clang++ % -o %<"
    exec "! ./%<"
endfunc

" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>


