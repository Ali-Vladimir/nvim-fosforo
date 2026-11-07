local o = vim.opt

-- Numeros de linea: el actual absoluto y los demas relativos.
-- Los relativos ayudan a aprender saltos como 5j / 12k / d3j.
o.number = true
o.relativenumber = true
o.cursorline = true
o.signcolumn = "yes"        -- columna fija para git/errores (no "brinca" el texto)

-- Mouse y portapapeles del sistema (ayuda mientras te acostumbras)
o.mouse = "a"
o.clipboard = "unnamedplus" -- y/p usan el portapapeles normal (requiere xclip)

-- Indentacion: 2 espacios
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.smartindent = true

-- Busqueda
o.ignorecase = true
o.smartcase = true          -- si escribes una mayuscula, distingue mayusculas
o.hlsearch = true
o.incsearch = true

-- Interfaz
o.termguicolors = true
o.wrap = false
o.scrolloff = 8             -- siempre deja 8 lineas visibles arriba/abajo
o.sidescrolloff = 8
o.splitright = true
o.splitbelow = true
o.showmode = false          -- el modo ya aparece en la barra de estado
o.laststatus = 3            -- una sola barra de estado global
o.winborder = "single"      -- bordes de linea simple en ventanas flotantes
o.list = true
o.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
o.fillchars = { eob = " ", vert = "│" }
o.confirm = true            -- pregunta antes de cerrar con cambios sin guardar

-- Cursor: bloque que parpadea, como en las terminales viejas
o.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr:hor20-Cursor,o:hor50,"
  .. "a:blinkwait700-blinkoff400-blinkon250"

-- Archivos
o.undofile = true           -- deshacer (u) funciona incluso despues de cerrar
o.swapfile = false
o.updatetime = 250
o.timeoutlen = 400

-- Diagnosticos (errores/avisos del LSP), en texto plano estilo retro
vim.diagnostic.config({
  virtual_text = { prefix = "■", spacing = 2 },
  severity_sort = true,
  float = { border = "single", source = true },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "E",
      [vim.diagnostic.severity.WARN] = "W",
      [vim.diagnostic.severity.INFO] = "I",
      [vim.diagnostic.severity.HINT] = "H",
    },
  },
})

-- Proveedores externos que no usamos (evita avisos en :checkhealth)
for _, p in ipairs({ "python3", "perl", "ruby", "node" }) do
  vim.g["loaded_" .. p .. "_provider"] = 0
end
