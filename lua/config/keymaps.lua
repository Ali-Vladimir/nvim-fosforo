local map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- ── Basicos ────────────────────────────────────────────────
map("i", "jk", "<Esc>", "Salir de modo insertar")
map({ "n", "i", "v" }, "<C-s>", "<Cmd>w<CR><Esc>", "Guardar")
map("n", "<leader>w", "<Cmd>w<CR>", "Guardar")
map("n", "<leader>q", "<Cmd>q<CR>", "Cerrar ventana")
map("n", "<leader>Q", "<Cmd>qa<CR>", "Salir de nvim")
map("n", "<Esc>", "<Cmd>nohlsearch<CR>", "Quitar resaltado de busqueda")

-- ── Edicion ────────────────────────────────────────────────
-- Mover lineas con Alt+j / Alt+k (como Alt+flechas en VS Code)
map("n", "<A-j>", "<Cmd>m .+1<CR>==", "Bajar linea")
map("n", "<A-k>", "<Cmd>m .-2<CR>==", "Subir linea")
map("v", "<A-j>", ":m '>+1<CR>gv=gv", "Bajar seleccion")
map("v", "<A-k>", ":m '<-2<CR>gv=gv", "Subir seleccion")

-- Indentar en modo visual sin perder la seleccion
map("v", "<", "<gv", "Quitar indentacion")
map("v", ">", ">gv", "Indentar")

-- Comentar con Ctrl+/ (nvim ya trae gcc / gc de fabrica)
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, desc = "Comentar linea" })
vim.keymap.set("v", "<C-/>", "gc", { remap = true, desc = "Comentar seleccion" })
vim.keymap.set("n", "<C-_>", "gcc", { remap = true, desc = "Comentar linea" })
vim.keymap.set("v", "<C-_>", "gc", { remap = true, desc = "Comentar seleccion" })

-- Pegar sobre una seleccion sin perder lo que copiaste
map("x", "<leader>p", [["_dP]], "Pegar sin sobrescribir registro")

-- Centrar la pantalla al saltar media pagina o buscar
map("n", "<C-d>", "<C-d>zz", "Media pagina abajo")
map("n", "<C-u>", "<C-u>zz", "Media pagina arriba")
map("n", "n", "nzzzv", "Siguiente resultado")
map("n", "N", "Nzzzv", "Resultado anterior")

-- ── Ventanas ───────────────────────────────────────────────
map("n", "<C-h>", "<C-w>h", "Ventana izquierda")
map("n", "<C-j>", "<C-w>j", "Ventana abajo")
map("n", "<C-k>", "<C-w>k", "Ventana arriba")
map("n", "<C-l>", "<C-w>l", "Ventana derecha")
map("n", "<leader>sv", "<Cmd>vsplit<CR>", "Dividir vertical")
map("n", "<leader>sh", "<Cmd>split<CR>", "Dividir horizontal")

-- ── Buffers (archivos abiertos) ────────────────────────────
map("n", "<S-l>", "<Cmd>bnext<CR>", "Siguiente buffer")
map("n", "<S-h>", "<Cmd>bprevious<CR>", "Buffer anterior")
map("n", "<leader>bd", "<Cmd>bdelete<CR>", "Cerrar buffer")

-- ── Terminal flotante y lazygit ────────────────────────────
local function float_term(cmd)
  local buf = vim.api.nvim_create_buf(false, true)
  local w = math.floor(vim.o.columns * 0.85)
  local h = math.floor(vim.o.lines * 0.80)
  vim.api.nvim_open_win(buf, true, {
    relative = "editor", width = w, height = h,
    row = math.floor((vim.o.lines - h) / 2), col = math.floor((vim.o.columns - w) / 2),
    style = "minimal", border = "single",
    title = " " .. (cmd or "terminal") .. " ", title_pos = "center",
  })
  vim.fn.jobstart(cmd or vim.o.shell, {
    term = true,
    on_exit = function()
      if vim.api.nvim_buf_is_valid(buf) then vim.api.nvim_buf_delete(buf, { force = true }) end
    end,
  })
  vim.cmd.startinsert()
end
map("n", "<leader>t", function() float_term() end, "Terminal flotante")
map("n", "<leader>gg", function() float_term("lazygit") end, "Lazygit")
map("t", "<Esc><Esc>", [[<C-\><C-n>]], "Salir de modo terminal")
