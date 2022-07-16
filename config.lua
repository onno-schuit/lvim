--[[
lvim is the global options object


Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

lvim.builtin.nvimtree.setup.actions.open_file.resize_window = true

-- general
lvim.log.level = "warn"
lvim.format_on_save = false

-- lvim.colorscheme = "onedarker"
-- lvim.colorscheme = "melange" -- warm alternative to iceberg
lvim.colorscheme = "dawnfox" -- the best so far
-- lvim.colorscheme = "iceberg" -- cool colors, pretty, but frosty

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

vim.o.listchars = "tab:▸ ,eol:¬"

vim.o.background = "light"
-- vim.g.material_style = "lighter"
--vim.g.codeschool_contrast_dark = "medium"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = ","
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

vim.api.nvim_set_keymap(
  'n',
  '<C-n>',
  "<cmd>lua vim.diagnostic.goto_next()<CR>",
  { noremap = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<C-p>',
  "<cmd>lua vim.diagnostic.goto_prev()<CR>",
  { noremap = true }
)

-- Control-PageUp for previous buffer
vim.keymap.set('n', '<C-PageUp>', ':bp<CR>', { noremap = true, silent = true })
-- Control-PageDown for next buffer
vim.keymap.set('n', '<C-PageDown>', ':bn<CR>', { noremap = true, silent = true })
-- Shortcut to rapidly toggle `set list` (which shows tabs)
vim.keymap.set('n', '<A-l>', ':set list!<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<CS-l>', ':set list!<CR>', { noremap = true, silent = true }) -- Does not work for some unfathomable reason

vim.keymap.set('n', '<CS-Up>', ':wincmd k<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<CS-Down>', ':wincmd j<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<CS-Left>', ':wincmd h<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<CS-Right>', ':wincmd l<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>G', ':Grepper<CR>', { noremap = true, silent = true })

-- vim.opt.foldmethod = "indent"
vim.opt.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- Do not open files / buffers with all folds closed
vim.api.nvim_command("set nofoldenable")

-- lvim.keys.normal_mode["<leader-bd>"] = ":Bclose<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["G"] = { ":Grepper<CR>", "Grepper" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- Configuration for ahmedkhalf/project.nvim -- But maybe this is included by default?
-- lvim.builtin.nvimtree.setup.respect_buf_cwd = true
-- lvim.builtin.nvimtree.setup.update_cwd = {
--     enable = true,
--     update_cwd = true
-- }

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "php",
  "phpdoc",
  "ruby",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true


-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "intelephense" }) -- I skipped this initially because we're also configuring intelephense through php.lua. There seems to be a bug related to the lsp configuration though, but it only occurs when you the config is reloaded.
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  { "folke/tokyonight.nvim" },
  { "savq/melange" },
  { "cocopon/iceberg.vim" },
  { "EdenEast/nightfox.nvim" },
  { "lunarvim/colorschemes" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  -- { "anuvyklack/nvim-keymap-amend" }, -- Buggy, do not use! (Required by pretty-fold for previews)
  { "anuvyklack/pretty-fold.nvim" },
  { "mhinz/vim-grepper" },
  { "chentoast/marks.nvim" },

  -- I can't get telescope-project to work - at all. It won't start using the default commands. And it is apparently not possible to remap the key bindings. See https://github.com/nvim-telescope/telescope-project.nvim/issues/84
  -- { "nvim-telescope/telescope-project.nvim",
  --   event = "BufWinEnter",
  --   setup = function()
  --     vim.cmd [[packadd telescope.nvim]]
  --   end,
  -- },
}

-- Can't get telescope project to work.
-- lvim.builtin.telescope.on_config_done = function(telescope)
--   pcall(telescope.load_extension, "project")
--   -- any other extensions loading
-- end

require 'marks'.setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions.
  -- higher values will have better performance but may cause visual lag,
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = "hello world"
  },
  mappings = {}
}

require("pretty-fold").setup()
-- require("pretty-fold.preview").setup() -- Buggy, do no use! (Onno)

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip/loaders/from_vscode").load { paths = { "~/.config/lvim/vendor-snippets/vscode-es7-javascript-react-snippets" } }

lvim.builtin.telescope.defaults.file_ignore_patterns = {
  "vendor/*",
  "%.lock",
  "__pycache__/*",
  "%.sqlite3",
  "%.ipynb",
  "node_modules/*",
  "%.jpg",
  "%.jpeg",
  "%.png",
  "%.svg",
  "%.otf",
  "%.ttf",
  ".git/",
  "%.webp",
  ".dart_tool/",
  ".github/",
  ".gradle/",
  ".idea/",
  ".settings/",
  ".vscode/",
  "__pycache__/",
  "build/",
  "env/",
  "gradle/",
  "moodledata/",
  "node_modules/",
  "target/",
  "%.pdb",
  "%.dll",
  "%.class",
  "%.exe",
  "%.cache",
  "%.ico",
  "%.pdf",
  "%.dylib",
  "%.jar",
  "%.docx",
  "%.met",
  "smalljre_*/*",
  ".vale/",
}
