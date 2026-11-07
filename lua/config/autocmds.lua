local au = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup("fosforo", { clear = true })

-- Destello al copiar (yank) para ver que se copio
au("TextYankPost", {
  group = group,
  callback = function() vim.hl.on_yank({ higroup = "IncSearch", timeout = 180 }) end,
})

-- Al abrir un archivo, volver a la ultima posicion del cursor
au("BufReadPost", {
  group = group,
  callback = function(ev)
    local mark = vim.api.nvim_buf_get_mark(ev.buf, '"')
    local lines = vim.api.nvim_buf_line_count(ev.buf)
    if mark[1] > 0 and mark[1] <= lines then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Igualar tamaño de ventanas si cambias el tamaño de la terminal
au("VimResized", { group = group, command = "wincmd =" })
