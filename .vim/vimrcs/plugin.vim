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
" Themes
Plug 'liuchengxu/space-vim-dark'
Plug 'jaredgorski/spacecamp'
Plug 'rakr/vim-two-firewatch'
Plug 'dikiaap/minimalist'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'cseelus/vim-colors-lucid'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'ayu-theme/ayu-vim'
Plug 'w0ng/vim-hybrid'
Plug 'cocopon/iceberg.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'ajmwagar/vim-deus'
Plug 'KabbAmine/yowish.vim'
Plug 'crusoexia/vim-monokai'
Plug 'tomasr/molokai'
Plug 'fmoralesc/molokayo'
Plug 'nanotech/jellybeans.vim'
Plug 'jpo/vim-railscasts-theme'
Plug 'junegunn/seoul256.vim'
Plug 'sainnhe/sonokai'
Plug 'mhartington/oceanic-next'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep'  }
Plug 'danilo-augusto/vim-afterglow'
Plug 'AlessandroYorba/Sierra'
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'
Plug 'jacoborus/tender.vim'
Plug 'kyoz/purify'
Plug 'sts10/vim-pink-moon'
Plug 'AlessandroYorba/Alduin'
Plug 'tlhr/anderson.vim'
Plug 'zacanger/angr.vim'
Plug 'romainl/Apprentice'
Plug 'gregsexton/Atom'
Plug 'wadackel/vim-dogrun'
Plug 'altercation/vim-colors-solarized'
Plug 'rakr/vim-colors-rakr'
Plug 'lifepillar/vim-gruvbox8'
Plug 'sjl/badwolf'

" Syntax
Plug 'sheerun/vim-polyglot'    " Better syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-python/python-syntax'
Plug 'dense-analysis/ale'
" Plug 'maximbaz/lightline-ale'

" File manager
Plug 'vifm/vifm.vim'
Plug 'Yggdroot/LeaderF'

" C/C++/Python IDE
Plug 'derekwyatt/vim-fswitch'   " switch between *cpp & *.h
Plug 'kshenoy/vim-signature'    " Show marks
Plug 'preservim/nerdcommenter'
Plug 'ludovicchabant/vim-gutentags' " ctags
" Plug 'ycm-core/YouCompleteMe'
Plug 'Shougo/echodoc.vim'
Plug 'davidhalter/jedi-vim'     " Python completetion

" Git
Plug 'mhinz/vim-signify'        " Light gitgutter
Plug 'zivyangll/git-blame.vim'

" Better editing 
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'        " align
Plug 'jiangmiao/auto-pairs'     " insert or delete pairs of brackets
Plug 'tpope/vim-surround'       " change text in pairs of brackets

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
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set background=dark
colorscheme one

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line (Powered by lightline plugin)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
    \ 'colorscheme': 'iceberg',
    \ }

set laststatus=2                " Always show status line
set t_Co=256                    " Use 256 colors
set noshowmode                  " Will not show insert/visual text below

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => indentline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_enabled = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_color_term = 234

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fswitch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" switch between *.cpp and *.h
nmap <silent> <Leader>sw :FSHere<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leaderf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Faster than Ctrlp/Fzf for fuzzy search in/between files
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-m> :LeaderfMru<cr>
noremap <c-p> :LeaderfFunction!<cr>
noremap <c-b> :LeaderfBuffer<cr>
noremap <c-t> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Commenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => signify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => git.blame
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => cpp enhanced highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_no_function_highlight = 1            " user-defined functions

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gutentags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=./.tags;,.tags             " ; means if current dir not found, find in parent directory
nmap <Leader>tn :tnext<CR>          " iterate the same-name tags
nmap <Leader>tp :tprevious<CR>

" Will stop searching if met these file/dir name
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" tag file name
let g:gutentags_ctags_tagfile = '.tags'
" Create tags file in ~/.cache/tags
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" ctags params
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" Create ~/.cache/tags if not exists
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YCM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ycm_server_log_level = 'info'
" let g:ycm_min_num_identifier_candidate_chars = 2
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_complete_in_strings=1
"
" " Don't show diagnostics info (but this will mess with ale msg showing)
" " let g:ycm_show_diagnostics_ui = 0
"
" " Will not show function prototype preview
" set completeopt=menu,menuone
" let g:ycm_add_preview_to_completeopt = 0
"
" " Show completion key
" let g:ycm_key_invoke_completion = '<c-z>'
" noremap <c-z> <NOP>
"
" " After typing two characters, will show completion options
" let g:ycm_semantic_triggers =  {
"            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
"            \ 'cs,lua,javascript': ['re!\w{2}'],
"            \ }
"
" " Other filetypes YCM will not spend time analyzing
" let g:ycm_filetype_whitelist = {
"       \ "c":1,
"       \ "cpp":1,
"       \ "py":1,
"       \ "h":1,
"       \ "go":1,
"       \ "objc":1,
"       \ "sh":1,
"       \ "zsh":1,
"       \ "zimbu":1,
" \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
            \ 'cpp': ['g++','cppcheck'],
            \ 'c': ['gcc', 'cppcheck'],
            \ 'python': ['flake8'],
            \}
let g:ale_linters_explicit = 1

" this is where compile_commands.json locates
let g:ale_c_build_dir_names = ['deploy', 'binary']

let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 100
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:airline#extensions#ale#enabled = 1

" only run linter during these situations
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

" better style
let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline-ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:lightline = {}

" let g:lightline.component_expand = {
"       \  'linter_checking': 'lightline#ale#checking',
"       \  'linter_infos': 'lightline#ale#infos',
"       \  'linter_warnings': 'lightline#ale#warnings',
"       \  'linter_errors': 'lightline#ale#errors',
"       \  'linter_ok': 'lightline#ale#ok',
"       \ }
"
" let g:lightline.component_type = {
"       \     'linter_checking': 'right',
"       \     'linter_infos': 'right',
"       \     'linter_warnings': 'warning',
"       \     'linter_errors': 'error',
"       \     'linter_ok': 'right',
"       \ }
"
" let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }
