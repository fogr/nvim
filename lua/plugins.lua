local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- explorer
  use 'kyazdani42/nvim-tree.lua'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
  use 'nvim-treesitter/nvim-treesitter'
  use { 'tjdevries/colorbuddy.vim' }

  -- telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'

  --navigation
  use 'unblevable/quick-scope'
  use 'phaazon/hop.nvim'
  use { 'akinsho/bufferline.nvim', tag = "v2.*" }

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
end)
