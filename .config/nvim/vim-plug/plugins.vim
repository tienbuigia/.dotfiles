call plug#begin('~/.config/nvim/autoload/plugged')

	" File Explorer
	Plug 'scrooloose/NERDTree'
	" some essential
	Plug 'sheerun/vim-polyglot'
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	" Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
	Plug 'ap/vim-css-color'
	" sxhkd
	Plug 'kovetskiy/sxhkd-vim'
	" Emmet
	Plug 'mattn/emmet-vim'
	" Display
	Plug 'sainnhe/gruvbox-material'
	Plug 'itchyny/lightline.vim'
	" C/C++ environment
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
