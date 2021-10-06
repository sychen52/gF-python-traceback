function! pythongF#gF()
    " are we in a terminal window?
    if get(get(getwininfo(win_getid()), 0, {}), 'terminal', 0)
    "if win_getid()->getwininfo()->get(0, {})->get('terminal', 0)

        " if we are, find a suitable line number on this line
        let list = matchlist(getline('.'), '"\(.\+\)", line \(\d\+\)')
        " if we have one, do regular gF, which won't jump
        " to the desired line anyway because Vim can't parse
        " tracebacks properly
        if (len(list) > 2) && len(list[1]) > 0 && len(list[2]) > 0
            " but we don't care because we can jump
            " to the found line on our own
            execute "edit" list[1]
            execute list[2]
        else
            normal! gF
        endif
    else
        " if we aren't, do regular gF
        normal! gF
    endif
endfunction
