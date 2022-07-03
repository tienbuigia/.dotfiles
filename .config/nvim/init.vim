" Source vim-plug
source $HOME/.config/nvim/vim-plug/plugins.vim
" Source coc keybinds
source $HOME/.config/nvim/coc-keybinds.vim

" Restart sxhkd:
autocmd BufWritePost sxhkdrc !pkill -usr1 -x sxhkd

" Config
set nu rnu ignorecase smartcase
set clipboard+=unnamedplus
set noshowmode

" Startup
echo "-- Tien dep trai yeu NHUNG! >^.^< --"

" true color
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Color-scheme
let g:gruvbox_material_enable_bold=1
let g:gruvbox_material_enable_italic=1
let g:gruvbox_material_transparent_background=1
let g:gruvbox_material_ui_contrast = 'high'
colorscheme gruvbox-material

let g:lightline = {'colorscheme': 'gruvbox_material'}
