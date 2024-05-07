function! s:open_color_picker() abort
    let insert_before = get(g:, 'NVIMColorPicker#InsertBefore#TheCursor', 0)
    let color_picker_path = system("find ~/.local/share/nvim -type f -name color_picker.py | head -n 1") 

    if ! executable('python3') 
        echoerr 'Python3 is not installed'
        return
    endif

    let color_picker_path = substitute(color_picker_path, '\n\|\r$', '', '')
    let color = system('python3 ' . shellescape(color_picker_path))
    let color = substitute(color, '\n\+$', '', '')
    let color = substitute(color, '^\\n\+', '', '')

    if insert_before
        " insert before the cursor
        return 'i'..color
    else
        " default behavior (insert after the cursor)
        return 'a'..color
    endif
endfunction

command! -range ColorPicker if <range> | execute 'normal! gv"_d' | endif | execute 'normal! '..s:open_color_picker()
