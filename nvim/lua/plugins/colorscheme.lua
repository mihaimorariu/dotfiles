return {
  {
    "rebelot/kanagawa.nvim",
    opts = {
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
    },
  },

  {
    "folke/tokyonight.nvim",
    opts = {
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    },
  },

  {
    "arturgoms/moonbow.nvim",
    opts = {
      italic = false,
      transparent_mode = true,
    },
  },

  {
    "DonJulve/NeoCyberVim",
    opts = {
      transparent = true,
      italics = {
        comments = false,
        keywords = false,
        functions = false,
        strings = false,
        variables = false,
      },
    },
  },

  {
    "cpea2506/one_monokai.nvim",
    enabled = false,
    opts = {
      transparent = true,
      italics = false,
    },
  },

  {
    "zootedb0t/citruszest.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      option = {
        transparent = true,
        italic = false,
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "moonbow",
    },
  },
}
