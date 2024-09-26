return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function ()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, {})
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
  end
}
