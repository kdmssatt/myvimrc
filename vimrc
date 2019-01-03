filetype plugin indent on
set clipboard+=unnamed
"タブ
set tabstop=2
set softtabstop=2
set shiftwidth=2
"スワップファイルを作成しない
set noswapfile
"チルダファイルを作成しない
set nobackup
"vim の独自拡張機能を使う(viとの互換性をとらない)
set nocompatible
" 文字コードを指定する
set encoding=utf-8
" ファイルエンコードを指定する
"set fileencodings=iso-2022-jp,sjis
set fileencodings=utf-8
" 自動認識させる改行コードを指定する
set fileformats=unix,dos
" バックアップをとる
" 逆は [ set backup ]
set nobackup
" 検索履歴を50個残す
set history=50
" 検索時に大文字小文字を区別しない
set ignorecase
" 検索語に大文字を混ぜると検索時に大文字を区別する
set smartcase
" 検索語にマッチした単語をハイライトする. 逆は [ set nohlsearch ]
set hlsearch
" インクリメンタルサーチを使う ( 検索語を入れている途中から随時マッチする文字列の検索を開始) 逆は [ set noincsearch ]
set incsearch
" 行番号を表示する. 逆は [ set nonumber ]
set number
" 背景色
set background=dark
" 改行 ( $ ) やタブ ( ^I ) を可視化する. 改行文字とタブ文字を表示
set list
set listchars=tab:>-,eol:<
" 括弧入力時に対応する括弧を強調する
set showmatch
" 構文ごとに色分け表示する. 逆は [ syntax off ]
syntax on
set synmaxcol=200
" [ syntax on ] の場合のコメント文の色を変更する
highlight Comment ctermfg=LightCyan
" ウィンドウ幅で行を折り返す. 逆は [ set nowrap ]
set wrap
" 挿入モードでTABを挿入するとき、代わりに適切な数の空白を使う
set expandtab
" 新しい行を開始したとき、新しい行のインデントを現在行と同じにする
set autoindent
"縦線を表示
set nocursorcolumn
"カラースキ-ム
colorscheme molokai
set t_Co=256
" ビジュアルモードで選択したテキストが、クリップボードに入るようにする
" " http://nanasi.jp/articles/howto/editing/clipboard.html
set clipboard=autoselect
"
"  " 無名レジスタに入るデータを、*レジスタにも入れる。
set clipboard+=unnamed
set clipboard=unnamedplus
" バックスペースを聞かせる
set backspace=indent,eol,start
" ファイル末尾の改行コードを削除する
"set binary noeol
"キーマッピング
nnoremap <silent><C-e> :NERDTreeToggle<CR>
noremap <silent> qq <ESC>
" 日本語入力で”っj”と入力してもEnterキーで確定させればインサートモードを抜ける
inoremap <silent> qq <ESC>
"----------------------------------------
"" neocomplcache
"----------------------------------------
let g:acp_enableAtStartup = 0
"" 起動時に有効
let g:neocomplcache_enable_at_startup = 1
" 自動補完を行う入力数を設定。初期値は2
let g:neocomplcache_auto_completion_start_length = 2
" " 手動補完時に補完を行う入力数を制御。値を小さくすると文字の削除時に重くなる
let g:neocomplcache_manual_completion_start_length = 3
" " 補完候補検索時に大文字・小文字を無視する
let g:neocomplcache_enable_ignore_case = 1
" " 大文字小文字を区切りとしたあいまい検索を行うかどうか。
let g:neocomplcache_enable_camel_case_completion = 1
" " 入力に大文字が入力されている場合、大文字小文字の区別をする
let g:neocomplcache_enable_smart_case = 1
" " アンダーバーを区切りとしたあいまい検索を行うかどうか。
let g:neocomplcache_enable_underbar_completion = 1
" "
"シンタックスファイル中で、補完の対象となるキーワードの最小長さ。初期値は4。
"let g:neocomplcache_min_syntax_length = 3
 "
" バッファや辞書ファイル中で、補完の対象となるキーワードの最小長さ。初期値は4。
let g:neocomplcache_min_keyword_length = 2
let g:neocomplcache_enable_quick_match = 1
 " ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplcache_max_list = 10
let g:neocomplcache_dictionary_filetype_lists = {
   \ 'default' : ''
      \ }
       if !exists('g:neocomplcache_keyword_patterns')
         let g:neocomplcache_keyword_patterns = {}
       endif
       let g:neocomplcache_keyword_patterns._ = '\h\w*'
       if !exists('g:neocomplcache_omni_patterns')
         let g:neocomplcache_omni_patterns = {}
       endif
       let g:neocomplcache_omni_patterns.ruby = '[^.*\t]\.\h\w*\|\h\w*::'
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><C-y>   neocomplcache#close_popup()
let g:neocomplcache_force_overwrite_completefunc=1

" Rsense用の設定
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

"rsenseのインストールフォルダがデフォルトと異なるので設定
let g:rsenseHome = expand("/Users/kazuki.sato/.rbenv/shims/rsense")
let g:rsenseUseOmniFunc = 1


" コピペ時にコメントまでコピペしない設定
if &term =~ "xterm"
  let &t_ti .= "\e[?2004h"
  let &t_te .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
  set paste
  return a:ret
  endfunction

  noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
  cnoremap <special> <Esc>[200~ <nop>
  cnoremap <special> <Esc>[201~ <nop>
endif

set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'

""----------------ここに追加したいプラグイン---
    "NeoBundle 'Shougo/neocomplete.vim' "luaがないと使えない
     NeoBundle 'Shougo/neocomplcache'
     NeoBundle 'Shougo/neocomplcache-rsense.vim'
     NeoBundle 'scrooloose/nerdtree'
     NeoBundle 'tpope/vim-rails', { 'autoload' : {
      \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}
     NeoBundle 'vim-ruby/vim-ruby'
"
""---------------------------------------
call neobundle#end()
endif
"
filetype plugin indent on
NeoBundleCheck
