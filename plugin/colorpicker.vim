function! s:open_color_picker() abort
    let insert_before = get(g:, 'NVIMColorPicker#InsertBefore#TheCursor', 0)
    let color_picker_path = findfile('color_picker.py', expand('~')..'/.local/share/nvim/**')

    if ! executable('python3') 
        echoerr 'Python3 is not installed'
        return
    endif

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
