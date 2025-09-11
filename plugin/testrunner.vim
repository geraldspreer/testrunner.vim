if exists('g:loaded_testrunner')
  finish
endif

let g:loaded_testrunner = 1

function! RunTests() abort
  let l:file = expand('%')
  let l:ext  = expand('%:e')

  let l:tests = [
        \ ['_spec\.rb$',   'bundle exec rspec %'],
        \ ['_test\.rb$',   'bin/rails test %'],
        \ ['test_.*\.py$', 'pytest -s -vv -x ' . (exists("g:testParams") ? g:testParams : "") . " %"],
        \ ['\.py$',        'pytest -s -vvv -x tests/%:h/test_%:t'],
        \ ]

  for [l:pat, l:cmd] in l:tests
    if l:file =~ l:pat
      return s:RunInTerminal(l:cmd)
    endif
  endfor

  let l:specfile = substitute(expand('%:r:h') . '_spec.' . l:ext, "app", "spec", "")
  echom "Running ... " . l:specfile
  return s:RunInTerminal('rspec ' . l:specfile)
endfunction

function! s:RunInTerminal(cmd) abort
  vsp
  execute 'ter! clear && ' . expandcmd(a:cmd)
  startinsert
endfunction

function! RunFocusedTest() abort
  let l:file = expand('%')

  " Ruby RSpec (focused on current line)
  if l:file =~# '_spec\.rb$'
    let l:specpath = l:file . ':' . line('.')
    echom "Running ... " . l:specpath
    return s:RunInTerminal('bin/rspec ' . l:specpath)
  endif

  " Python unittest (focused on current function)
  if l:file =~# '^test_.*\.py$'
    " Get class name from file name (test_foo_bar.py → TestFooBar)
    let l:file_name = expand('%:t:r')
    let l:parts = split(l:file_name, '_')
    let l:class_name = join(map(l:parts, 'substitute(v:val, "^.", "\\u&", "")'), '')

    " Extract function name from current line
    let l:line_text = getline('.')
    let l:match = matchlist(l:line_text, '\vdef (\w+)\(')
    if empty(l:match)
      echom "No test function found on this line"
      return
    endif
    let l:function_name = l:match[1]

    let l:target = l:file . '::' . l:class_name . '::' . l:function_name
    echom "Running ... " . l:target
    return s:RunInTerminal('pytest -s ' . l:target)
  endif

  echom "Focused tests not supported for this filetype"
endfunction

command! RunTests call RunTests()
command! RunFocusedTest call RunFocusedTest()

nnoremap <leader>t :RunTests<CR>
nnoremap <leader>T :RunFocusedTest<CR>
