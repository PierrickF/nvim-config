local M = {
	"dense-analysis/ale"
}

function M.config()
	vim.g.ale_lint_on_enter = 1
	vim.g.ale_lint_on_save = 1
	vim.g.ale_fix_on_save = 1
	vim.g.ale_virtualtext_cursor = 0
end

return M
