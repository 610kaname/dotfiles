" 文字コード
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

"setting"
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" コマンドライン補完一覧
set wildmenu
" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd

"見た目系"
" シンタックスハイライトの有効化
syntax on
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" 行番号
set number
" コメントの色を水色
hi Comment ctermfg=Blue
" tab
set tabstop=4
set shiftwidth=4
set expandtab
" indent系
set autoindent
set smartindent
set cindent

"検索系
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
nmap <ESC><ESC> :nohlsearch<CR><Esc>

"補完系"
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap [ []<left>
" 神 jjしか勝たん
inoremap <silent> jj <ESC>
