return {
  "numToStr/Comment.nvim",
  lazy = false,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    -- enable comment with ts_context_commentstring integration
    comment.setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })
  end,
}
