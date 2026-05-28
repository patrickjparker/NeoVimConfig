-- ~/.config/nvim/lua/plugins/various-textobjs.lua
return {
  -- Override mini.ai config to:
  -- 1. Move class from c -> C in custom_textobjects
  -- 2. Patch ai_whichkey so which-key labels follow suit
  {
    "nvim-mini/mini.ai",
    optional = true,
    opts = function(_, opts)
      local ai = require("mini.ai")
      opts.custom_textobjects = opts.custom_textobjects or {}
      -- Copy class spec to C, remove from c
      opts.custom_textobjects["C"] = opts.custom_textobjects["c"]
      opts.custom_textobjects["c"] = false
      return opts
    end,
    config = function(_, opts)
      require("mini.ai").setup(opts)

      -- Patch LazyVim.mini.ai_whichkey before it runs:
      -- wrap it so that after it registers all labels, we fix c and C
      local orig = LazyVim.mini.ai_whichkey
      LazyVim.mini.ai_whichkey = function(wk_opts)
        orig(wk_opts)
        -- Now fix up the labels: c -> cell, C -> class
        -- which-key last-write wins, so calling add() again overrides
        local wk = require("which-key")
        wk.add({
          { "ac", desc = "cell", mode = { "x", "o" } },
          { "ic", desc = "cell", mode = { "x", "o" } },
          { "aC", desc = "class", mode = { "x", "o" } },
          { "iC", desc = "class", mode = { "x", "o" } },
          { "anc", desc = "cell", mode = { "x", "o" } },
          { "inc", desc = "cell", mode = { "x", "o" } },
          { "alc", desc = "cell", mode = { "x", "o" } },
          { "ilc", desc = "cell", mode = { "x", "o" } },
          { "anC", desc = "class", mode = { "x", "o" } },
          { "inC", desc = "class", mode = { "x", "o" } },
          { "alC", desc = "class", mode = { "x", "o" } },
          { "ilC", desc = "class", mode = { "x", "o" } },
        })
      end

      -- Now trigger the standard LazyVim which-key registration
      LazyVim.on_load("which-key.nvim", function()
        LazyVim.mini.ai_whichkey(opts)
      end)
    end,
  },

  -- Cell text objects via nvim-various-textobjs
  {
    "chrisgrieser/nvim-various-textobjs",
    keys = {
      {
        "ic",
        '<cmd>lua require("various-textobjs").notebookCell("inner")<CR>',
        mode = { "o", "x" },
        desc = "inner cell",
      },
      {
        "ac",
        '<cmd>lua require("various-textobjs").notebookCell("outer")<CR>',
        mode = { "o", "x" },
        desc = "around cell",
      },
    },
    opts = {
      keymaps = { useDefaults = false },
    },
  },
}
