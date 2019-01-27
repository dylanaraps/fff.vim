" fff.vim

let g:fff#split = get(g:, 'fff#split', '10new')
let g:fff#split_direction = get(g:, 'fff#split_direction', 'splitbelow splitright')

function! fff#Run(command)
    execute 'setlocal' . ' ' . g:fff#split_direction
    execute g:fff#split

    function! s:open_file(...)
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

    if has('nvim')
        call termopen('fff ' . getcwd(), {'on_exit': function('s:open_file') })
        startinsert
    else
        let buffer = term_start([&shell, &shellcmdflag, 'fff ' . getcwd()],
                    \ {'curwin': 1, 'exit_cb': function('s:open_file')})

        if !has('patch-8.0.1261')
            call term_wait(buffer, 20)
        endif
    endif
endfunction
