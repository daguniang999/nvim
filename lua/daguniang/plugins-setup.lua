local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	-- 插件下载管理
	use("wbthomason/packer.nvim")
	-- 提供lua方法
	use("nvim-lua/plenary.nvim")
	-- 主题
	use("bluz71/vim-nightfly-guicolors")
	-- 分屏切换
	use("christoomey/vim-tmux-navigator")
	-- 配置窗口最大化
	use("szw/vim-maximizer")
	-- 修改包裹符号
	use("tpope/vim-surround")
	-- 替换文字
	use("vim-scripts/ReplaceWithRegister")
	-- 注释
	use("numToStr/Comment.nvim")
	-- 文件管理树
	use("nvim-tree/nvim-tree.lua")
	-- 图标
	use("kyazdani42/nvim-web-devicons")
	-- 状态栏
	use("nvim-lualine/lualine.nvim")
	-- 搜索
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	-- 自动补全
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	-- 代码片段
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- lsp管理
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- lsp 配置
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim")

	-- 格式化代码
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- treesitter 语法树
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- 自动补全括号
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- git
	use("lewis6991/gitsigns.nvim")

	-- bufferline
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

	-- which-key
	use("folke/which-key.nvim")

	-- neotree
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
