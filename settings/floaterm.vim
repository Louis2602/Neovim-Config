"let g:floaterm_keymap_new    = '<F8>'
"let g:floaterm_keymap_prev   = '<F9>'
"let g:floaterm_keymap_next   = '<F10>'
"let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_position = 'topright'
let g:floaterm_width = 0.6
let g:floaterm_height = 0.6
let g:floaterm_title = 'Floaterm $1/$2'
let g:floaterm_wintype = 'float'
let g:floaterm_rootmarkers = ['.pro']
let g:floaterm_autoclose = 1
let g:floaterm_shell = 'D:/Git/bin/bash'

" Set color
" hi Floaterm guibg=NONE
hi FloatermBorder guifg=cyan guibg=NONE
" hi FloatermNC guibg=Gray15

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Hotkey to manage terminals
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open a new terminal 
nnoremap   <silent>   <F9>     		:FloatermNew<CR>
tnoremap   <silent>   <F9>     		<C-\><C-n>:FloatermNew<CR>

" Kill current terminal 
nnoremap <silent> 	<C-F9>   		:FloatermKill<CR>:FloatermPrev<CR>
tnoremap <silent> 	<C-F9> 			<C-\><C-n>:FloatermKill<CR>:FloatermPrev<CR>

" Navigation next and previous terminal 
nnoremap <silent> 	<F10> 			:FloatermNext<CR>
tnoremap <silent> 	<F10> 	 		<C-\><C-n>:FloatermNext<CR>
nnoremap <silent> 	<C-F10> 		:FloatermPrev<CR>
tnoremap <silent> 	<C-F10> 		<C-\><C-n>:FloatermPrev<CR>

" Toggle terminal
nnoremap <silent> 	<F11> 	 		:FloatermToggle<CR>
tnoremap <silent> 	<F11> 		<C-\><C-n>:FloatermToggle<CR>

" Focus terminal 
nnoremap <silent> 	<C-F11> 		<C-\><C-n><C-W><Left>
tnoremap <silent> 	<C-F11> 		<C-\><C-n><C-W><Left>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Hotkey to run other console apps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git 
nnoremap   <F8>    :FloatermNew --position=bottomleft --height=0.8 --width=0.6 --title='Git'<CR>
