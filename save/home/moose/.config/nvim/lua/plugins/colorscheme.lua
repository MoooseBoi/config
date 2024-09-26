return {
  "rebelot/kanagawa.nvim",
  config = function ()
    require('kanagawa').setup({
      theme = "wave"
    })
    vim.cmd("colorscheme kanagawa")
  end
}
