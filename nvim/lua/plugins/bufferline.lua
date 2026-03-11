local bufferline = require("bufferline")

return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        style_preset = bufferline.style_preset.no_italic,
        color_icons = true,
      },
    },
  },
}
