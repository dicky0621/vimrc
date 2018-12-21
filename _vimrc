source $VIMRUNTIME/vimrc_example.vim
behave xterm

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
if &sh =~ '\<cmd'
  if empty(&shellxquote)
    let l:shxq_sav = ''
    set shellxquote&
  endif
  let cmd = '"' . $VIMRUNTIME . '\diff"'
else
  let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
endif
  else
let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
let &shellxquote=l:shxq_sav
  endif
endfunction

" Settings
set guifont=DejaVu_Sans_Mono_for_Powerline:h12
set number
set ignorecase
set smartcase
set tags=tags;
"set autochdir
autocmd BufEnter * silent! lcd %:p:h
set nobackup
set noswapfile
set noundofile
set confirm
set list
set pastetoggle=<F12>
nmap <F6> :set hls! <cr>
let mapleader = "\<Space>"
set viminfo='100,f1
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>ew :e c:\Work\memo.md<CR>
nmap <silent> <leader>nv :e c:\Users\e294714\AppData\Local\nvim\ginit.vim<CR>
nmap <silent> <leader>st :n c:\Work\SRD\st\src\is_trk_update_v4.def c:\Work\SRD\st\src\tcas\sists.cpp c:\Work\SRD\st\src\tcas\sislogs.cpp c:\Work\SRD\st\src\tcas\sisVirtualTrack.cpp c:\Work\SRD\st\src\tcas\sisVirtualTrack.h c:\Work\SRD\st\src\tcas\vpsim.cpp<CR>
nnoremap ; :
inoremap jj <ESC>
nnoremap <F3> :bp<CR>
nnoremap <F4> :bn<CR>
":nnoremap <F4> :buffers<CR>:buffer<Space>

" Menu bar
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

" Pymode
let g:pymode_python = 'python3'
let g:pymode_lint = 0

" NERDTree
"map <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <F2>  :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.o$[[file]]','\.lst[[file]]']

" CPP highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

"UtilSnips
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger = "<m-r>"

" EasyMotion
nmap s <Plug>(easymotion-overwin-f2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" CtrlP
let g:ctrlp_map = '<Leader>f'
set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*  " Windows ('noshellslash')
set wildignore+=*.o,*.obj,*.lst,*.exe,*.so,*.dll
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|lst|o)$',
    \}

" Tagbar
nmap <F11> :TagbarToggle<CR>
let g:tagbar_width=40
let g:tagbar_singleclick = 1
let g:tagbar_iconchars = ['▶', '▼']
"nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_WinWidth = 30
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1
let Tlist_Use_SingleClick = 1
let Tlist_Display_Tag_Scope = 0
let Tlist_Enable_Fold_Column = 0
let Tlist_Show_Menu = 1

" Undotree
"nnoremap <F5> :UndotreeToggle<cr>
"nnoremap <F5> :GundoToggle<CR>
"
" ALE
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"let g:c_syntax_for_h = 1
let g:ale_completion_enabled = 0
nnoremap <F5> :ALEToggle<CR>

" Ag
let g:ag_highlight=1

" LeaderF
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
let g:Lf_WildIgnore = {
        \ 'dir': ['.svn','.git','.hg'],
        \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
        \}
"noremap <F8> :LeaderfFunction<cr>
let g:Lf_WindowPosition = 'right'
"noremap <c-n> :LeaderfMru<cr>
"noremap <m-n> :LeaderfBuffer<cr>
"noremap <m-m> :LeaderfTag<cr>
"let g:Lf_MruMaxFiles = 2048
"let g:Lf_WindowHeight = 0.30
"let g:Lf_MruFileExclude = ['*.so', '*.tmp', '*.bak', '*.exe', '*.dll']
"let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
"let g:Lf_CommandMap = {'<C-C>': ['<Esc>', '<C-C>'], '<Esc>':[ '<tab>' ]}

" Cscope
let g:cscope_silent = 1
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>fl :call ToggleLocationList()<CR>
" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

" CCTree

" Youcompleteme
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'
let g:ycm_confirm_extra_conf=0
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_show_diagnostics_ui = 0

" Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Theme
syntax enable
set background=dark
"colorscheme solarized
colorscheme molokai

" Powerline & Airline
let g:airline_theme='simple'
set encoding=utf-8
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline#extensions#tabline#show_tab_type = 1 
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#clock#auto = 0
let g:airline#extensions#clock#format = '%H:%M:%S'
let g:airline#extensions#clock#updatetime = 1000
let g:airline#extensions#tabline#buffer_nr_show = 1

" Maximum window size
"autocmd GUIEnter * simalt ~x

" User defined windoww size
"if has('gui_running')
    "set lines=99 columns=240
    "winpos -8 9
"endif

    " GVim settings only
    if has("gui_running")

        "FixGVimBorder
        if $VIM_FULLSCREEN_DLL_FIX
            " dll already loaded, do nothing
        else
            " load the dll fix

            " auto detects background color and uses it on the border
            " this works most of the time
            autocmd GUIEnter * call libcall("loadfixgvimborder.dll", "LoadFixGVimBorder", 0)
            "autocmd GUIEnter * simalt ~x

            " permanent solution - setup border color by hand using hex format
            " this is recomended solution
            "autocmd GUIEnter * call libcall("loadfixgvimborder.dll", "LoadFixGVimBorder", "#002B36")
            let $VIM_FULLSCREEN_DLL_FIX = 1
        endif


    endif
