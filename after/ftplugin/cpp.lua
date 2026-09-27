-- Keep C++ indentation consistent across projects.
vim.b.editorconfig = false
vim.opt_local.modeline = false
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.tabstop = 4

local undo = vim.b.undo_ftplugin or ""
vim.b.undo_ftplugin = (undo ~= "" and undo .. " | " or "")
  .. "setlocal modeline< expandtab< shiftwidth< softtabstop< tabstop< | unlet! b:editorconfig"
