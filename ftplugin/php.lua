-- Set formatting style for braces to 'k&r' (Kernighan & Ritchie),
-- i.e. braces start at same line (vs. new line).
-- For some options, see https://github.com/yaegassy/coc-intelephense
local opts = {
  settings = {
    intelephense = {
      format = {
        braces = 'k&r'
      }
    }
  }
}
require("lvim.lsp.manager").setup("intelephense", opts)
-- Tab is 4 spaces
vim.cmd("setlocal tabstop=4 shiftwidth=4")


lvim.builtin.treesitter.highlight.additional_vim_regex_highlighting = { "php" }
--require('luasnip').filetype_extend("php")
