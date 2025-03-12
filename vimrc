" add color scheme packs
packadd! vim-code-dark
packadd! dracula
packadd! gruvbox

" needed to improve gruvbox colours
if (empty($TMUX))
  if (has("termguicolors") && !has('macunix'))
    set termguicolors
  endif
endif

" set color scheme
" colorscheme dracula
colorscheme distinguished
" colorscheme vim-code-dark
" colorscheme gruvbox
set background=dark

" set syntax highlighting
syntax enable
set cursorline
let g:markdown_fenced_languages = ['python', 'bash', 'sql']     " color code blocks in markdown 

" show command in bottom bar
set showcmd 

" keep screen focused
set scrolloff=20

" change <leader> key to comma
let mapleader = " "

" search settings with highlight clearing key map
set hlsearch                             " highlight matches"
set incsearch                            " search as characters are entered"
set showmatch                            " highlights similar strings on cursor
nnoremap <leader>h :nohl<CR>

" set relative numbers and display current line
set number
set relativenumber

" configure tabs
set tabstop=4        " tab width 
set softtabstop=4    " spaces in a <TAB>
set expandtab        " tabs are spaces"
set autoindent       " autoindent
filetype indent on   " configures Vim to load indent files (for vim-python-pep8-indent)

" fixed directory for swap, backup and undo files
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" configure netrw
let g:netrw_banner       = 0  "removes banner at top"
let g:netrw_liststyle    = 3  "NERDtree style look"
let g:netrw_browse_split = 0  "opens file in active window"
let g:netrw_altv	     = 1  "keeps directory in narrow vertical strip"
let g:netrw_winsize      = 25  "set window to 25% of screen"

" quickly navigate methods
nmap <leader>k [m
nmap <leader>j ]m

" opens new vertical split with new file, to the right
set splitright 
nnoremap <leader>v :vnew<CR>

" browser-like tab navigation in normal mode
nnoremap <leader>t :tabnew<CR>:Lex<CR>
nnoremap <leader>g :tabnext<CR>
nnoremap <leader>G :tabprevious<CR>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt

" jedi-vim settings
let g:jedi#force_py_version       = 3.11 "system python3 is 3.8 but 3.11 has good features
let g:jedi#use_splits_not_buffers = "right" "go to, show def, open in split
let g:jedi#smart_auto_mappings    = 1 "shows completion list for from / import
let g:jedi#completions_command    = "<C-N>" "overwrites standard autocomplete with jedi-vim

"allow mouse / ipad track pad use
set mouse=a

" SimpylFold settings for folding
let g:SimpylFold_fold_import = 0     "don't fold import statements
let g:SimpylFold_fold_docstring = 0  "don't fold docstrings
nnoremap <leader>a za
nnoremap <leader>A zA

" deal with white space and line-too-long issues
nnoremap <leader>e 80\|
autocmd BufWritePre *.py %s/\s\+$//e    

" maps autopep8 to F8
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

" Ctrl + P toggles between paste and nopaste modes
nnoremap <C-p> :set invpaste<CR>:set paste?<CR>

" removes non-breaking space character that raises PEP 8 E262 issue in comments
nnoremap <leader>w :%s/#[^/w ]/# /gc

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'
