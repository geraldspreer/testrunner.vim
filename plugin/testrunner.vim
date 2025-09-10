if exists('g:loaded_testrunner')
  finish
endif

let g:loaded_testrunner = 1

function! RunTests()
  echo "Running tests..."
endfunction

command! RunTests call RunTests()

nnoremap <leader>t :RunTests<CR>
