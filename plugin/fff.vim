"=============================================================
" file: fff.vim
" author:  dylan araps <dylan.araps at gmail.com>
" license: mit license
"=============================================================

if exists('g:loaded_fff')
	finish
endif
let g:loaded_fff = 1

" This command works with all of gulp/grunt's cmdline flags
command! -nargs=* -complete=file F call fff#Run(<q-args>)
