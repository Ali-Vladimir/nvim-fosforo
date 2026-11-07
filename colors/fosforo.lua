-- FOSFORO: tema retro estilo terminal IBM.
-- Usa la misma paleta que alacritty, pero con fondo gris carbon (#121212)
-- en vez de negro puro, para que nvim se distinga de la terminal.
vim.cmd("highlight clear")
vim.g.colors_name = "fosforo"
vim.o.background = "dark"

local c = {
  bg      = "#121212", -- fondo de nvim (la terminal es #000000)
  bg2     = "#1c1c1c", -- linea actual, flotantes, barra
  bg3     = "#2a2a2a",
  sel     = "#1f3f1f", -- seleccion con tinte de fosforo
  fg      = "#d1d1d1",
  dim     = "#666666",
  faint   = "#444444",
  black   = "#000000",
  red     = "#af5f5f",
  green   = "#22ff22",
  yellow  = "#dfaf87",
  blue    = "#87afd7",
  magenta = "#af87af",
  cyan    = "#87afaf",
  white   = "#bcbcbc",
  bred    = "#ff0000",
  byellow = "#ffff00",
  bblue   = "#00aaff",
  bmagenta= "#ff00ff",
  bcyan   = "#00ffff",
}

local hl = function(group, spec) vim.api.nvim_set_hl(0, group, spec) end

-- ── Interfaz ───────────────────────────────────────────────
hl("Normal",       { fg = c.fg, bg = c.bg })
hl("NormalNC",     { fg = c.fg, bg = c.bg })
hl("NormalFloat",  { fg = c.fg, bg = c.bg2 })
hl("FloatBorder",  { fg = c.green, bg = c.bg2 })
hl("FloatTitle",   { fg = c.black, bg = c.green, bold = true })
hl("Cursor",       { fg = c.black, bg = c.green })
hl("CursorLine",   { bg = c.bg2 })
hl("CursorColumn", { bg = c.bg2 })
hl("ColorColumn",  { bg = c.bg2 })
hl("LineNr",       { fg = c.faint })
hl("CursorLineNr", { fg = c.green, bold = true })
hl("SignColumn",   { bg = c.bg })
hl("FoldColumn",   { fg = c.faint, bg = c.bg })
hl("Folded",       { fg = c.dim, bg = c.bg2 })
hl("WinSeparator", { fg = c.bg3 })
hl("VertSplit",    { link = "WinSeparator" })
hl("EndOfBuffer",  { fg = c.bg })
hl("NonText",      { fg = c.faint })
hl("Whitespace",   { fg = c.bg3 })
hl("SpecialKey",   { fg = c.faint })
hl("Visual",       { bg = c.sel })
hl("Search",       { fg = c.black, bg = c.yellow })
hl("IncSearch",    { fg = c.black, bg = c.green, bold = true })
hl("CurSearch",    { link = "IncSearch" })
hl("Substitute",   { fg = c.black, bg = c.bmagenta })
hl("MatchParen",   { fg = c.byellow, bg = c.bg3, bold = true })
hl("Pmenu",        { fg = c.fg, bg = c.bg2 })
hl("PmenuSel",     { fg = c.black, bg = c.green, bold = true })
hl("PmenuSbar",    { bg = c.bg2 })
hl("PmenuThumb",   { bg = c.dim })
hl("StatusLine",   { fg = c.green, bg = c.bg2 })
hl("StatusLineNC", { fg = c.dim, bg = c.bg2 })
hl("TabLine",      { fg = c.dim, bg = c.bg2 })
hl("TabLineSel",   { fg = c.black, bg = c.green, bold = true })
hl("TabLineFill",  { bg = c.bg2 })
hl("WinBar",       { fg = c.dim, bg = c.bg })
hl("Title",        { fg = c.green, bold = true })
hl("Directory",    { fg = c.blue })
hl("ModeMsg",      { fg = c.green, bold = true })
hl("MoreMsg",      { fg = c.green })
hl("Question",     { fg = c.green })
hl("ErrorMsg",     { fg = c.bred, bold = true })
hl("WarningMsg",   { fg = c.byellow })
hl("WildMenu",     { link = "PmenuSel" })
hl("QuickFixLine", { bg = c.sel })

-- Barra de estado: bloques por modo
hl("FosforoModeNormal",  { fg = c.black, bg = c.green, bold = true })
hl("FosforoModeInsert",  { fg = c.black, bg = c.byellow, bold = true })
hl("FosforoModeVisual",  { fg = c.black, bg = c.bmagenta, bold = true })
hl("FosforoModeReplace", { fg = c.black, bg = c.bred, bold = true })
hl("FosforoModeCommand", { fg = c.black, bg = c.bcyan, bold = true })
hl("FosforoStDim",       { fg = c.dim, bg = c.bg2 })
hl("FosforoStError",     { fg = c.bred, bg = c.bg2, bold = true })
hl("FosforoStWarn",      { fg = c.byellow, bg = c.bg2, bold = true })

-- ── Sintaxis ───────────────────────────────────────────────
hl("Comment",      { fg = c.dim, italic = true })
hl("Constant",     { fg = c.magenta })
hl("String",       { fg = c.yellow })
hl("Character",    { fg = c.yellow })
hl("Number",       { fg = c.magenta })
hl("Boolean",      { fg = c.magenta, bold = true })
hl("Float",        { link = "Number" })
hl("Identifier",   { fg = c.fg })
hl("Function",     { fg = c.cyan })
hl("Statement",    { fg = c.blue, bold = true })
hl("Keyword",      { fg = c.blue, bold = true })
hl("Conditional",  { link = "Keyword" })
hl("Repeat",       { link = "Keyword" })
hl("Label",        { fg = c.blue })
hl("Exception",    { fg = c.red, bold = true })
hl("Operator",     { fg = c.white })
hl("PreProc",      { fg = c.red })
hl("Include",      { fg = c.red })
hl("Define",       { fg = c.red })
hl("Macro",        { fg = c.red })
hl("Type",         { fg = c.green })
hl("StorageClass", { fg = c.blue })
hl("Structure",    { fg = c.green })
hl("Typedef",      { fg = c.green })
hl("Special",      { fg = c.cyan })
hl("SpecialChar",  { fg = c.bcyan })
hl("Tag",          { fg = c.blue })
hl("Delimiter",    { fg = c.white })
hl("Underlined",   { fg = c.bblue, underline = true })
hl("Todo",         { fg = c.black, bg = c.byellow, bold = true })
hl("Error",        { fg = c.bred, bold = true })

-- Treesitter / LSP (algunos ajustes finos)
hl("@variable",            { fg = c.fg })
hl("@variable.builtin",    { fg = c.magenta, italic = true })
hl("@variable.parameter",  { fg = c.white, italic = true })
hl("@property",            { fg = c.fg })
hl("@constructor",         { fg = c.green })
hl("@punctuation",         { fg = c.white })
hl("@tag",                 { fg = c.blue })
hl("@tag.attribute",       { fg = c.cyan, italic = true })
hl("@tag.delimiter",       { fg = c.dim })
hl("@markup.heading",      { fg = c.green, bold = true })
hl("@markup.link",         { fg = c.bblue, underline = true })
hl("@markup.raw",          { fg = c.yellow })
hl("@markup.strong",       { bold = true })
hl("@markup.italic",       { italic = true })
hl("@lsp.type.variable",   {})

-- ── Diagnosticos ───────────────────────────────────────────
hl("DiagnosticError", { fg = c.bred })
hl("DiagnosticWarn",  { fg = c.byellow })
hl("DiagnosticInfo",  { fg = c.bblue })
hl("DiagnosticHint",  { fg = c.bcyan })
hl("DiagnosticOk",    { fg = c.green })
hl("DiagnosticUnderlineError", { undercurl = true, sp = c.bred })
hl("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.byellow })
hl("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.bblue })
hl("DiagnosticUnderlineHint",  { undercurl = true, sp = c.bcyan })
hl("DiagnosticVirtualTextError", { fg = c.red, italic = true })
hl("DiagnosticVirtualTextWarn",  { fg = c.yellow, italic = true })
hl("DiagnosticVirtualTextInfo",  { fg = c.blue, italic = true })
hl("DiagnosticVirtualTextHint",  { fg = c.cyan, italic = true })
hl("LspReferenceText",  { bg = c.bg3 })
hl("LspReferenceRead",  { bg = c.bg3 })
hl("LspReferenceWrite", { bg = c.bg3, underline = true })

-- ── Diff / Git ─────────────────────────────────────────────
hl("DiffAdd",     { bg = "#0f2a0f" })
hl("DiffDelete",  { fg = c.red, bg = "#2a0f0f" })
hl("DiffChange",  { bg = "#1a1a2a" })
hl("DiffText",    { bg = "#2a2a4a", bold = true })
hl("Added",       { fg = c.green })
hl("Changed",     { fg = c.yellow })
hl("Removed",     { fg = c.red })
hl("GitSignsAdd",    { fg = c.green })
hl("GitSignsChange", { fg = c.yellow })
hl("GitSignsDelete", { fg = c.red })

-- ── Plugins ────────────────────────────────────────────────
hl("TelescopeNormal",        { link = "NormalFloat" })
hl("TelescopeBorder",        { link = "FloatBorder" })
hl("TelescopeTitle",         { link = "FloatTitle" })
hl("TelescopeSelection",     { fg = c.fg, bg = c.sel, bold = true })
hl("TelescopeSelectionCaret",{ fg = c.green, bg = c.sel })
hl("TelescopeMatching",      { fg = c.green, bold = true })
hl("TelescopePromptPrefix",  { fg = c.green })

hl("NvimTreeNormal",         { fg = c.fg, bg = c.bg })
hl("NvimTreeRootFolder",     { fg = c.green, bold = true })
hl("NvimTreeFolderName",     { fg = c.blue })
hl("NvimTreeOpenedFolderName",{ fg = c.blue, bold = true })
hl("NvimTreeEmptyFolderName",{ fg = c.dim })
hl("NvimTreeFolderArrowClosed",{ fg = c.green })
hl("NvimTreeFolderArrowOpen",{ fg = c.green })
hl("NvimTreeIndentMarker",   { fg = c.faint })
hl("NvimTreeOpenedHL",       { fg = c.green })
hl("NvimTreeGitDirtyIcon",   { fg = c.yellow })
hl("NvimTreeGitNewIcon",     { fg = c.green })
hl("NvimTreeGitDeletedIcon", { fg = c.red })
hl("NvimTreeWinSeparator",   { link = "WinSeparator" })

hl("WhichKey",          { fg = c.green, bold = true })
hl("WhichKeyGroup",     { fg = c.blue })
hl("WhichKeyDesc",      { fg = c.fg })
hl("WhichKeySeparator", { fg = c.dim })
hl("WhichKeyBorder",    { link = "FloatBorder" })

hl("BlinkCmpMenuBorder",     { link = "FloatBorder" })
hl("BlinkCmpDocBorder",      { link = "FloatBorder" })
hl("BlinkCmpLabelMatch",     { fg = c.green, bold = true })
hl("BlinkCmpKind",           { fg = c.dim })

hl("LazyH1",     { fg = c.black, bg = c.green, bold = true })
hl("LazyButton", { fg = c.fg, bg = c.bg3 })
hl("LazyButtonActive", { link = "LazyH1" })
hl("LazySpecial", { fg = c.green })
hl("MasonHeader", { link = "LazyH1" })
hl("MasonHighlight", { fg = c.green })
hl("MasonHighlightBlockBold", { link = "LazyH1" })

-- Colores para la terminal integrada (misma paleta que alacritty)
local term = { c.bg2, c.red, c.green, c.yellow, c.blue, c.magenta, c.cyan, c.white,
  c.dim, c.bred, "#00ff00", c.byellow, c.bblue, c.bmagenta, c.bcyan, "#ffffff" }
for i, col in ipairs(term) do vim.g["terminal_color_" .. (i - 1)] = col end
