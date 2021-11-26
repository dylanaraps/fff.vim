" fff.vim

let g:fff#split = get(g:, 'fff#split', '10new')
let g:fff#split_direction = get(g:, 'fff#split_direction',
                                  \ 'splitbelow splitright')

function! fff#open_file(...)
    let tmp_file = $XDG_CACHE_HOME

    if !isdirectory(tmp_file)
        let tmp_file = $HOME . "/.cache"
    endif

    let tmp_file .= "/fff/opened_file"
    let tmp_file = fnameescape(tmp_file)
    bd!
    execute s:winnr . 'wincmd w'

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

function! fff#Run(command)
    let split_direction = (&splitbelow ? '' : 'no') . 'splitbelow '
                \ . (&splitright ? '' : 'no') . 'splitright'
    if (split_direction != g:fff#split_direction)
        execute 'set ' . g:fff#split_direction
    endif
    execute g:fff#split
    execute 'setlocal nonumber'
    execute 'setlocal norelativenumber'

    let s:winnr = winnr()
    if has('nvim')
        call termopen('fff -p ' . a:command,
                    \ {'on_exit': function('fff#open_file') })
        startinsert
    else
        let buffer = term_start([&shell, &shellcmdflag, 'fff -p ' . a:command],
                    \ {'curwin': 1, 'exit_cb': function('fff#open_file')})

        if !has('patch-8.0.1261')
            call term_wait(buffer, 20)
        endif
    endif
    if (split_direction != g:fff#split_direction)
        execute 'set ' . split_direction
    endif
endfunction
