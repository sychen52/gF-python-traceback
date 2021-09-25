function! ftplugin#python#CustomgF()
    " are we in a terminal window?
    if get(get(getwininfo(win_getid()), 0, {}), 'terminal', 0)
    "if win_getid()->getwininfo()->get(0, {})->get('terminal', 0)

        " if we are, find a suitable line number on this line
        let line = matchstr(getline('.'), ', line \zs\d\+')
        " if we have one, do regular gF, which won't jump
        " to the desired line anyway because Vim can't parse
        " tracebacks properly
        normal! gF
        if line
            " but we don't care because we can jump
            " to the found line on our own
            execute line
        endif
    else
        " if we aren't, do regular gF
        normal! gF
    endif
endfunction
