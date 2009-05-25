set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set gfn=Consolas:h11:cEASTEUROPE
colorscheme vividchalk
set guioptions-=T
set number
set fileencoding=utf8
set fileencodings=utf8,latin2
"set encoding=utf8,latin2
au GUIEnter * simalt ~s
filetype plugin indent on

nmap <C-S-tab> :tabprevious<cr>
nmap <C-tab> :tabnext<cr>
imap <C-S-tab> <ESC>:tabprevious<cr>a
imap <C-tab> <ESC>:tabnext<cr>a
" nmap <C-t> :tabnew<cr>
" imap <C-t> <ESC>:tabnew<cr>i
"map <C-w> :tabclose<cr>
imap <S-cr> <c-x><c-u>
imap <C-cr> <c-p>
imap <F2> <ESC>:NERDTreeToggle<cr>
nmap <F2> :NERDTreeToggle<cr>
nnoremap <c-f> :FuzzyFinderFile<CR>
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent

