# NVIMColorPicker
Nvim plugin for picking colors from colorschemes

## Demo:
<img src="https://github.com/tribhuwan-kumar/NVIMColorPicker/assets/118052427/cd087696-1544-4e38-b353-6e29368f8702" width="400" height="auto" align="left" /> 


## Keyfeatures:
- Fully mouse independent (NO NEED OF MOUSE)
- Pick color from colorscheme
- Insert color in hex format
- Insert after and before the cursor

## Installation:
Use your favorite plugin manager to install this plugin.
```vim
" vim-plug
Plug 'tribhuwan-kumar/NVIMColorPicker'
```

## Config:
```vim
let g:NVIMColorPicker#InsertBefore#TheCursor = 1 " for inserting hex code before the cursor, I recommend to use this
```
`set variables 0 for disabling the feature, default behavior is insert after the cursor`

## Usage:
- `:ColorPicker` - Open color picker popup
- `h,j,k,l` - Move in the color scheme
- `o` & `O` - For decreasing and increasing the color brightness
- `Enter` - Accept the selected color
- `Esc` - Close the color picker popup


#### Under MIT License.
