local utils = require'user.utils'

-- toggleterm.nvim
-- https://github.com/akinsho/toggleterm.nvim
vim.cmd 'packadd toggleterm.nvim'
require'toggleterm'.setup {
	size = function(term)
    if term.direction == "horizontal" then
      return 20
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = false,
	direction = "vertical",
	close_on_exit = true,
	shell = vim.o.shell,
  on_open = function()
    vim.cmd("startinsert!")
  end,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
}

utils.augroup { name = 'UserToggleTermKeymaps', cmds = {
  { 'FileType', {
    pattern = 'toggleterm',
    desc = 'Load floating terminal keymaps.',
    callback = function ()
      utils.keymaps { modes = '', opts = { buffer = true, silent = true }, maps = {
        { '<ESC>', '<Cmd>ToggleTerm<CR>' },
      }}
      local opts = {noremap = true}
      vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', 'kj', [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
    end
  }},
}}
