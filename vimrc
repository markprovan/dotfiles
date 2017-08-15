set backspace=2         " backspace in insert mode works like normal editor
syntax on               " syntax highlighting
filetype indent on      " activates indenting for files
set autoindent          " auto indenting
set number              " line numbers
set nobackup
set expandtab

set shiftwidth=2
set tabstop=2
set expandtab 
:set directory=$HOME/.vim/swapfiles/

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'mhartington/oceanic-next'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'craigemery/vim-autotag'

call plug#end()

if (has("termguicolors"))
 set termguicolors
endif

let mapleader = "\<Space>"
nnoremap <leader>\ :vsplit<cr>
nnoremap <leader><leader> <C-w><C-w>
nnoremap <leader>p :CtrlP<CR>

nnoremap <leader>v :source ~/.vimrc<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>e :e ~/.vimrc<CR>

colorscheme OceanicNext

let g:rspec_runner = "os_x_iterm2"
" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"" CTags
function! FollowTag()
  if !exists("w:tagbrowse")
    vsplit
    let w:tagbrowse=1
  endif
  execute "tag " . expand("<cword>")
endfunction

nnoremap <leader>] :call FollowTag()<CR>


"" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
