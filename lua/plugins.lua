local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

local packer_bootstrap = false
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  execute 'packadd packer.nvim'
end
require 'packer.luarocks'.install_commands()

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- explorer
  use 'kyazdani42/nvim-tree.lua'
  use 'kevinhwang91/rnvimr'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
  use 'nvim-treesitter/nvim-treesitter'
  use { 'tjdevries/colorbuddy.vim' }
  use 'nvim-treesitter/nvim-treesitter-context'

  -- telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  --navigation
  use 'unblevable/quick-scope'
  use { 'akinsho/bufferline.nvim', tag = "v2.*" }
  use 'ggandor/lightspeed.nvim'

  --theme
  use 'kyazdani42/nvim-web-devicons'
  use 'eddyekofo94/gruvbox-flat.nvim'

  -- utilities editing
  use 'windwp/nvim-autopairs'
  use 'norcalli/nvim-colorizer.lua'
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
  use 'famiu/bufdelete.nvim'

  -- git
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use 'kdheepak/lazygit.nvim'
  use 'lewis6991/gitsigns.nvim'

  -- extension
  use 'github/copilot.vim'

  -- key
  use 'folke/which-key.nvim'

  -- debug
  use {
    'mfussenegger/nvim-dap',
    requires = {
      "Pocco81/DAPInstall.nvim",
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "nvim-telescope/telescope-dap.nvim",
      { "leoluz/nvim-dap-go", module = "dap-go" },
      { "jbyuki/one-small-step-for-vimkind", module = "osv" },
    }
  }


  -- rocks
  use_rocks 'luafilesystem'
  use_rocks 'xml2lua'

  -- for auto install dependencies
  if packer_bootstrap then
    require('packer').sync()
  end
end)
