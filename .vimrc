" Packages

" mkdir -p ~/.vim/pack/airblade/opt
" git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/pack/airblade/opt/gitgutter
" vim -u NONE -c "helptags ~/.vim/pack/airblade/opt/gitgutter/doc" -c q
packadd! gitgutter

" git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/preservim/opt/nerdtree
" vim -u NONE -c "helptags ~/.vim/pack/preservim/opt/nerdtree/doc" -c q
packadd! nerdtree

" Git commands inside Vim
" git clone https://tpope.io/vim/fugitive.git ~/.vim/pack/tpope/opt/fugitive
" vim -u NONE -c "helptags ~/.vim/pack/tpope/opt/fugitive/doc" -c q
packadd! fugitive

" git clone --recurse-submodules https://github.com/ycm-core/YouCompleteMe.git ~/.vim/pack/YouCompleteMe/opt/YouCompleteMe
" sh -c "cd ~/.vim/pack/YouCompleteMe/opt/YouCompleteMe && ./install.py --rust-completer --clang-completer"
packadd! YouCompleteMe

" git clone https://tpope.io/vim/surround.git ~/.vim/pack/tpope/opt/surround
" vim -u NONE -c "helptags ~/.vim/pack/tpope/opt/surround/doc" -c q
packadd! surround

" git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/vim-airline/opt/airline
" vim -u NONE -c ":helptags ~/.vim/pack/vim-airline/opt/airline/doc" -c q
packadd! airline

" git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/pack/vim-airline/opt/airline-themes
" vim -u NONE -c ":helptags ~/.vim/pack/vim-airline/opt/airline-themes/doc" -c q
packadd! airline-themes

" git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.vim/pack/dense-analysis/opt/ale
" vim -u NONE -c ":helptags ~/.vim/pack/dense-analasys/opt/ale/doc" -c q
packadd! ale

" https://codeinthehole.com/tips/writing-markdown-in-vim/
" -> Polyglot bundles the excellent preservim/vim-markdown plugin, but install it directly so the latest version is used
let g:polyglot_disabled = ['markdown.plugin']
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
" sudo apt install fzf -y
packadd! fzf
packadd! fzf-vim

" GitHub Copilot
" git clone https://github.com/github/copilot.vim.git ~/.vim/pack/github/opt/copilot.vim
"packadd! copilot.vim

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

"
" ALE (Asynchronous Lint Engine)
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
" let g:ale_echo_msg_format = '[%linter%][%code%] %s [%severity%]'
" see https://flake8.readthedocs.io/en/latest/
let g:ale_python_flake8_options = '--max-line-length 100 --ignore E501' " E501 is line too long (80 chars)
let g:ale_sign_column_always = 1 " Maintains gutter open.
let g:ale_deno_import_map = "import-map.json"

" LDA Fri, 21 Jan 2022 15:34:10 +0100
" had to install eslint:
" npm install eslint -g (an obsolete version was installed with apt install
" eslint).
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'typescript': ['tsserver'],
      "\ 'typescript': ['deno'], (this idiot does not find modules without ".ts")
      \ 'python': ['pylint', 'flake8'],
      \ 'c': ['clangtidy'],
      \ 'tex': ['chktex'],
	  \ 'tcl': [],
	  \ 'exp': [],
      \}

" LDA for black I had to install it through:
" pip install black --user
let g:ale_fixers = {}
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'rust': ['rustfmt'],
      \ 'markdown': ['prettier'],
      \ 'javascript': ['deno'],
      \}
let g:ale_fixers.python = ['black']
let g:ale_fixers.typescript = ['deno']
let g:ale_fix_on_save = 1
let g:ale_fix_on_save_ignore = {
	\ 'markdown': ['prettier']
	\}
let g:rustfmt_autosave = 1

" Inarix ⟶ PNX is using Poetry.
let g:ale_python_pylint_executable = 'poetry'

autocmd FileType python
            \ set cc=88 " Black default configuration

" Change ALE warnings and errors colors, thanks to this explanation from Reddit:
" https://www.reddit.com/r/vim/comments/1br0fgx/comment/kx89s24/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
autocmd ColorScheme * highlight ALEVirtualTextError ctermfg=red
autocmd ColorScheme * highlight ALEVirtualTextWarning ctermfg=yellow

set cindent
set autoindent
filetype plugin indent on    " required
set number
" set relativenumber
set backup

set t_Co=256
" Properly display true colors colorschemes.
" See https://stackoverflow.com/a/62703167
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
syntax on
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
" LDA Mon, 12 Aug 2024 11:42:09 +0200
" The line below made "p" paste from the clipboard instead of the default
" unnamed buffer (""). I removed it and now it works fine on the MacBook Pro.
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

" Configuration des fichiers Docker
au BufRead,BufNewFile *.yml,*.yaml
    \ set tabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set fileformat=unix
au BufRead,BufNewFile *.conf set tabstop=2 shiftwidth=2 expandtab


set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,~/Library/*        " Linux/MacOSX


" Ferme VIM si le dernier onglet est NERDTree.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Saut de ligne automatique sur les fichiers .txt
if has('autocmd')
	au BufRead,BufNewFile *.txt set wm=2 tw=100
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

au BufNewFile,BufRead *.html,*.css
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

nnoremap T :Tabl<CR>

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
ab sectino section
ab configuratino configuration
ab iwht with
ab heelp help
ab lstlistling lstlisting
ab optino option

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
nnoremap <F12> :tab split \| YcmCompleter GoTo<CR>
" Sun, 18 Dec 2022 15:38:39 +0100
" Disabling YCM documentation automatic popup on hovering, because it's waaaay to long for Rust
" and I cannot see errors or commandline.
let g:ycm_auto_hover="''"
" If one want to see the help, just press <leader>D above the word.
nmap <leader>D <plug>(YCMHover)
" No display of diagnostics. Let ALE do the job.
let g:ycm_show_diagnostics_ui = 0  " this is the E> or W> in the gutter.
let g:ycm_enable_diagnostic_highlighting = 0  " this is the actual highlighting.
let g:ycm_error_symbol = 'E>'
let g:ycm_warning_symbol = 'W>'

" Enable YCM doc popover for Typescript (ts) files.
augroup MyYCMCustom
  autocmd!
  autocmd FileType ts let b:ycm_hover = {
    \ 'command': 'GetHover',
    \ 'syntax': &filetype
    \ 'popup_params': {
    \     'maxwidth': 80,
	\     'maxheight': 20,
    \     'border': [],
    \     'borderchars': ['─', '│', '─', '│', '┌', '┐', '┘', '└'],
    \   },
    \ }
augroup END

" Enable YCM doc popover for Rust (rs) files.
augroup MyYCMCustom
  autocmd!
  autocmd FileType rs let b:ycm_hover = {
    \ 'command': 'GetHover',
    \ 'syntax': &filetype
    \ 'popup_params': {
    \     'maxwidth': 80,
    \     'line': 'cursor-5',
	\     'maxheight': 20,
    \     'border': [],
    \     'borderchars': ['─', '│', '─', '│', '┌', '┐', '┘', '└'],
    \   },
    \ }
augroup END


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

" Research configuration.
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>w :Rg <C-R><C-W><CR>
nnoremap <silent> <Leader>j :RG<CR>
nnoremap <silent> <Leader>b :History<CR>
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
nnoremap <leader>c :Commits<CR>

"
" FZF configuration
let g:fzf_vim = {}
" Preview window always displayed on the right, unless there is less than 70
" columns, then it's up to 50% height on top of the search. Ctrl + / to
" toggle.
let g:fzf_vim.preview_window = ['right,50%,<70(up,50%)', 'ctrl-/']
" Overriding :Rg and :RG to add "--no-ignore" and "--follow".
" Original code from ~/.vim/pack/junegunn/opt/fzf-vim/plugin/fzf.vim, lines 63 and 64.
" TODO determine if "--follow" does not imply too much processing (/var/oscp/* is quite deep)
command! -bang -nargs=* Rg call fzf#vim#grep("rg --follow --column --line-number --no-heading --color=always --smart-case --ignore-file ~/.rgignore -- ".fzf#shellescape(<q-args>), fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* RG call fzf#vim#grep2("rg --follow --no-ignore --column --line-number --no-heading --color=always --smart-case --ignore-file ~/.rgignore -- ", <q-args>, fzf#vim#with_preview({'dir': '~/Documents/github.com/'}), <bang>0)'
" LDA Tue, 13 Aug 2024 18:22:45 +0200
" I added `--ignore-file ~/.rgignore` so despite `--no-ignore` it reads ~/.rgignore.
" I want to avoid *~ files (see ~/.rgignore).

" Using FZF as a CtrlP replacement.
noremap <C-p> :Files<CR>
noremap <C-d> :Files /Users/luc/Documents/<CR>
" Warning: <C-m> maps to 'Enter', and so messes up with other plugins.
" noremap <C-m> :Files /Users/luc/a/me/<CR>

" GitHub Copilot shortcuts
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
let g:copilot_filetypes = {
			\ 'tex': v:false,
			\ 'markdown': v:false,
			\ }

" <C-j> to jump tags like <C-]> (in fucking macOS).
augroup HelpMaps
    autocmd!
    autocmd FileType help :nnoremap <buffer> <C-j> <C-]>
augroup END

" Consider Kanata configuration files as Lisp.
augroup filetypedetect
    autocmd BufNew,BufNewFile,BufRead *.kbd :setfiletype lisp
augroup END

"
" Improving colorscheme for copilot comments
" https://github.com/NLKNguyen/papercolor-theme
autocmd ColorScheme PaperColor
			\ highlight CopilotSuggestion guifg=#5fafd7 ctermfg=8

"
" Notes
" * To search for a digraph, run `:h digraph-table`, then use / or ?.
" * To indent a markdown table under the cursor, run `:TableFormat`.
