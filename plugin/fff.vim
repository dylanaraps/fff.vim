" fff.vim

if exists('g:loaded_fff')
	finish
endif
let g:loaded_fff = 1

command! -nargs=* -complete=dir F call fff#Run(<q-args>)
