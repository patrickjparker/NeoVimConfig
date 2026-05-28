-- ~/.config/nvim/lua/plugins/slime.lua
return {
  -- Register which-key groups
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>m", group = "Send (slime)", icon = "󰒊" },
      },
    },
  },

  {
    "jpalardy/vim-slime",
    init = function()
      vim.g.slime_target = "tmux"
      vim.g.slime_default_config = {
        socket_name = "default",
        target_pane = "{last}",
      }
      vim.g.slime_dont_ask_default = 1
      vim.g.slime_bracketed_paste = 1
      vim.g.slime_cell_delimiter = "# %%"
    end,
    keys = {
      { "<leader>m", "<Plug>SlimeMotionSend", desc = "Send motion", mode = "n", noremap = false },
      { "<leader>m", "<Plug>SlimeRegionSend", desc = "Send selection", mode = "v", noremap = false },
      { "<leader>mm", "<Plug>SlimeLineSend", desc = "Send line", mode = "n", noremap = false },
      { "<leader>mc", "<Plug>SlimeSendCell", desc = "Send cell", mode = "n", noremap = false },
      {
        "<leader>mf",
        function()
          vim.cmd("SlimeSend0 '%run " .. vim.fn.expand("%:p") .. "\\n'")
        end,
        desc = "Send file (%run)",
        mode = "n",
      },
      { "<leader>mv", "<cmd>SlimeConfig<cr>", desc = "Set target pane", mode = "n" },
    },
  },
}
