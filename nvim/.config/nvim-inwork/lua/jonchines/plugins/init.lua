return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation
  "pearofducks/ansible-vim", -- Help Neovim distinguish Ansible from YAML
  "JoosepAlviste/nvim-ts-context-commentstring",
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },
}
