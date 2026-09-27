return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Recognize CMake projects even when they have no Git repository yet.
      local clangd = opts.servers.clangd
      if clangd then
        table.insert(clangd.root_markers, 1, "CMakeLists.txt")
      end
    end,
  },
}
