-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local cmake = require("config.cmake")
vim.keymap.set("n", "<leader>cG", cmake.configure, { desc = "CMake Configure (Debug)" })
vim.keymap.set("n", "<leader>cb", cmake.build, { desc = "CMake Build" })
vim.keymap.set("n", "<leader>ct", cmake.test, { desc = "CMake Test" })
