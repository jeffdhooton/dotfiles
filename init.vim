" Plugin Install
call plug#begin('~/.vim/plugged')
" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy Finding
Plug 'ctrlpvim/ctrlp.vim'

" Theme
" Plug 'dracula/vim'
Plug 'tomasiser/vim-code-dark'

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git Integration
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

" Tree
Plug 'scrooloose/nerdtree'

" Commenting
Plug 'scrooloose/nerdcommenter'

" PHP
Plug 'jwalton512/vim-blade'
Plug 'alvan/vim-closetag'

" HTML
Plug 'mattn/emmet-vim'

" Javascript and Typescript
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Polyglot
Plug 'sheerun/vim-polyglot'

" Dev Icons
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Key Mappings
inoremap kj <ESC>
inoremap jk <ESC>

" Colorscheme
colorscheme codedark

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/plug-config/coc.vim
" source $HOME/.config/nvim/plug-config/dracula.vim
source $HOME/.config/nvim/plug-config/airline.vim
source $HOME/.config/nvim/plug-config/signify.vim
source $HOME/.config/nvim/plug-config/ctrlp.vim
source $HOME/.config/nvim/plug-config/nerdtree.vim
source $HOME/.config/nvim/plug-config/vim-blade.vim
source $HOME/.config/nvim/plug-config/nerdcommenter.vim
source $HOME/.config/nvim/plug-config/devicons.vim
