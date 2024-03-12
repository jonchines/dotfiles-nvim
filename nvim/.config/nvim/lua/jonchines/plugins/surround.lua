-- import nvim-surround plugin safely
local setup, nvim_surround = pcall(require, "nvim-surround")
if not setup then
	return
end

-- enable nvim-surround
nvim_surround.setup()
