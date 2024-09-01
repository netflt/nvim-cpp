
return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-cmdline",
        "hrsh7th/vim-vsnip"
    },
    init = function()
        local cmp = require("cmp")
        cmp.setup({
        -- 指定 snippet 引擎
        experimental = {
            ghost_text = false, --隐藏编辑时默认补全的内容,否则影响可读性 
        },

        snippet = {
            expand = function(args)
            -- For `vsnip` users.
            vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
                ['<tab>'] = cmp.mapping.confirm({ select = true })
            }),
        -- 补全源
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            -- For vsnip users.
            { name = "vsnip" },
        }, { { name = "buffer" }, { name = "path" } }),

        })

        -- / 查找模式使用 buffer 源
        cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" },
        },
        })

        -- : 命令行模式中使用 path 和 cmdline 源.
        cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            { name = "cmdline" },
        }),
        })
    end,
}
