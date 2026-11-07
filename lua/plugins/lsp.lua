-- LSP = lo que le da a nvim "inteligencia" de VS Code:
-- autocompletado, ir a definicion, errores, renombrar, formatear...
-- Mason instala los servidores. Abre :Mason para ver/instalar mas.
return {
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "mason-org/mason.nvim",
        cmd = "Mason",
        opts = {
          ui = {
            border = "single",
            icons = { package_installed = "✓", package_pending = "→", package_uninstalled = "x" },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "lua_ls",     -- Lua (para editar esta misma config)
        "ts_ls",      -- JavaScript / TypeScript / React
        "html",
        "cssls",
        "jsonls",
        "tailwindcss",
        "prismals",   -- Prisma
        "gopls",      -- Go
      },
    },
    config = function(_, opts)
      -- Que lua_ls reconozca la variable global `vim`
      vim.lsp.config("lua_ls", {
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      })
      require("mason-lspconfig").setup(opts)

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("fosforo-lsp", { clear = true }),
        callback = function(ev)
          local map = function(l, r, d) vim.keymap.set("n", l, r, { buffer = ev.buf, desc = d }) end
          local tb = function(p) return "<Cmd>Telescope " .. p .. "<CR>" end
          map("gd", tb("lsp_definitions"), "Ir a definicion")
          map("K", vim.lsp.buf.hover, "Documentacion")
          map("<leader>lr", vim.lsp.buf.rename, "Renombrar simbolo")
          map("<leader>la", vim.lsp.buf.code_action, "Acciones de codigo")
          map("<leader>lR", tb("lsp_references"), "Referencias")
          map("<leader>ls", tb("lsp_document_symbols"), "Simbolos del archivo")
          map("<leader>ld", vim.diagnostic.open_float, "Ver error de esta linea")
          map("<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "Formatear archivo")
          map("<F2>", vim.lsp.buf.rename, "Renombrar (como VS Code)")
          map("<F12>", tb("lsp_definitions"), "Ir a definicion (como VS Code)")
        end,
      })
    end,
  },

  -- Autocompletado
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    opts = {
      -- Enter acepta, Tab/Shift+Tab se mueven, Ctrl+Espacio abre el menu
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 300 },
        menu = {
          draw = { columns = { { "label", "label_description", gap = 1 }, { "kind" } } },
        },
      },
      signature = { enabled = true },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
  },
}
