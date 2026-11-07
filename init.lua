-- ┌──────────────────────────────────────────┐
-- │  FOSFORO.NVIM  ·  configuracion de nvim  │
-- │  estilo terminal IBM / fosforo verde     │
-- └──────────────────────────────────────────┘

-- La tecla <leader> es ESPACIO. Casi todos los atajos propios empiezan con ella.
-- Presiona espacio y espera: which-key te muestra todo lo disponible.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")        -- plugins
require("config.statusline")

vim.cmd.colorscheme("fosforo")
