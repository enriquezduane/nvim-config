local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Paste in visual mode without yanking the replaced text
keymap("v", "p", '"_dP', opts)

-- Move by visual lines when wrapping is enabled
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Buffer navigation
keymap("n", "<Tab>", "<Cmd>bnext!<CR>", opts)
keymap("n", "<S-Tab>", "<Cmd>bprev!<CR>", opts)
keymap("n", "<leader>x", "<Cmd>bdelete!<CR>", opts)

-- Map Ctrl+D and Ctrl+U to Command on a Mac
-- if vim.fn.has("mac") == 1 then
--     keymap('n', '<D-d>', '<C-d>', opts)
--     keymap('n', '<D-u>', '<C-u>', opts)
-- end
