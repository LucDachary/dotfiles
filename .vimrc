" Packages

" mkdir -p ~/.vim/pack/airblade/opt
" git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/pack/airblade/opt/gitgutter
" vim -u NONE -c "helptags ~/.vim/pack/airblade/opt/gitgutter/doc" -c q
packadd! gitgutter

" git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/preservim/opt/nerdtree
" vim -u NONE -c "helptags ~/.vim/pack/preservim/opt/nerdtree/doc" -c q
packadd! nerdtree

" git clone https://tpope.io/vim/fugitive.git ~/.vim/pack/tpope/opt/fugitive
" vim -u NONE -c "helptags ~/.vim/pack/tpope/opt/fugitive/doc" -c q
packadd! fugitive

" git clone --recurse-submodules https://github.com/ycm-core/YouCompleteMe.git ~/.vim/pack/YouCompleteMe/opt/YouCompleteMe
" sh -c "cd ~/.vim/pack/YouCompleteMe/opt/YouCompleteMe && ./install.py --rust-completer --clang-completer"
packadd! YouCompleteMe

" git clone https://tpope.io/vim/surround.git ~/.vim/pack/tpope/opt/surround
" vim -u NONE -c "helptags ~/.vim/pack/tpope/opt/surround/doc" -c q
packadd! surround

" git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/pack/ctrlpvim/opt/ctrlp
" vim -u NONE -c "helptags ~/.vim/pack/ctrlpvim/opt/ctrlp" -c q
packadd! ctrlp

" git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/vim-airline/opt/airline
" vim -u NONE -c ":helptags ~/.vim/pack/vim-airline/opt/airline/doc" -c q
packadd! airline

" git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/pack/vim-airline/opt/airline-themes
" vim -u NONE -c ":helptags ~/.vim/pack/vim-airline/opt/airline-themes/doc" -c q
packadd! airline-themes

" git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/dense-analysis/opt/ale
" vim -u NONE -c ":helptags ~/.vim/pack/dense-analasys/opt/ale/doc" -c q
packadd! ale

" git clone --depth 1 https://github.com/sheerun/vim-polyglot ~/.vim/pack/sheerun/start/polyglot
" vim -u NONE -c ":helptags ~/.vim/pack/sheerun/opt/polyglot/doc" -c q
packadd! polyglot

" Required by vim-markdown
" git clone git@github.com:godlygeek/tabular.git ~/.vim/pack/godlygeek/opt/tabular
" vim -u NONE -c ":helptags ~/.vim/pack/godlygeek/opt/tabular/doc" -c q
packadd! tabular
" git clone git@github.com:preservim/vim-markdown.git ~/.vim/pack/preservim/opt/markdown
" vim -u NONE -c ":helptags ~/.vim/pack/preservim/opt/markdown/doc" -c q
packadd! markdown

" git clone git@github.com:lervag/vimtex.git ~/.vim/pack/lervag/opt/vimtex
" vim -u NONE -c ":helptags ~/.vim/pack/lervag/opt/vimtex/doc" -c q
packadd! vimtex

" git clone https://github.com/rust-lang/rust.vim ~/.vim/pack/rust-lang/opt/rust
" vim -u NONE -c ":helptags ~/.vim/pack/rust-lang/opt/rust/doc" -c q
packadd! rust

" Workaround module for the clipboard.
" git clone https://github.com/jasonccox/vim-wayland-clipboard.git ~/.vim/pack/jasonccox/opt/wayland-clipboard
packadd! wayland-clipboard

" FZF
" git clone git@github.com:junegunn/fzf.git ~/.vim/pack/junegunn/opt/fzf
" git clone git@github.com:junegunn/fzf.vim.git ~/.vim/pack/junegunn/opt/fzf-vim
packadd! fzf
packadd! fzf-vim

"
" Colors modules
" git clone git@github.com:KabbAmine/yowish.vim.git ~/.vim/pack/colors/opt/yowish
packadd! yowish
" git clone git@github.com:NLKNguyen/papercolor-theme.git ~/.vim/pack/colors/opt/papercolor
packadd! papercolor

set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin indent on    " required

set encoding=utf-8
set arabicshape
set noignorecase

" vim-gutter
set updatetime=100

" show a visual line under the cursor's current line
set cursorline
" show the matching part of the pair for [] {} and ()
set showmatch

" Vim-airline configuration
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#exclude_preview = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
" Print the name of the current working directory.
let g:airline_section_a = '%{fnamemodify(getcwd(), ":t")}'
" Erase the section b because the display is to small for this information.
let g:airline_section_b = ''
" Print the name of the current file, starting from $HOME or cwd, replace "dreem" by "D".
let g:airline_section_c = '%{fnamemodify(expand("%"), ":p:~:.:gs?dreem?D?")}'
let g:airline_section_x = ''
let g:airline_section_error = ''
let g:airline_section_warning = ''

" Installation of ALE (Asynchronous Lint Engine)
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" ALE configuration.
let g:ale_echo_msg_format = '[%linter%][%code%] %s [%severity%]'
" see https://flake8.readthedocs.io/en/latest/
let g:ale_python_flake8_options = '--max-line-length 100 --ignore E501' " E501 is line too long (80 chars)
let g:ale_sign_column_always = 1 " Maintains gutter open.

" LDA Fri, 21 Jan 2022 15:34:10 +0100
" had to install eslint:
" npm install eslint -g (an obsolete version was installed with apt install
" eslint).
let g:ale_linters = {
            \ 'javascript': ['eslint'],
            \ 'python': ['flake8'],
			\ 'c': ['clangtidy'],
			\ 'tex': ['chktex'],
            \}
" LDA for black I had to install it through:
" pip install black --user
let g:ale_fixers = {
            \ 'javascript': ['eslint'],
            \ 'python': ['black'],
            \}
let g:ale_fix_on_save = 1
" Alternatively, disable these fixers on save for all filetypes.
let g:ale_fix_on_save_ignore = ['black']
let g:rustfmt_autosave = 1

set cindent
set autoindent
filetype plugin indent on    " required
syntax on
set number
" set relativenumber
set backup

syntax enable
set t_Co=256
" Properly display true colors colorschemes.
" See https://stackoverflow.com/a/62703167
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
colorscheme PaperColor

set foldmethod=indent
set shiftwidth=4
set tabstop=4
" Unset folding. It can be set up later.
set nofoldenable

"Indente automatiquement l'étoile des commentaires après la saisie de /**
set formatoptions+=r

"On place le presse-papier sur le tampon anonyme
"unnamedplus is + register, the X11 clipboard
"unnamed is the * register, the selection (and the mouse middle key on Linux
"OSes).
set clipboard=unnamedplus

let mapleader = ","
let maplocalleader = "_"

" Marque à 100 caractères.
set cc=100

" Raccourci pour NerdTree
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>
" Exits Vim is NERDTree is the last buffer.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Consider .phtml as HTML file.
" au BufRead,BufNewFile *.phtml     setfiletype html
" Consider .twig as HTML file.
au BufRead,BufNewFile *.twig        setfiletype html

" Raccourci pour tous les projets.
noremap <C-d> :CtrlP /home/luc/dreem<CR>
noremap <C-m> :CtrlP /home/luc/me<CR>

" A few NON-RECURSIVE shortcuts for INSERT and COMMAND-LINE mode.
" 2020-09-14 I have configured these mappings in tmux.conf for global availability.
"noremap! ù /
"noremap! / ù
"noremap ù /
"noremap / ù
"noremap! é ~
"noremap! ~ é
"noremap! ç `
"noremap! ` ç
"noremap! è \
"noremap! \ è
"noremap! à @
"noremap! @ à
"noremap! # ²
"noremap! ² #

" Configuration des fichiers Docker
au BufRead,BufNewFile *.yml
    \ set tabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab
au BufRead,BufNewFile *.conf set tabstop=2 shiftwidth=2 expandtab

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_lazy_update = 1 " Updates after 250ms without typing. 0 to disable
" (The following is a Vim option.)
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX
" (The following is dedicated to CtrlP.)
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v(/cache)|(node_modules)|(\w+/vendor)|(\w+/build)$',
            \ }
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40

" 2018-10-03: Essai de find, puisque je ne vois plus des fichiers (comme `login_app/views/*`).
" 2019-09-02: commenting since the default globpath() works with g:ctrlp_custom_ignore. See above.
" let g:ctrlp_user_command = 'find %s -type f -not -name "*.pyc" -not -path "*.git*" -not -path "*build*" -not -path "*vendor*" -not -path "*node_modules*"'

" Ferme VIM si le dernier onglet est NERDTree.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Saut de ligne automatique sur les fichiers .txt
if has('autocmd')
	au BufRead,BufNewFile *.txt set wm=2 tw=80
endif

" 2017-08-19 improvments
" Read https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" This is not set by vim-polyglot.
au BufNewFile,BufRead *.js
			\ set expandtab

" Python PEP8 configuration
"au BufNewFile,BufRead *.py
"    \ set foldmethod=indent |
"    \ set tabstop=4 |
"    \ set softtabstop=4 |
"    \ set shiftwidth=4 |
"    \ set textwidth=99 |
"    \ set expandtab |
"    \ set autoindent |
"    \ set fileformat=unix
"
au BufNewFile,BufRead *.html,*.css,*.yaml
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set expandtab |
    \ set autoindent |
    \ set shiftwidth=4 |
    \ set fileformat=unix
"
" au BufNewFile,BufRead *.js set tabstop=4 softtabstop=4 shiftwidth=4
au BufNewFile,BufRead *.c,*.h
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set expandtab |
    \ set autoindent |
    \ set shiftwidth=4 |
    \ set fileformat=unix

" Flag unrequired whitespaces
" Run :so $VIMRUNTIME/syntax/hitest.vim to get the available group (from which
" SpellCab comes).
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.js
    \ match SpellCap /\s\+$/

" Markdown syntax configuration
let g:vim_markdown_toc_autofit = 1
set conceallevel=2 " To have italic, bold and links, instead of _italic_, __bold__, and [link](http://...).
let g:vim_markdown_no_extensions_in_markdown = 1 " For GitHub and GitLab wiki.
let g:vim_markdown_autowrite = 1 " Autosave when following links with command ge.

" Ctrl+j and Ctrl+k to navigate
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Indent JSON files
" See https://coderwall.com/p/faceag/format-json-in-vim
" Other options:
" com! FormatJSON %!python -m json.tool
" function! FormatJSON()
" :%!python -m json.tool
" endfunction
nmap =j :%!python -m json.tool<CR>

" LaTeX
let g:tex_flavor = 'latex'
let g:vimtex_syntax_enabled = 1
let g:tex_fold_enabled=1
let g:vimtex_compiler_latexmk_engines = {
            \ '_'                : '-xelatex',
            \ 'pdflatex'         : '-pdf',
            \ 'dvipdfex'         : '-pdfdvi',
            \ 'lualatex'         : '-lualatex',
            \ 'xelatex'          : '-xelatex',
            \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
            \ 'context (luatex)' : '-pdf -pdflatex=context',
            \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
            \}
let g:vimtex_compiler_latexmk = {
            \ 'backend' : 'process',
            \ 'background' : 1,
            \ 'build_dir' : './xelatex-build',
            \ 'callback' : 1,
            \ 'continuous' : 1,
            \ 'executable' : 'latexmk',
            \ 'hooks' : [],
            \ 'options' : [
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \ ],
            \}

" Clear the search highlighting
nnoremap ,<space> :nohlsearch<CR>

" My custom abbreviations.
ab sefl self
ab teh the
ab rseponse response
ab statsu status
ab respnse response
ab defualt default

" Comment in and out for # (Python).
vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>

" Comment in and out for " (VIM).
" LDA: wrong idea, since I cannot fill a buffer in visual mode with these.
"vnoremap <silent> " :s/^/"/<cr>:noh<cr>
"vnoremap <silent> -" :s/^"//<cr>:noh<cr>

" Comment in and out for / (VIM).
vnoremap <silent> / :s/^/\/\//<cr>:noh<cr>
vnoremap <silent> -/ :s/\v^\s*\/\///<cr>:noh<cr>

" Comment in and out for / (SHALL).
vnoremap <silent> ; :s/^/;/<cr>:noh<cr>
vnoremap <silent> -; :s/^;//<cr>:noh<cr>

" Put these lines at the very end of your vimrc file.
" https://github.com/dense-analysis/ale#generating-vim-help-files

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

" LDA this might fix issues with the block cursor being invisible width colorscheme envy.
" Sun, 06 Mar 2022 11:30:50 +0100
" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
if exists('$TMUX')
   " set insert mode to a cyan vertical line   
   let &t_SI .= "\<esc>Ptmux;\<esc>\<esc>[6 q\<esc>\\"
   let &t_SI .= "\<esc>Ptmux;\<esc>\<esc>]12;cyan\x7\<esc>\\"
   " set normal mode to a green block
   let &t_EI .= "\<esc>Ptmux;\<esc>\<esc>[2 q\<esc>\\"
   let &t_EI .= "\<esc>Ptmux;\<esc>\<esc>]12;green\x7\<esc>\\"
   " set replace mode to an orange underscore
   let &t_SR .= "\<esc>Ptmux;\<esc>\<esc>[4 q\<esc>\\"
   let &t_SR .= "\<esc>Ptmux;\<esc>\<esc>]12;orange\x7\<esc>\\"

   " initialize cursor shape/color on startup (silent !echo approach doesn't seem to work for tmux)
   augroup ResetCursorShape
      au!
      "autocmd VimEnter * startinsert | stopinsert
      autocmd VimEnter * normal! :startinsert :stopinsert
      "autocmd VimEnter * :normal :startinsert :stopinsert
   augroup END

   " reset cursor when leaving tmux
   autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[2 q\033\\"
   autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033]12;gray\007\033\\"
 endif

" YouCompleteMe shortcuts
nnoremap <F10> :YcmCompleter GoTo<cr>
nnoremap <F11> :tab split \| YcmCompleter GoTo<CR>
" Sun, 18 Dec 2022 15:38:39 +0100
" Disabling YCM documentation automatic popup on hovering, because it's waaaay to long for Rust
" and I cannot see errors or commandline.
let g:ycm_auto_hover="''"
" If one want to see the help, just press <leader>D above the word.
nmap <leader>D <plug>(YCMHover)


 " Allows custom .vimrc files in projects directories, but in secure mode.
 " See https://www.alexeyshmalko.com/2014/using-vim-as-c-cpp-ide/
set exrc
set secure

" See https://vim.fandom.com/wiki/Run_a_command_in_multiple_buffers
" Like windo but restore the current window.
function! WinDo(command)
  let currwin=winnr()
  execute 'windo ' . a:command
  execute currwin . 'wincmd w'
endfunction
com! -nargs=+ -complete=command Windo call WinDo(<q-args>)

" Like bufdo but restore the current buffer.
function! BufDo(command)
  let currBuff=bufnr("%")
  execute 'bufdo ' . a:command
  execute 'buffer ' . currBuff
endfunction
com! -nargs=+ -complete=command Bufdo call BufDo(<q-args>)

" Like tabdo but restore the current tab.
function! TabDo(command)
  let currTab=tabpagenr()
  execute 'tabdo ' . a:command
  execute 'tabn ' . currTab
endfunction
com! -nargs=+ -complete=command Tabdo call TabDo(<q-args>)

" Removes all NERDTree panels on Vim closure.
autocmd VimLeave * TabDo NERDTreeClose

set pastetoggle=<F2>

" Fri, 12 Aug 2022 14:11:15 +0200
" Tip to save as root while file is opened as user:
" :w !sudo tee %
" Show diff before svaing the current file
" :w !diff % -
" Open vim on a given line
" vim +xx FILE

" Thu, 27 Oct 2022 09:48:50 +0200
" Tentative pour brancher Ctrl-i vers "\emph{*}" avec le curseur à la place de
" l'asterisk.
" :imap <C-i> \emph{}<Esc>i
" → Ca fonctionne mais ce n'est pas pratique d'avoir fermé l'accolade.
:imap <C-i> \emph{
:imap <C-b> \textbf{

" Research configuration.
nnoremap <silent> <Leader>f :Rg<CR>
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
" TODO fix
nmap <leader>j :Rg "<C-r>=expand("<cword>")<cr>"<space>
