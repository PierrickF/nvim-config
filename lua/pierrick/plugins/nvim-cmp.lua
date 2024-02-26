local M = {
    "hrsh7th/nvim-cmp",
    dependencies = {
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"hrsh7th/cmp-path",
	"neovim/nvim-lspconfig",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
    "simrat39/rust-tools.nvim", -- depreciated, switch to rustaceanvim
	--"mrcjkb/rustaceanvim",
    }
}

function M.config()
    vim.opt.completeopt = "menu,menuone,noinsert"

    local cmp = require("cmp")
    cmp.setup({
    	mapping = cmp.mapping.preset.insert({
    		["<C-j>"] = cmp.mapping.select_next_item(),
    		["<C-k>"] = cmp.mapping.select_prev_item(),
    		["<C-b>"] = cmp.mapping.scroll_docs(-4),
    		["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<CR>"] = cmp.mapping.confirm({select = true}),
            ["kj"] = cmp.mapping.abort(),
    	}),
    	snippet = {
    		expand = function(args)
    			require("luasnip").lsp_expand(args.body)
    		end,
    	},
    	sources = cmp.config.sources({
    		{ name = "nvim_lsp" },
    		{ name = "nvim_lsp_signature_help" },
    		{ name = "nvim_lua" },
    		{ name = "luasnip" },
    		{ name = "path" },
    	}, {
    		{ name = "buffer", keyword_length = 7 },
    	}),
    })

    -- Setup buffer-local keymaps / options for LSP buffers
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
    local lsp_attach = function(client, buf)

    	vim.api.nvim_buf_set_option(buf, "formatexpr", "v:lua.vim.lsp.formatexpr()")
    	vim.api.nvim_buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
    	vim.api.nvim_buf_set_option(buf, "tagfunc", "v:lua.vim.lsp.tagfunc")
    end

    -- Setup rust_analyzer via rust-tools.nvim
    require("rust-tools").setup({
    	server = {
    		capabilities = capabilities,
    		on_attach = lsp_attach,
    	}
    })

    -- Setup lspconfig
    local nvim_lsp = require("lspconfig")

    -- Setup go
    nvim_lsp["gopls"].setup{
      cmd = {"gopls"},
      capabilities = capabilities,
      settings = {
        gopls = {
          experimentalPostfixCompletions = true,
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
        },
      },
      init_options = {
        usePlaceholders = true,
      }
    }
end

return M
