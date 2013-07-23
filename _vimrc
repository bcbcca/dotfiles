set go=
set number
set nobackup
set noswapfile
set nobomb
set cursorline

set viminfo=

"nmap bb :ls<CR>:buf

"" ��ESC����Ɖ��̍s�Ɉڂ��Ă��܂��E�E�E
"ESC��IME���m����OFF
"inoremap <ESC> <ESC>:set iminsert=0<CR> 

"�f�t�H���g��ZenkakuSpace���`
function! ZenkakuSpace()
  "highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey guibg=darkgrey
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
	" ZenkakuSpace���J���[�t�@�C���Őݒ肷��Ȃ玟�̍s�͍폜
	autocmd ColorScheme       * call ZenkakuSpace()
	" �S�p�X�y�[�X�̃n�C���C�g�w��
	autocmd VimEnter,WinEnter * match ZenkakuSpace /�@/
  augroup END
  call ZenkakuSpace()
endif

" �^�u�̉�ʏ�ł̕�(�n�[�h�^�u)
set tabstop=4

" Tab�������Ƃ��̗�(�\�t�g�^�u)
set softtabstop=0

" �^�u�������}��������
set shiftwidth=4

set listchars=tab:>-,trail:-

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

"nnoremap <silent> <Space>cp :ggvG$"*y<CR>

" smooth scroll
:map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
:map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

" grep�p F4�Ŏ��̌�� S-F4�őO�̌��
nnoremap <silent> <F4> :cn<CR>
nnoremap <silent> <S-F4> :cp<CR>

nnoremap <silent> <F7> :let @"=expand("%")<CR>

" ����L�^�p
function! s:nippo()
	let a:dir = 'C:\Users\YuMiyata\Documents\��Ƙ^\'
	let a:date = strftime('%Y_%m_%d.txt')
	execute 'e '.a:dir.a:date
	execute 'lcd %:p:h'
	return
endfunction

if !exists(":NIPPO")
	command NIPPO :call s:nippo()
endif

" ����������^�񒆂ɶ��ق����킹��
nmap n nzz
nmap N Nzz

" �S�ر
nnoremap <silent> <Space>cl ggvG$d

