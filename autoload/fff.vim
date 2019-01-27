"=============================================================
" file: fff.vim
" author:  dylan araps <dylan.araps at gmail.com>
" license: mit license
"=============================================================

" RunTask {{{

function! fff#Run(command)
    if has('nvim')
        function! s:On_exit(id, data, event) dict
            let tmp_file = $XDG_CACHE_HOME

            if !isdirectory(tmp_file)
                let tmp_file = $HOME
                let tmp_file .= "/.cache"
            endif

            let tmp_file .= "/fff/vim_opener"
            let tmp_file = fnameescape(tmp_file)

            bd!

            if filereadable(tmp_file)
                let file_data = readfile(tmp_file)
                execute delete(tmp_file)
            else
                return
            endif

            if filereadable(file_data[0])
                execute "e " . file_data[0]
            endif
        endfunction

        call termopen('fff ' . getcwd(), {'on_exit': function('s:On_exit') })
        startinsert
    endif
endfunction

" }}}
