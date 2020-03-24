" Import the class under the cursor with <leader>i (:h mapleader):
nnoremap <silent> <buffer> <leader>i :JavaImportOrganize<cr>
" Perform a context sensitive search of the element under the cursor with <enter>.
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
" autocorrect
nnoremap <silent> <buffer> <leader><cr> :JavaCorrect<cr>
" auto format whole file
nnoremap <silent> <buffer> <leader>f :%JavaFormat<cr>
