-- Barra de estado propia, sin plugins. Bloques de color segun el modo,
-- como las barras de los editores de DOS / terminales IBM.
local modes = {
  n = { "NORMAL", "FosforoModeNormal" },
  i = { "INSERTAR", "FosforoModeInsert" },
  v = { "VISUAL", "FosforoModeVisual" },
  V = { "V-LINEA", "FosforoModeVisual" },
  ["\22"] = { "V-BLOQUE", "FosforoModeVisual" },
  R = { "REEMPLAZO", "FosforoModeReplace" },
  c = { "COMANDO", "FosforoModeCommand" },
  t = { "TERMINAL", "FosforoModeCommand" },
  s = { "SELECCION", "FosforoModeVisual" },
}

local function diagnostics()
  local c = vim.diagnostic.count(0)
  local S = vim.diagnostic.severity
  local out = {}
  if (c[S.ERROR] or 0) > 0 then table.insert(out, "%#FosforoStError#E:" .. c[S.ERROR]) end
  if (c[S.WARN] or 0) > 0 then table.insert(out, "%#FosforoStWarn#W:" .. c[S.WARN]) end
  return #out > 0 and (table.concat(out, " ") .. " ") or ""
end

function _G.fosforo_statusline()
  local m = modes[vim.fn.mode():sub(1, 1)] or { vim.fn.mode():upper(), "FosforoModeNormal" }
  local branch = vim.b.gitsigns_head
  branch = branch and branch ~= "" and ("%#FosforoStDim# git:" .. branch .. " ") or ""
  return table.concat({
    "%#" .. m[2] .. "# " .. m[1] .. " ",
    branch,
    "%#StatusLine# %f %m%r",
    "%=",
    diagnostics(),
    "%#FosforoStDim#%{&filetype} ",
    "%#" .. m[2] .. "# %l:%c  %p%% ",
  })
end

vim.o.statusline = "%!v:lua.fosforo_statusline()"
