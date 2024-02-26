local M = {
    "andythigpen/nvim-coverage",
    dependencies = {
        "nvim-lua/plenary.nvim",
    }
}

function M.config()

    ncoverage = require("coverage")

    ncoverage.setup {
        commands = true,
	    highlights = {
	    	uncovered = {
                fg = "#CC241D", -- gruvbox dark
                bg = "#3C3836" -- gruvbox dark
            },
	    },
	    signs = {
	    	covered = { hl = "CoverageCovered", text = "" },
	    },
	    summary = {
	    	min_coverage = 80.0,
	    },
	    lang = {
	    	-- Go and Rust natively supported
	    },
    }
end

return M
