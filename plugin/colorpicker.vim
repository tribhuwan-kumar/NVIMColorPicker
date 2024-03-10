function! s:open_color_picker()
  let lnum = line('.')
  let col = col('.')
  " let color = system('python3 ~/dotarch/.config/nvim/ColorPicker/color_picker.py')
  let color = system('python3 ~/.local/share/nvim/plugged/NVIMColorPicker/window/color_picker.py')
  let color = substitute(color, '\n\+$', '', '')
  let color = substitute(color, '^\n\+', '', '')
  let current_line = getline(lnum)

  " for before the cursor
  " let new_content = strpart(current_line, 0, col - 1) . color . strpart(current_line, col - 1)

  " for after the cursor
  let new_content = substitute(current_line, '\%' . (col + 1) . 'c', "\\0" . color, '')

  call setline(lnum, new_content)
endfunction

command! ColorPicker call s:open_color_picker()


