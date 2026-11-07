return {
  -- which-key: presiona <espacio> y espera para ver todos los atajos.
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "classic",
      delay = 300,
      icons = {
        mappings = false,
        breadcrumb = "»", separator = "->", group = "+",
        keys = {
          Up = "<Up> ", Down = "<Down> ", Left = "<Left> ", Right = "<Right> ",
          C = "<C-…> ", M = "<M-…> ", D = "<D-…> ", S = "<S-…> ", CR = "<CR> ",
          Esc = "<Esc> ", ScrollWheelDown = "<ScrollWheelDown> ",
          ScrollWheelUp = "<ScrollWheelUp> ", NL = "<NL> ", BS = "<BS> ",
          Space = "<Space> ", Tab = "<Tab> ", F1 = "<F1>", F2 = "<F2>", F3 = "<F3>",
          F4 = "<F4>", F5 = "<F5>", F6 = "<F6>", F7 = "<F7>", F8 = "<F8>",
          F9 = "<F9>", F10 = "<F10>", F11 = "<F11>", F12 = "<F12>",
        },
      },
      spec = {
        { "<leader>f", group = "buscar" },
        { "<leader>l", group = "lsp / codigo" },
        { "<leader>g", group = "git" },
        { "<leader>b", group = "buffers" },
        { "<leader>s", group = "dividir ventana" },
      },
    },
  },

  -- Telescope: buscador difuso de archivos, texto, buffers...
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      { "<C-p>",      "<Cmd>Telescope find_files<CR>",  desc = "Buscar archivo" },
      { "<leader>ff", "<Cmd>Telescope find_files<CR>",  desc = "Buscar archivo" },
      { "<leader>fg", "<Cmd>Telescope live_grep<CR>",   desc = "Buscar texto en el proyecto" },
      { "<leader>fb", "<Cmd>Telescope buffers<CR>",     desc = "Buffers abiertos" },
      { "<leader>fr", "<Cmd>Telescope oldfiles<CR>",    desc = "Archivos recientes" },
      { "<leader>fw", "<Cmd>Telescope grep_string<CR>", desc = "Buscar palabra bajo cursor" },
      { "<leader>fh", "<Cmd>Telescope help_tags<CR>",   desc = "Buscar en la ayuda" },
      { "<leader>fk", "<Cmd>Telescope keymaps<CR>",     desc = "Buscar atajos" },
      { "<leader>fd", "<Cmd>Telescope diagnostics<CR>", desc = "Errores del proyecto" },
      { "<leader>/",  "<Cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Buscar en este archivo" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          prompt_prefix = "> ",
          selection_caret = "> ",
          entry_prefix = "  ",
          borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          file_ignore_patterns = { "node_modules/", "%.git/", "dist/", "%.next/" },
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
        },
        pickers = {
          find_files = { hidden = true },
        },
      })
      pcall(telescope.load_extension, "fzf")
    end,
  },

  -- Explorador de archivos lateral (como la barra de VS Code), sin iconos
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    keys = {
      { "<leader>e", "<Cmd>NvimTreeToggle<CR>",   desc = "Explorador de archivos" },
      { "<leader>E", "<Cmd>NvimTreeFindFile<CR>", desc = "Mostrar archivo actual en el explorador" },
    },
    opts = {
      view = { width = 32 },
      filters = { dotfiles = false, custom = { "^.git$" } },
      renderer = {
        root_folder_label = ":~:s?$?/?",
        indent_markers = { enable = true },
        icons = {
          show = { file = false, folder = false, folder_arrow = true, git = true },
          glyphs = {
            folder = { arrow_closed = "+", arrow_open = "-" },
            git = {
              unstaged = "~", staged = "✓", unmerged = "!", renamed = "»",
              untracked = "?", deleted = "x", ignored = "◌",
            },
          },
        },
      },
    },
  },

  -- Marcas de git al costado (lineas nuevas, cambiadas, borradas)
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "│" }, change = { text = "│" }, delete = { text = "_" },
        topdelete = { text = "‾" }, changedelete = { text = "~" }, untracked = { text = "┆" },
      },
      on_attach = function(buf)
        local gs = require("gitsigns")
        local map = function(l, r, d) vim.keymap.set("n", l, r, { buffer = buf, desc = d }) end
        map("]h", function() gs.nav_hunk("next") end, "Siguiente cambio git")
        map("[h", function() gs.nav_hunk("prev") end, "Cambio git anterior")
        map("<leader>gp", gs.preview_hunk, "Ver cambio")
        map("<leader>gr", gs.reset_hunk, "Deshacer cambio")
        map("<leader>gb", gs.blame_line, "Quien escribio esta linea")
      end,
    },
  },

  -- Cierra parentesis, comillas y llaves automaticamente
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
}
