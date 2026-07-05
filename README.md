# testrunner.vim

A Vim/Neovim plugin that allows you to run unit tests from inside the editor. It supports multiple testing frameworks like `PyTest`, `RSpec`, and `Minitest`. 

## Installation

You can install this plugin using your favorite plugin manager. 

### `vim-plug`

With `vim-plug`, add the following line to your `.vimrc` or `init.vim`:
```vim
Plug 'geraldspreer/testrunner.vim'
```
Then, run `:PlugInstall` in Vim/Neovim.

### `Lazy.nvim`

With `Lazy.nvim`, add the following line to your plugin list:
```lua
{ 'geraldspreer/testrunner.vim' }
```
Then, run `:Lazy sync` in Neovim.

## Configuration

- Set the size of the test window `:let g:testWindowWidth = {width}`  
- Add additional command line parameters `:let g:testParams = {params}`  

See the **Lazy.nvim** example below for how to include these settings in your configuration.

### Key mappings

The plugin provides two commands: `:RunTests` to run all tests and `:RunFocusedTest` to run the test under the cursor. You can map these to your preferred keys. For example, to map `<leader>t` for running all tests and `<leader>T` for running focused tests:

**Vim/init.vim:**
```vim
nnoremap <leader>t :RunTests<CR>
nnoremap <leader>T :RunFocusedTest<CR>
```

**Neovim/init.lua:**
```lua
vim.keymap.set('n', '<leader>t', ':RunTests<CR>', { noremap = true })
vim.keymap.set('n', '<leader>T', ':RunFocusedTest<CR>', { noremap = true })
```

**With Lazy.nvim:**
```lua
  { 
  'geraldspreer/testrunner.vim', 
  keys = {
    { '<leader>t', ':RunTests<CR>', noremap = true, desc = 'Run all tests' },
    { '<leader>T', ':RunFocusedTest<CR>', noremap = true, desc = 'Run focused test' },
  },
  init = function()
      vim.g.testWindowWidth = 200
      vim.g.testParams = "-s -vvv -x"
    end,
  },
```

## Contributing

If you would like to contribute to this project, please fork the repository and make changes as you'd like. Pull requests are welcome.



