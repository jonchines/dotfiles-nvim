return {
  "numToStr/Comment.nvim",
  lazy = false,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    -- enable comment
    comment.setup({})
  end,
}
