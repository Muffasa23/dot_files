set nocompatible
" ----------------------------------------
" Automatic installation of vim-plug, if it's not available
" ----------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"-----------------------------------------
" Automatically install missing plugins on startup
"-----------------------------------------
"autocmd VimEnter *
"      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"      \|   PlugInstall --sync | q
"      \| endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug (https://github.com/junegunn/vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'sainnhe/gruvbox-material' " themes
Plug 'KabbAmine/yowish.vim'
Plug 'jacoborus/tender.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'
Plug 'crusoexia/vim-monokai'

Plug 'sheerun/vim-polyglot'    " Better syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'scrooloose/nerdtree'     " File manager
Plug 'vifm/vifm.vim'

Plug 'derekwyatt/vim-fswitch'  " For C/C++
Plug 'kshenoy/vim-signature'
Plug 'Yggdroot/LeaderF'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-signify'

Plug 'vim-python/python-syntax'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround' 
Plug 'itchyny/lightline.vim'
call plug#end()

" vim-plug does not require any extra statement other than plug#begin()
" and plug#end(). You can remove filetype off, filetype plugin indent on
" and syntax on from your .vimrc as they are automatically handled by
" plug#begin() and plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theme and background
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable                   " highlight syntax
syntax on                       " replace default
set background=dark
colorscheme monokai

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line (Powered by lightline plugin)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ }

set laststatus=2                " Always show status line
set t_Co=256                    " Use 256 colors
set noshowmode                  " Will not show insert/visual text below

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd vimenter * NERDTree     "Open NERDTree automatically
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif   " Close if only NERDTree is left 
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => C/C++
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" switch between *.cpp and *.h, powered by fswitch
nmap <silent> <Leader>sw :FSHere<cr>

" tags 
set tags=./.tags;,.tags             " ; means if current dir not found, find in parent directory
nmap <Leader>tn :tnext<CR>          " iterate the same-name tags
nmap <Leader>tp :tprevious<CR>

" Leaderf
" Faster than Ctrlp/Fzf for fuzzy search in/between files
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <c-p> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <c-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

" nerd commenter
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" ale plugin (check syntax and linter)
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

" cpp enhanced highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_no_function_highlight = 1            " user-defined functions

