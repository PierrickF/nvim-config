-- Remove trailing white spaces on file write
-- and keep the cursor in place
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        pcall(function() vim.cmd [[%s/\s\+$//e]] end)
        vim.fn.setpos(".", save_cursor)
    end,
})

-- Run rustfmt every time a rust file is written
-- and keep the cursor in place
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = {"*.rs"},
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        pcall(function() vim.cmd [[%! rustfmt]] end)
        vim.fn.setpos(".", save_cursor)
    end
})

-- Run gofmt every time a Go file is written
-- and keep the cursor in place
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = {"*.go"},
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        pcall(function() vim.cmd [[%! gofmt]] end)
        vim.fn.setpos(".", save_cursor)
    end
})

-- Force line wrapping for git commits at the 72nd character
vim.api.nvim_create_autocmd("Filetype", {
    pattern = "gitcommit",
    command = "setlocal tw=72",
})

-- Always open nvim-tree
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        require("nvim-tree.api").tree.open()
    end
})

-- Close nvim-tree or nvim if nvim-tree is the last window open
vim.api.nvim_create_autocmd("QuitPre", {
    callback = function()
        local tree_wins = {}
        local floating_wins = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
            local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
            if bufname:match("NvimTree_") ~= nil then
                table.insert(tree_wins, w)
            end
            if vim.api.nvim_win_get_config(w).relative ~= '' then
                table.insert(floating_wins, w)
            end
        end
        if 1 == #wins - #floating_wins - #tree_wins then
        -- Should quit, so we close all invalid windows.
            for _, w in ipairs(tree_wins) do
                vim.api.nvim_win_close(w, true)
            end
        end
    end
})
