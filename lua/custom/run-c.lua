local M = {}
function M.setup()
	vim.api.nvim_create_user_command("RunC", function()
		local file = vim.fn.expand("%:p:r") -- Get path without extension
		local temp_script = os.tmpname()
		local script_content = string.format(
			[[
#!/bin/sh
set -e
gcc -Wall "%s.c" -o "%s.out"
"%s.out"
rm -f "%s.out"
        ]],
			file,
			file,
			file,
			file
		)

		-- Write script content to the temporary file
		local f, err = io.open(temp_script, "w")
		if not f then
			vim.api.nvim_err_writeln("Failed to create temporary script: " .. (err or ""))
			return
		end

		local success, write_err = f:write(script_content)
		if not success then
			f:close()
			vim.api.nvim_err_writeln("Failed to write to temporary script: " .. (write_err or ""))
			return
		end

		f:close()

		local chmod_success = os.execute("chmod +x " .. temp_script)
		if not chmod_success then
			vim.api.nvim_err_writeln("Failed to make temporary script executable")
			os.remove(temp_script)
			return
		end

		local width = math.floor(vim.o.columns * 0.7)
		local height = math.floor(vim.o.lines * 0.6)
		local config = {
			relative = "editor",
			width = width,
			height = height,
			col = math.floor((vim.o.columns - width) / 2),
			row = math.floor((vim.o.lines - height) / 2),
			style = "minimal",
			border = "rounded",
		}
		local buf = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_open_win(buf, true, config)

		vim.fn.termopen(temp_script, {
			on_exit = function()
				os.remove(temp_script)
				vim.api.nvim_buf_set_keymap(buf, "n", "<CR>", ":q<CR>", { noremap = true, silent = true })
				vim.cmd("startinsert")
			end,
		})
		vim.cmd("startinsert")
	end, {})

	vim.keymap.set("n", "<leader>rc", ":RunC<CR>", { noremap = true, silent = true })
end

return M
