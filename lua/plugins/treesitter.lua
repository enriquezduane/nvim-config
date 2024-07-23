return {
  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "c", "html", "lua" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true, disable = { "ruby" } },
    },
  },
}
