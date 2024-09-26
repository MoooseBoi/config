return {
  'numToStr/Comment.nvim',
  config = function ()
    require('Comment').setup({
      opleader = {
        line = 'cc',
        block = 'cb'
      }
    })
  end
}
