return {
  "vim-test/vim-test",
  keys = {
    { "<leader>t", group = "test", desc = "test" },
    { "<leader>tt", ":TestFile<CR>", desc = "Test File" },
    { "<leader>ts", ":TestSuite<CR>", desc = "Test Suite" },
    { "<leader>tn", ":TestNearest<CR>", desc = "Test Nearest" },
    { "<leader>tl", ":TestLast<CR>", desc = "Test Last" },
    { "<leader>tg", ":TestVisit<CR>", desc = "Test Visit" },
  },
  dependencies = {
    "preservim/vimux",
  },
  config = function()
    vim.cmd("let test#strategy = 'vimux'")
  end,
}
