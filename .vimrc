" $BJ8;z%3!<%I(B
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

"setting"
" $B%P%C%/%"%C%W%U%!%$%k$r:n$i$J$$(B
set nobackup
" $B%9%o%C%W%U%!%$%k$r:n$i$J$$(B
set noswapfile
" $BJT=8Cf$N%U%!%$%k$,JQ99$5$l$?$i<+F0$GFI$_D>$9(B
set autoread
" $B%P%C%U%!$,JT=8Cf$G$b$=$NB>$N%U%!%$%k$r3+$1$k$h$&$K(B
set hidden
" $BF~NOCf$N%3%^%s%I$r%9%F!<%?%9$KI=<($9$k(B
set showcmd
" $B%9%F!<%?%9%i%$%s$r>o$KI=<((B
set laststatus=2
" $B%3%^%s%I%i%$%s$NJd40(B
set wildmode=list:longest
" $B%3%^%s%I%i%$%sJd400lMw(B
set wildmenu
" $B%&%#%s%I%&$N1&2<$K$^$@<B9T$7$F$$$J$$F~NOCf$N%3%^%s%I$rI=<((B
set showcmd

"$B8+$?L\7O(B"
" $B%7%s%?%C%/%9%O%$%i%$%H$NM-8z2=(B
syntax on
" $B%&%$%s%I%&$N%?%$%H%k%P!<$K%U%!%$%k$N%Q%9>pJsEy$rI=<($9$k(B
set title
" $B9THV9f(B
set number
" $B%3%a%s%H$N?'$r?e?'(B
hi Comment ctermfg=Blue
" tab
set tabstop=4
set shiftwidth=4
set expandtab
" indent$B7O(B
set autoindent
set smartindent
set cindent

"$B8!:w7O(B
" $B8!:wJ8;zNs$,>.J8;z$N>l9g$OBgJ8;z>.J8;z$r6hJL$J$/8!:w$9$k(B
set ignorecase
" $B8!:wJ8;zNs$KBgJ8;z$,4^$^$l$F$$$k>l9g$O6hJL$7$F8!:w$9$k(B
set smartcase
" $B8!:wJ8;zNsF~NO;~$K=g<!BP>]J8;zNs$K%R%C%H$5$;$k(B
set incsearch
" $B8!:w;~$K:G8e$^$G9T$C$?$i:G=i$KLa$k(B
set wrapscan
" $B8!:w8l$r%O%$%i%$%HI=<((B
set hlsearch
" ESC$BO"BG$G%O%$%i%$%H2r=|(B
nmap <ESC><ESC> :nohlsearch<CR><Esc>

"$BJd407O(B"
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap [ []<left>
" $B?@(B jj$B$7$+>!$?$s(B
inoremap <silent> jj <ESC>
