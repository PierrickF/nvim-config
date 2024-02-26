local M = {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-treesitter/nvim-treesitter", -- see doc post install
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-go",
    }
}

function M.config()

    neotest = require("neotest")

    -- General settings
    neotest.setup {
        adapters = {
            require("neotest-go")
        }
    }

    -- Functions for keybinds below
    local run_all = function()
	    neotest.run.run(vim.fn.getcwd())
	end

    local watch_current_file = function()
		neotest.watch.toggle(vim.fn.expand("%"))
	end

    local run_all_in_file = function()
		neotest.run.run(vim.fn.expand("%"))
	end

    -- Keybinds
    vim.keymap.set("n", "<leader>ta", run_all, { desc = "Run all tests", noremap = true })
    vim.keymap.set("n", "<leader>tl", neotest.run.run_last, { desc = "Run last test", noremap = true })
    vim.keymap.set("n", "<leader>tf", run_all_in_file, { desc = "Run all tests in the current file", noremap = true })
    vim.keymap.set("n", "<leader>ts", neotest.summary.toggle, { desc = "Toggle tests summary panel", noremap = true })
    vim.keymap.set("n", "<leader>tw", watch_current_file, { desc = "Toggle watching the current file", noremap = true })
end

return M
