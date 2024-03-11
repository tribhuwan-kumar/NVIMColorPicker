function! s:open_color_picker()
  let lnum = line('.')
  let col = col('.')

  let insert_after = get(g:, 'NVIMColorPicker#InsertAfter#TheCursor', 0)
  let insert_before = get(g:, 'NVIMColorPicker#InsertBefore#TheCursor', 0)

  let color_picker_path = system('find ~/.local/share/nvim -type f -name color_picker.py')
  let color_picker_path = substitute(color_picker_path, '\n\+$', '', '')
  let color_picker_path = substitute(color_picker_path, '^\\n\+', '', '')

  let color = system('python3 ' . shellescape(color_picker_path))
  let color = substitute(color, '\n\+$', '', '')
  let color = substitute(color, '^\\n\+', '', '')

  let current_line = getline(lnum)

  if insert_after
    " insert after the cursor
  let hex_color = substitute(current_line, '\%' . (col + 1) . 'c', "\\0" . color, '')
  elseif insert_before
    " insert before the cursor
    let hex_color = strpart(current_line, 0, col - 1) . color . strpart(current_line, col - 1) 
  else
    " default behavior (insert after the cursor)
    let hex_color = substitute(current_line, '\%' . (col + 1) . 'c', "\\0" . color, '')
  endif

  call setline(lnum, hex_color)
endfunction

command! ColorPicker call s:open_color_picker()
