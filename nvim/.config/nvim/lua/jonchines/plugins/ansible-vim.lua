-- import nvim-surround plugin safely
local setup, ansible_vim = pcall(require, "ansible-vim")
if not setup then
	return
end

-- enable ansible-vim
ansible_vim.setup()
