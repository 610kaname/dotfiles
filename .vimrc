" 文字コード
set fenc=utf-8

"神"
inoremap <silent> jj <ESC>

"方向キーの無効化
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

"入力モード時にcontrolキーを押しながら、h,j,k,lでカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

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
"カーソルの次の文字列を取得（引数は取得したい文字数）
function! GetNextString(length) abort
	let l:str = ""
	for i in range(0, a:length-1)
		let l:str = l:str.getline(".")[col(".")-1+i]
	endfor
	return l:str
endfunction

"カーソルの前の文字列を取得（引数は取得したい文字数）
function! GetPrevString(length) abort
	let l:str = ""
	for i in range(0, a:length-1)
		let l:str = getline(".")[col(".")-2-i].l:str
	endfor
	return l:str
endfunction

"アルファベットかどうかを取得
function! IsAlphabet(char) abort
	let l:charIsAlphabet = (a:char =~ "\a")
	return (l:charIsAlphabet)
endfunction

"全角かどうかを取得
function! IsFullWidth(char) abort
	let l:charIsFullWidth = (a:char =~ "[^\x01-\x7E]")
	return (l:charIsFullWidth)
endfunction

"数字かどうかを取得
function! IsNum(char) abort
	let l:charIsNum = (a:char >= "0" && a:char <= "9")
	return (l:charIsNum)
endfunction

"括弧の中にいるかどうかを取得
function IsInsideParentheses(prevChar,nextChar) abort
	let l:cursorIsInsideParentheses1 = (a:prevChar == "{" && a:nextChar == "}")
	let l:cursorIsInsideParentheses2 = (a:prevChar == "[" && a:nextChar == "]")
	let l:cursorIsInsideParentheses3 = (a:prevChar == "(" && a:nextChar == ")")
	return (l:cursorIsInsideParentheses1 || l:cursorIsInsideParentheses2 || l:cursorIsInsideParentheses3)
endfunction

"括弧の入力
function! InputParentheses(parenthesis) abort
	let l:nextChar = GetNextString(1)
	let l:prevChar = GetPrevString(1)
	let l:parentheses = { "{": "}", "[": "]", "(": ")" }

	let l:nextCharIsEmpty = (l:nextChar == "")
	let l:nextCharIsCloseParenthesis = (l:nextChar == "}" || l:nextChar == "]" || l:nextChar == ")")
	let l:nextCharIsSpace = (l:nextChar == " ")

	if l:nextCharIsEmpty || l:nextCharIsCloseParenthesis || l:nextCharIsSpace
		return a:parenthesis.l:parentheses[a:parenthesis]."\<LEFT>"
	else
		return a:parenthesis
	endif
endfunction

"閉じ括弧の入力
function! InputCloseParenthesis(parenthesis) abort
	let l:nextChar = GetNextString(1)
	if l:nextChar == a:parenthesis
		return "\<RIGHT>"
	else
		return a:parenthesis
	endif
endfunction

"クォーテーションの入力
function! InputQuot(quot) abort
	let l:nextChar = GetNextString(1)
	let l:prevChar = GetPrevString(1)

	let l:cursorIsInsideQuotes = (l:prevChar == a:quot && l:nextChar == a:quot)
	let l:nextCharIsEmpty = (l:nextChar == "")
	let l:nextCharIsClosingParenthesis = (l:nextChar == "}" || l:nextChar == "]" || l:nextChar == ")")
	let l:nextCharIsSpace = (l:nextChar == " ")
	let l:prevCharIsAlphabet = IsAlphabet(l:prevChar)
	let l:prevCharIsFullWidth = IsFullWidth(l:prevChar)
	let l:prevCharIsNum = IsNum(l:prevChar)
	let l:prevCharIsQuot = (l:prevChar == "\'" || l:prevChar == "\"" || l:prevChar == "\`")

	"if l:cursorIsInsideQuotes
    if l:nextChar == a:quot
		return "\<RIGHT>"
	elseif l:prevCharIsAlphabet || l:prevCharIsNum || l:prevCharIsFullWidth || l:prevCharIsQuot
		return a:quot
	elseif l:nextCharIsEmpty || l:nextCharIsClosingParenthesis || l:nextCharIsSpace
		return a:quot.a:quot."\<LEFT>"
	else
		return a:quot
	endif
endfunction

"改行の入力
function! InputCR() abort
	let l:nextChar = GetNextString(1)
	let l:prevChar = GetPrevString(1)
	let l:cursorIsInsideParentheses = IsInsideParentheses(l:prevChar,l:nextChar)

	if l:cursorIsInsideParentheses
		return "\<CR>\<ESC>\<S-o>"
	else
		return "\<CR>"
	endif
endfunction

"スペースキーの入力
function! InputSpace() abort
	let l:nextChar = GetNextString(1)
	let l:prevChar = GetPrevString(1)
	let l:cursorIsInsideParentheses = IsInsideParentheses(l:prevChar,l:nextChar)

	if l:cursorIsInsideParentheses
		return "\<Space>\<Space>\<LEFT>"
	else
		return "\<Space>"
	endif
endfunction

"バックスペースの入力
function! InputBS() abort
	let l:nextChar = GetNextString(1)
	let l:prevChar = GetPrevString(1)
	let l:nextTwoString = GetNextString(2)
	let l:prevTwoString = GetPrevString(2)

	let l:cursorIsInsideParentheses = IsInsideParentheses(l:prevChar,l:nextChar)

	let l:cursorIsInsideSpace1 = (l:prevTwoString == "{ " && l:nextTwoString == " }")
	let l:cursorIsInsideSpace2 = (l:prevTwoString == "[ " && l:nextTwoString == " ]")
	let l:cursorIsInsideSpace3 = (l:prevTwoString == "( " && l:nextTwoString == " )")
	let l:cursorIsInsideSpace = (l:cursorIsInsideSpace1 || l:cursorIsInsideSpace2 || l:cursorIsInsideSpace3)

	let l:existsQuot = (l:prevChar == "'" && l:nextChar == "'")
	let l:existsDoubleQuot = (l:prevChar == "\"" && l:nextChar == "\"")

	if l:cursorIsInsideParentheses || l:cursorIsInsideSpace || l:existsQuot || l:existsDoubleQuot
		return "\<BS>\<RIGHT>\<BS>"
	else
		return "\<BS>"
	endif
endfunction

"括弧で挟む
function! ClipInParentheses(parenthesis) abort
	let l:mode = mode()
	let l:parentheses = { "{": "}", "[": "]", "(": ")" }
	if l:mode ==# "v"
		return "\"ac".a:parenthesis."\<ESC>\"agpi".l:parentheses[a:parenthesis]
	elseif l:mode ==# "V"
		return "\"ac".l:parentheses[a:parenthesis]."\<ESC>\"aPi".a:parenthesis."\<CR>\<ESC>\<UP>=%"
	endif
endfunction

"クォーテーションで挟む
function! ClipInQuot(quot) abort
	let l:mode = mode()
	if l:mode ==# "v"
		return "\"ac".a:quot."\<ESC>\"agpi".a:quot
	endif
endfunction

inoremap <expr> { InputParentheses("{")
inoremap <expr> [ InputParentheses("[")
inoremap <expr> ( InputParentheses("(")
inoremap <expr> } InputCloseParenthesis("}")
inoremap <expr> ] InputCloseParenthesis("]")
inoremap <expr> ) InputCloseParenthesis(")")
inoremap <expr> ' InputQuot("\'")
inoremap <expr> " InputQuot("\"")
inoremap <expr> ` InputQuot("\`")
inoremap <expr> <CR> InputCR()
inoremap <expr> <Space> InputSpace()
inoremap <expr> <BS> InputBS()
xnoremap <expr> { ClipInParentheses("{")
xnoremap <expr> [ ClipInParentheses("[")
xnoremap <expr> ( ClipInParentheses("(")
xnoremap <expr> ' ClipInQuot("\'")
xnoremap <expr> " ClipInQuot("\"")
xnoremap <expr> ` ClipInQuot("\`")
