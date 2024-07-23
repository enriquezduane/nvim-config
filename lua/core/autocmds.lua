-- Create a single autocommand group for all custom autocommands
local augroup = vim.api.nvim_create_augroup("CustomAutocommands", { clear = true })

-- Helper function to create autocommands
local function create_autocmd(event, opts)
	opts.group = augroup
	vim.api.nvim_create_autocmd(event, opts)
end

create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		local curpos = vim.api.nvim_win_get_cursor(0)
		vim.api.nvim_exec(
			[[
      silent! %s/\s\+$//e
    ]],
			false
		)

		vim.api.nvim_exec(
			[[
      silent! g/^$/,/./-j
    ]],
			false
		)

		local last_line = vim.fn.line("$")
		local last_non_blank_line = vim.fn.prevnonblank(last_line)
		if last_non_blank_line < last_line then
			vim.api.nvim_buf_set_lines(0, last_non_blank_line, last_line, true, {})
		end
		vim.api.nvim_win_set_cursor(0, curpos)
	end,
	desc = "clean up file: remove trailing whitespace, reduce multiple empty lines, remove trailing empty lines",
})

-- Return to last edit position when opening files
create_autocmd("BufReadPost", {
	callback = function()
		local last_pos = vim.fn.line("'\"")
		if last_pos > 0 and last_pos <= vim.fn.line("$") then
			vim.api.nvim_win_set_cursor(0, { last_pos, 0 })
		end
	end,
	desc = "Return to last edit position when opening files",
})

-- Auto-reload files when changed on disk (changes outside the editor)
create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	command = "if mode() != 'c' | checktime | endif",
	desc = "Auto-reload files when changed on disk",
})

-- Set indentation for specific file types
create_autocmd("FileType", {
	pattern = { "lua", "javascript", "typescript", "json" },
	callback = function()
		vim.bo.shiftwidth = 2
		vim.bo.tabstop = 2
	end,
	desc = "Set indentation for specific file types",
})

-- Auto-format on save (requires a formatter like Prettier)
create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format()
	end,
	desc = "Auto-format on save",
})

-- Change to file's directory when opening a file
create_autocmd({ "BufEnter", "BufWinEnter" }, {
	callback = function()
		local file_dir = vim.fn.expand("%:p:h")
		if file_dir ~= "" and file_dir ~= vim.fn.getcwd() then
			vim.cmd.cd(file_dir)
		end
	end,
	desc = "Change to file's directory when opening",
})

-- Auto-update Lazy.nvim plugins if updates are available
create_autocmd("VimEnter", {
	callback = function()
		if require("lazy.status").has_updates then
			require("lazy").update({ show = false })
		end
	end,
	desc = "Auto-update Lazy.nvim plugins if updates are available",
})
