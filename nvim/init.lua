-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.shortmess:remove("I")

vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
      },
    },
  },
})
