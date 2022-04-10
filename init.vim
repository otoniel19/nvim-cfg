call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree',{'as':'nerdtree'}
Plug 'ap/vim-css-color'
Plug 'Raimondi/delimitMate'
Plug 'neoclide/coc.nvim',{'do':'yarn install --frozen-lockfile'}
Plug '907th/vim-auto-save',{'as':'AutoSave'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc-prettier',{'as':'prettier','do':'yarn install'}
Plug 'ryanoasis/vim-devicons'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'morhetz/gruvbox', { 'as':'gruvbox' }
Plug 'github/copilot.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

let g:auto_save = 1
let g:auto_save_events=["InsertLeave","TextChanged"]
" hi Pmenu term=standout ctermfg=14 ctermbg=242

hi Pmenu cterm=underline ctermfg=250 ctermbg=235 gui=underline guifg=#bcbcbc guibg=#262626
hi PmenuSel cterm=underline ctermfg=250 ctermbg=131 gui=underline guifg=#bcbcbc guibg=#af5f5f

" let g:gruvbox_contrast_dark = 'hard'

syntax on
colorscheme iceberg
set background=dark 

" let g:prettier#autoformat = 1
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue :silent exec
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
"let g:devicons_enable = 1
" let g:devicons_enable_nerdtree = 1

set nu!
set pumwidth=10
set pumheight=15
set cursorline

execute pathogen#infect()

set noswapfile	

" set guicursor+=n-v-c:blinkon0

" let &t_SI = "\e[6 q"
" let &t_EI = "\e[2 q"

augroup myCmds
au!
autocmd InsertEnter * silent !echo -ne "\e[2 q"
au BufNewFile,BufRead *.ejs set filetype=html
augroup END

nmap <F2> :qa! <CR>
" prettier config
" let g:prettier#config#use_tabs = 'false'
" let g:prettier#config#semi = 'true'
" let g:prettier#config#trailing_comma = 'none'
" let g:prettier#autoformat_config_files = ["~/.vim/plugged/vim-prettier/node_modules/.bin/.prettierrc"]
"

"function Run(Name)  
"	echom a:Name
"moduleName endfunction

"call Run("Ola")

noremap <M-Right> :bn! <cr>
noremap <M-Left> :bp! <cr>
noremap <F3> :bwipe! <cr>
noremap <c-x> :bp \| bd # <cr>

noremap <silent> exp :CocCommand explorer . <cr>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'default'

" let g:airline_theme="gruvbox"

nmap <silent> cf <Plug>(coc-definition)
nmap <silent> cd <Plug>(coc-type-definition)
nmap <silent> ci <Plug>(coc-implementation)
nmap <silent> cr <Plug>(coc-references)

set encoding=utf-8
set linebreak
set nobackup
set completeopt=longest,menuone
set autochdir
set tabstop=2

noremap  <C-t> :term <cr>
" scroll to down
inoremap <silent><nowait><expr> <C-down> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 1)\<cr>" : "\<Right>"
" scroll to up
inoremap <silent><nowait><expr> <C-up> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 1)\<cr>" : "\<Left>"

" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

" yarn.lock

autocmd BufRead,BufNewFile yarn.lock set filetype=yaml

let g:python3_host_prog="/data/data/com.termux/files/usr/bin/python3"
let g:python_host_prog="/data/data/com.termux/files/usr/bin/python2"

" coc-snippets config

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" coc-snippets end config

" copilot config
imap <F4> <Plug>(copilot-next)
autocmd InsertEnter * norm zz
" press ctrl+m on a solution to accept
nmap <silent><nowait>cpl :Copilot panel <cr>

" copilot end config

autocmd BufEnter * set formatoptions-=cro

" telescope.vim
nnoremap <leader>ff <cmd>Telescope find_files<cr>
