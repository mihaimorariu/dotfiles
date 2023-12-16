return {
  "mfussenegger/nvim-dap-python",
  build = ":TSInstall python",
  config = function()
    require("dap-python").setup("/usr/bin/python")
  end
}
