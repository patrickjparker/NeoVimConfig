-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("User", {
  pattern = "LazySync",
  desc = "Backup lazy.lock file",
  callback = function()
    vim.system({ "./scripts/backup_lazy.sh" }, { cwd = vim.fn.stdpath("config") }, function(obj)
      if obj.code == 0 then
        print("Commited Lazy Changes")
      end
    end)
  end,
})
