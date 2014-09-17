set go=
set number
set nobackup
set noswapfile
set nobomb
set cursorline

set viminfo=

"----------------------------------------
" Windowsで内部エンコーディングを cp932以外にしていて、
" 環境変数に日本語を含む値を設定したい場合に使用する
" Let $HOGE=$USERPROFILE.'/ほげ'
"----------------------------------------
command! -nargs=+ Let call Let__EnvVar__(<q-args>)
function! Let__EnvVar__(cmd)
  let cmd = 'let ' . a:cmd
  if has('win32') + has('win64') && has('iconv') && &enc != 'cp932'
    let cmd = iconv(cmd, &enc, 'cp932')
  endif
  exec cmd
endfunction


" ローカル環境設定読み込み
let $localvimrc='C:\dotvim\_vimrc_local.vim'
if filereadable($localvimrc)
	execute 'source '.$localvimrc
endif

" textwidthの再設定
au Filetype * setlocal textwidth=0

""""""""""""""""""""""""""""""
"全角スペースを表示
""""""""""""""""""""""""""""""
"コメント以外で全角スペースを指定しているので scriptencodingと、
"このファイルのエンコードが一致するよう注意！
"全角スペースが強調表示されない場合、ここでscriptencodingを指定すると良い。
scriptencoding utf-8
"デフォルトのZenkakuSpaceを定義
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey guibg=darkgrey
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
	" ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
	autocmd ColorScheme       * call ZenkakuSpace()
	" 全角スペースのハイライト指定
	autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

" タブの画面上での幅(ハードタブ)
set tabstop=4

" Tab押したときの量(ソフトタブ)
set softtabstop=0

" タブが自動挿入される量
set shiftwidth=4

"set listchars=tab:>-,trail:-
scriptencoding utf-8
set listchars=tab:»\ ,trail:-

command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>') 
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

" Change current directory.
nnoremap <silent> <Space>cd :<C-u>CD<CR>

" smooth scroll
:map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
:map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

" grep用 F4で次の候補 S-F4で前の候補
nnoremap <silent> <F4> :cn<CR>
nnoremap <silent> <S-F4> :cp<CR>

" F7でファイル名挿入
nnoremap <silent> <F7> :let @"=expand("%")<CR>

" 検索したら真ん中にｶｰｿﾙを合わせる
nmap n nzz
nmap N Nzz

"
nmap * *N

" 全ｸﾘｱ
nnoremap <silent> <Space>cl ggvG$d

" pathogen呼び出し
call pathogen#incubate()

"set runtimepath+=c:/tmp/qfixapp
"let QFixHowm_Key = 'g'
"
"let howm_dir             = 'c:/howm'
"let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
"let howm_fileencoding    = 'cp932'
"let howm_fileformat      = 'dos'
"
"" QFixHowm関連
"" キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
"set timeout timeoutlen=3000 ttimeoutlen=100
"" プレビューや絞り込みをQuickFix/ロケーションリストの両方で有効化(デフォルト:2)
"let QFixWin_EnableMode = 1
"
""オートリンクでファイルを開く
"let QFixHowm_Wiki = 1
"
""オートリンクでファイルの保存場所
"let QFixHowm_WikiDir = 'wiki'
"
"" Alignを日本語環境で使用するための設定
"let g:Align_xstrlen = 3

" memolist
nnoremap <Leader>mn  :MemoNew<CR>
nnoremap <Leader>ml  :MemoList<CR>
nnoremap <Leader>mg  :MemoGrep<CR>

let g:memolist_path = $dropbox."\\vim_memo"

