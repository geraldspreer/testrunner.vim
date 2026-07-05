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

### Set the size of the test window

`:let g:testWindowWidth = {width}`

### Add additional command line parameters

`:let g:testParams = {params}` this is currently only used for `pytest`.

You can also set these configurations in your configuration:  

```lua
  { 
  'geraldspreer/testrunner.vim', 
  init = function()
      vim.g.testWindowWidth = 200
      vim.g.testParams = "-s -vvv -x"
    end,
  },
```

## Contributing

If you would like to contribute to this project, please fork the repository and make changes as you'd like. Pull requests are welcome.



