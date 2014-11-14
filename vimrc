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

" prj
autocmd Bufread *.prj Project %
autocmd Bufread *.prj set noautochdir
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
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
noremap <Leader>csa <ESC>:cs kill -1 <CR> <ESC>:cs add /tmp/<C-R>=system("pwd \| md5")<CR><del> <CR>
noremap <Leader>csc <Esc>:!sh /Users/sunny/.vim/bin/create_scope.sh <C-R>=getcwd()<CR>  <C-R>=system("pwd \| md5")<CR><del> <CR> <ESC>:cs kill -1 <CR> <ESC>:cs add /tmp/<C-R>=system("pwd \| md5")<CR><del><CR>

nnoremap <space> :cs f t <C-R>=expand("<cword>")<CR><CR> 
nmap <c-\> :cs f e <C-R>=expand("<cword>")<CR><CR>
nnoremap <F9> :!pman <C-R>=expand("<cword>")<CR><CR>


noremap <leader>hb <ESC>:!hg blame % -u -d -q > /tmp/.blamelog <CR>:e /tmp/.blamelog<CR>

let g:LargeFile = 1024 * 1024 * 5
augroup LargeFile
    autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType,Syntax nofoldenable nobackup | setlocal noswapfile bufhidden=unload | endif
    augroup END
