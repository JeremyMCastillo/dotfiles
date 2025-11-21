require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("i", "<C-l>", function()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Copilot Accept", noremap = true, silent = true })

map("t", "<C-n>", "<C-\\><C-n>", { desc = "Terminal Normal Mode" })

map("n", "<leader>lg", function()
  vim.cmd "vsplit | terminal lazygit"
  vim.cmd "startinsert"
end, { desc = "LazyGit" })

map("n", "<leader>oc", function()
  vim.cmd "vsplit | terminal opencode"
  vim.cmd "startinsert"
end, { desc = "Opencode" })

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

map({ "n", "v", "i", "t" }, "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map({ "n", "v", "i", "t" }, "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map({ "n", "v", "i", "t" }, "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map({ "n", "v", "i", "t" }, "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Copilot chat
map({ "n", "v" }, "<leader>cc", "<cmd>CopilotChatToggle<cr>", { desc = "Toggle Copilot Chat" })
map("v", "<leader>ce", "<cmd>CopilotChatExplain<cr>", { desc = "Explain Selection" })
map("v", "<leader>cr", "<cmd>CopilotChatReview<cr>", { desc = "Review Selection" })
map("v", "<leader>cf", "<cmd>CopilotChatFix<cr>", { desc = "Fix It" })
map("v", "<leader>co", "<cmd>CopilotChatOptimize<cr>", { desc = "Optimize Selection" })
map("v", "<leader>cd", "<cmd>CopilotChatDocs<cr>", { desc = "Document Selection" })
map("v", "<leader>ct", "<cmd>CopilotChatTests<cr>", { desc = "Generate Tests" })

-- Debugging
map("n", "<leader>bb", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle Breakpoint" })
map("n", "<leader>bn", "<cmd>DapNew<cr>", { desc = "Launch New Debug Session" })
map("n", "<leader>bc", "<cmd>DapContinue<cr>", { desc = "Continue" })
map("n", "<leader>bo", "<cmd>DapStepOver<cr>", { desc = "Step Over" })
map("n", "<leader>bi", "<cmd>DapStepInto<cr>", { desc = "Step Into" })

map({ "n", "v" }, "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "Code Action Menu" })
