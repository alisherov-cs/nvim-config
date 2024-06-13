local builtin = require('telescope.builtin')

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }	
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

require('telescope').setup {
  pickers = {
    find_files = {
      file_ignore_patterns = {"node_modules/*", "dist/*", ".next/*"}
    },
    live_grep = {
      file_ignore_patterns = {"node_modules/*", "dist/*", ".next/*"}
    },
  }
}

map('n', '<leader>ff', builtin.find_files, {})
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>fh', builtin.help_tags, {})
