return {
  "nvim-treesitter/nvim-treesitter",

  config = function()
    local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
    ts_update()

    require('nvim-treesitter.configs').setup({
      highlight = {
        enable = true,
      },

      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
        "python",
        "rust",
      },

      auto_install = true,
    })
  end
}
