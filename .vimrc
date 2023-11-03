" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'scrooloose/nerdtree'
Plug 'ericbn/vim-relativize'
Plug 'kien/ctrlp.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'prettier/vim-prettier'
Plug 'valloric/youcompleteme'
Plug 'tpope/vim-fugitive'
" Plug 'vim-syntastic/syntastic'
Plug 'mhinz/vim-mix-format'
Plug 'ajmwagar/vim-deus'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
" Plug 'Chiel92/vim-autoformat'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'ElmCast/elm-vim'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" vim-tsx will do all the coloring for jsx in the .tsx file
"Plug 'ianks/vim-tsx'

"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" typescript-vim will do all the coloring for typescript keywords
"Plug 'leafgarland/typescript-vim'

"------------------------ THEME ------------------------
" most importantly you need a good color scheme to write good code :D
"Plug 'dikiaap/minimalist'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Colors
color deus

set t_Co=256
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark  " Setting dark mode
colorscheme deus

let g:indentLine_color_term = 086
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let g:coc_global_extensions = [
      \ 'coc-tsserver'
      \ ]

" Auto formatting
" Prettier config
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.json,*.css,*.scss,*.less,*.graphql,*.tsx,*.ts PrettierAsync

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['eslint'],
      \   'ruby': ['rubocop'],
      \}

" let g:ale_fix_on_save = 1

" Autoformatting
au BufWrite * :Autoformat

" Snippet config
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'

" Ctrl P
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
      \ 'file': '\.so$\|\.dat$|\.DS_Store$'
      \ }

set laststatus=2

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Javascript
" let g:syntastic_javascript_checkers=['eslint']

" Typescript
augroup SyntaxSettings
  autocmd!
  autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
augroup END
let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

" Elixir
let g:mix_format_on_save = 0

let mapleader = "\\"

set tabstop=2
set shiftwidth=2
set expandtab
nnoremap <Leader>k :NERDTreeToggle<CR>
set number
syntax on
filetype on
filetype indent on

" Ruby
autocmd FileType ruby setlocal expandtab shiftwidth=3 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

noremap <Leader>\ :Commentary<CR>
autocmd FileType ruby setlocal commentstring=#\ %s

set list
set listchars=tab:>-

" Relative line number
nnoremap <silent> <Leader>l :let [&number, &relativenumber] =
      \ [!&number && (g:relativize_with_number \|\| !g:relativize_enabled),
      \ !&relativenumber && g:relativize_enabled]<CR>
noremap <silent> <Leader>rl :RelativizeToggle<CR>
set relativenumber

" open/close nerdtree window
map — :NERDTreeToggle<CR> “ open/close nerdtree window

" this is the key to jump to the nerdtree window from a
map ] :NERDTreeFind<cr>

nnoremap <Leader>0 :bn<CR>
nnoremap <Leader>9 :bp<CR>
nnoremap <Leader>- :bn<CR>

" function! GitBranch()
"   return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
" endfunction

" function! StatuslineGit()
"   let l:branchname = GitBranch()
"   return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
" endfunction

set statusline=
" set statusline+=%#PmenuSel#
" set statusline+=%{StatuslineGit()}
" set statusline+=%#LineNr#
set statusline+=%#PmenuSel#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=

hi StatusLine ctermbg=green ctermfg=green
hi Conceal ctermfg=green
