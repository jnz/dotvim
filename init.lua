-- vim.cmd('source ~/.vim/vimrc')
local vimrc = vim.fn.expand("~/.vim/vimrc")
pcall(function()
  if vim.fn.filereadable(vimrc) == 1 then
    vim.cmd('source ' .. vim.fn.fnameescape(vimrc))
  end
end)

-- Plugins
vim.cmd('packadd nvim-treesitter')
vim.cmd('packadd nvim-lspconfig')
vim.cmd('packadd nvim-cmp')
vim.cmd('packadd cmp-nvim-lsp')

-- Tree-sitter Setup
require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "lua", "python" },
  indent = { enable = true },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- Autocomplete Setup
local cmp = require('cmp')
cmp.setup {
  sources = { { name = 'nvim_lsp' } },
  mapping = {
    ['<Tab>']   = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>']    = cmp.mapping.confirm({ select = true }),
  },
}

-- LSP Client Setup (Neovim 0.11+ API)
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.offsetEncoding = { "utf-16" }

vim.lsp.config['clangd'] = {
  cmd = { 'clangd' },
  capabilities = capabilities,
}

-- optional: only start, if clangd available
if vim.fn.executable('clangd') == 1 then
  vim.lsp.start(vim.lsp.config['clangd'])
else
  vim.notify("clangd not found in PATH", vim.log.levels.WARN)
end

vim.diagnostic.config({
  virtual_text = true,
  signs = false,
})

