-- lazy.nvim: gestor de plugins. Se instala solo la primera vez.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  install = { colorscheme = { "fosforo" } },
  change_detection = { notify = false },
  rocks = { enabled = false },  -- ningun plugin aqui necesita luarocks
  ui = {
    border = "single",
    -- Sin iconos "Nerd Font": texto plano, estilo retro
    icons = {
      cmd = "[cmd]", config = "[cfg]", event = "[ev]", favorite = "*", ft = "[ft]",
      init = "[init]", import = "[imp]", keys = "[key]", lazy = "~", loaded = "●",
      not_loaded = "○", plugin = "[plug]", runtime = "[rt]", require = "[req]",
      source = "[src]", start = ">", task = "+", list = { "●", "→", "*", "-" },
    },
  },
})
