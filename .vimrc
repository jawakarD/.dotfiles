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
Plug 'vim-syntastic/syntastic'
Plug 'mhinz/vim-mix-format'
Plug 'ajmwagar/vim-deus'
Plug 'pangloss/vim-javascript'
Plug 'preservim/nerdcommenter'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" vim-tsx will do all the coloring for jsx in the .tsx file
Plug 'ianks/vim-tsx'

"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" typescript-vim will do all the coloring for typescript keywords
Plug 'leafgarland/typescript-vim'

"------------------------ THEME ------------------------
" most importantly you need a good color scheme to write good code :D
Plug 'dikiaap/minimalist'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

color deus

let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

"Prettier config
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql,*.tsx,*.ts PrettierAsync

" Snippet config
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Javascript
let g:syntastic_javascript_checkers=['eslint']

" Typescript
augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
augroup END
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

" Elixir
let g:mix_format_on_save = 1

let mapleader = "\\"

set tabstop=2
set shiftwidth=2
set expandtab
nnoremap <Leader>k :NERDTreeToggle<CR>
set number

"set list
"set listchars=tab:>-
" Relative line number
nnoremap <silent> <Leader>l :let [&number, &relativenumber] =
  \ [!&number && (g:relativize_with_number \|\| !g:relativize_enabled),
  \ !&relativenumber && g:relativize_enabled]<CR>
nnoremap <silent> <Leader>rl :RelativizeToggle<CR>

nnoremap <Leader>0 :bn<CR>
nnoremap <Leader>9 :bp<CR>
