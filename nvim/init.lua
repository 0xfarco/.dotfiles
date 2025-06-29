-- ~/.config/nvim/init.lua

-- Load options, keymaps, plugins, etc.
require("core.options")
require("core.keymaps")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Import color theme based on environment variable NVIM_THEME
local default_color_scheme = 'nord'
local env_var_nvim_theme = os.getenv 'NVIM_THEME' or default_color_scheme

-- Define a table of theme modules
local themes = {
  nord = 'plugins.themes.nord',
  onedark = 'plugins.themes.onedark',
}

require("lazy").setup({
  require(themes[env_var_nvim_theme]),
  require 'plugins.telescope',
  require 'plugins.treesitter',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  -- require 'plugins.none-ls',
  require 'plugins.lualine',
  -- require 'plugins.bufferline',
  require 'plugins.neo-tree',
  -- require 'plugins.alpha',
  require 'plugins.indent-blankline',
  -- require 'plugins.lazygit',
  require 'plugins.comment',
  -- require 'plugins.debug',
  require 'plugins.gitsigns',
  -- require 'plugins.database',
  require 'plugins.misc',
  require 'plugins.harpoon',
  -- require 'plugins.avante',
  -- require 'plugins.chatgpt',
  require 'plugins.aerial',
  require 'plugins.vim-tmux-navigator',
  -- require 'plugins.oil',
  require 'plugins.which-key',
  require 'plugins.toggleterm',
  { "tpope/vim-fugitive" },
  -- { "neovim/nvim-lspconfig" },
  -- { "williamboman/mason.nvim" },
  -- { "williamboman/mason-lspconfig.nvim" },
  -- { "hrsh7th/nvim-cmp" },
  -- { "hrsh7th/cmp-nvim-lsp" },
  -- { "L3MON4D3/LuaSnip" },
  -- { "saadparwaiz1/cmp_luasnip" },
  -- { "ntpeters/vim-better-whitespace" },
}, {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
