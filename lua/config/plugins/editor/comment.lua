-- lua/config/plugins/editor/comment.lua
return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = true
    -- Usage: 
    -- 'gcc' to comment current line
    -- 'gbc' to block comment
    -- 用法: gcc 注释行, gbc 注释块
}
