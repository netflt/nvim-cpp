return {
    {
        'sindrets/diffview.nvim',
        event = "VeryLazy"
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function ()
            require('gitsigns').setup {
                current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 100,
                    ignore_whitespace = false,
                    virt_text_priority = 100,
                    use_focus = true,
                },
                current_line_blame_formatter = '[<abbrev_sha>] <author> (<author_time:%R>) - <summary>',
            }
        end
    }
}