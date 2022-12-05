local setup, bufferline = pcall(require, "bufferline")
if not setup then
	return
end

vim.opt.termguicolors = true
bufferline.setup()
