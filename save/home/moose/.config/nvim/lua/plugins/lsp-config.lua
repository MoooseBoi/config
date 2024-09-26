return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({})

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      mason_lspconfig.setup_handlers {
        function (lsp_name)
          require("lspconfig")[lsp_name].setup({ capabilities = capabilities })
        end,
      }
      local opts = {}
      vim.keymap.set("n", "<leader>d", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    end
  }
}
