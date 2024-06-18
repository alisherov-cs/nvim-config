vim.g.closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx'
vim.g.closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
vim.g.closetag_filetypes = 'html,xhtml,phtml,jsx,tsx,javascriptreact,typescriptreact'
vim.g.closetag_xhtml_filetypes = 'xhtml,jsx,tsx'

local function enable()
    vim.cmd("CloseTagEnableBuffer")
end

vim.api.nvim_create_autocmd("VimEnter", {
    callback = enable
})
