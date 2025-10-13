require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("i", "<C-l>", function()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Copilot Accept", noremap = true, silent = true })

map("t", "<C-n>", "<C-\\><C-n>", { desc = "Terminal Normal Mode" })

map({ "n", "v" }, "<leader>cc", "<cmd>CopilotChatToggle<cr>", { desc = "Toggle Copilot Chat" })

map("n", "<leader>lg", function()
  vim.cmd "vsplit | terminal lazygit"
  vim.cmd "startinsert"
end, { desc = "LazyGit" })

local function DeleteOtherBuffers()
  local current_buf = vim.api.nvim_get_current_buf()
  local current_tab = vim.api.nvim_get_current_tabpage()
  local buffers = vim.api.nvim_list_bufs()
  local tabs = vim.api.nvim_list_tabpages()

  for _, buf in ipairs(buffers) do
    if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end

  for _, tab in ipairs(tabs) do
    if tab ~= current_tab then
      vim.api.nvim_tabpage_close(tab, true)
    end
  end
end

map("n", "<leader>wo", DeleteOtherBuffers, { desc = "Delete Other Buffers" })

map("n", "<leader>lh", function()
  vim.lsp.buf.hover()
end, { desc = "LSP Hover" })
map("n", "<leader>sh", function()
  vim.lsp.buf.signature_help()
end, { desc = "LSP Signature Help" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>k", function()
  vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Line Diagnostics" })
