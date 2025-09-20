require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map('i', '<C-l>', function()
  vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
end, {desc = 'Copilot Accept', noremap = true, silent = true})

map('t', '<C-n>', '<C-\\><C-n>', { desc = "Terminal Normal Mode" })

map("n", "<leader>cc", "<cmd>CopilotChatToggle<cr>", { desc = "Toggle Copilot Chat" })

map("n", "<leader>lg", function()
  vim.cmd("vsplit | terminal lazygit")
  vim.cmd("startinsert")
end, { desc = "LazyGit" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
