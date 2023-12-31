return {
  "vim-denops/denops.vim",
  "folke/trouble.nvim",
  {
    "kat0h/bufpreview.vim",
    dependencies = {"vim-denops/denops.vim"},
    ft = {"markdown"},
    build = "deno task prepare",
  },
  {
    "dhruvasagar/vim-table-mode",
    ft = {"markdown"},
    config = function()
      vim.g.table_mode_corner = "|"
      vim.g.table_mode_header = "-"
    end,
  },
  {
    "mattn/vim-goimports",
    ft = {"go"},
    config = function()
      vim.g.goimports = 1
      vim.g.goimports_simplify = 1
      vim.g.goimports_simplify_cmd = "gofumpt"
    end,
  },
}
