local M = {
	"vim-airline/vim-airline",
	dependencies = {
		"vim-airline/vim-airline-themes",
	}
}

function M.config()
	vim.g.airline_theme = "gruvbox"
	vim.g.airline_powerline_fonts = 1
	vim.g.left_sep = ""
	vim.g.right_sep = ""
	vim.g.airline_section_x = "%{&filetype}"
	vim.g.airline_section_z = "%l/%L-%c"
	vim.g["airline#extensions#wordcount#enabled"] = 0
	vim.g["airline#extensions#ale#enabled"] = 1
    vim.g["airline#extensions#term#enabled"] = 0
end

return M
