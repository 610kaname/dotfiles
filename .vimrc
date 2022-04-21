" 文字コード
set fenc=utf-8

"setting"
" バックアップファイル作らない
set nobackup
" スワップファイル作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でも他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示
set showcmd
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" 括弧入力時の対応する括弧を表示
set showmatch

"見た目"
" シンタックスハイライト
syntax on
" ウインドウのタイトルバーにファイルのパス情報等を表示する 
set title
" 行番号表示
set number
" コメント水色に
hi Comment ctermfg=Blue
" tab
set tabstop=4
set shiftwidth=4
set expandtab
" indent
set autoindent
set smartindent
set cindent

"検索"
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"補完"
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap [ []<left>

"神"
inoremap <silent> jj <ESC>
