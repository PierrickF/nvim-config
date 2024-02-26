local M = {
    "nvim-tree/nvim-tree.lua",
    tag = "nvim-tree-v0.99.0",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    }
}

function M.config()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require('nvim-tree').setup {
        disable_netrw = true,
        hijack_netrw = true,
    }
end

return M
