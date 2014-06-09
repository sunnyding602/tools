syntax on
filetype plugin indent on

set incsearch
set hlsearch
set autoindent shiftwidth=4
set ruler
set showcmd 
set csto=0
set tabstop=4
set shiftwidth=4
set expandtab
set foldcolumn=2
set foldmethod=marker
set showmatch
set directory=/tmp/swp,~/tmp,/var/tmp,/tmp
set fileencodings=ucs-bom,utf-8,cp936,default,latin1
set ignorecase smartcase

noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
function! SmartTab(r)
let col=col('.')-1
if !col || getline('.')[col-1] !~ '\k'
return "\<Tab>"
else
if a:r !~ 'r'
return "\<C-N>"
else
return "\<C-P>"
endif
endif
endfunction
inoremap <tab> <C-R>=SmartTab('')<CR>
inoremap <s-tab> <C-R>=SmartTab('r')<CR>

" php
autocmd FileType php nnoremap <CR> :w!<CR>:!php -l %<CR>
autocmd FileType php nnoremap <F3> :append <CR>die(var_dump($<C-R>=expand("<cword>")<CR>));<CR>.<CR>
autocmd FileType php nnoremap <F5> <ESC>:!clear&&php -q <C-R>%
autocmd FileType php nnoremap <S-F5> <ESC>:!clear&&phpunit <C-R>%<CR>
autocmd FileType php abbr er /**drx*/error_log(strip_tags(print_r(, true))."\n", 3, "/tmp/error.log");
autocmd FileType php abbr gi :getInstance()-
autocmd FileType php abbr 2d //todo::drx
autocmd FileType php set keywordprg=pman
autocmd FileType php set dictionary-=~/.vim/doc/php_func_list.txt
autocmd FileType php set dictionary+=~/.vim/doc/php_func_list.txt
autocmd FileType php set complete-=k complete+=k
autocmd FileType javascript
  \ :setl omnifunc=jscomplete#CompleteJS
" sh
autocmd FileType sh nnoremap <F5> <ESC>:!clear&&sh <C-R>%

" cscope
noremap <F8> <ESC>:cs kill -1 <CR> <ESC>:!sh /home/sunny/.vim/cscope/create_cscope.sh<CR> <ESC>:cs add /tmp/cscope.out <CR>

"noremap <F9> <ESC>:!rm -rf /home/sunny/.vim/cscope/cscope.* <CR>

noremap <S-F8> <Esc>:! /home/sunny/.vim/cscope/create_cscope.sh <CR> <ESC>:cs kill -1 <CR> <ESC>:cs add /home/sunny/.vim/cscope/cscope.out <CR>
nnoremap <space> :cs f t <C-R>=expand("<cword>")<CR><CR> 
nnoremap <F9> :!pman <C-R>=expand("<cword>")<CR><CR>
