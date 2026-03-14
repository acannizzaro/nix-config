-- Synthwave colorscheme — mapped to Ghostty Synthwave palette
-- Palette:
--   0: #000000  black          8:  #7f7094  muted purple
--   1: #f6188f  pink           9:  #f841a0  bright pink
--   2: #1ebb2b  green          10: #25c141  bright green
--   3: #fdf834  yellow         11: #fdf454  bright yellow
--   4: #2186ec  blue           12: #2f9ded  bright blue
--   5: #f85a21  orange         13: #f97137  bright orange
--   6: #12c3e2  cyan           14: #19cde6  bright cyan
--   7: #ffffff  white          15: #ffffff  white
--   fg: #dad9c7               bg: #000000

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end
vim.g.colors_name = "synthwave"

local c = {
	bg = "#000000",
	bg1 = "#1a1a2e",
	bg2 = "#2a2a3e",
	fg = "#dad9c7",
	fg_dim = "#a0a0a0",
	white = "#ffffff",
	pink = "#f6188f",
	green = "#1ebb2b",
	yellow = "#fdf834",
	blue = "#2186ec",
	orange = "#f85a21",
	cyan = "#12c3e2",
	muted = "#7f7094",
	br_pink = "#f841a0",
	br_green = "#25c141",
	br_yellow = "#fdf454",
	br_blue = "#2f9ded",
	br_orange = "#f97137",
	br_cyan = "#19cde6",
	none = "NONE",
}

local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- ── Editor ───────────────────────────────────────────────────────────
hi("Normal", { fg = c.fg, bg = c.bg })
hi("NormalFloat", { fg = c.fg, bg = c.bg1 })
hi("FloatBorder", { fg = c.muted, bg = c.bg1 })
hi("Cursor", { fg = c.bg, bg = c.br_cyan })
hi("CursorLine", { bg = c.bg1 })
hi("CursorLineNr", { fg = c.br_yellow, bold = true })
hi("LineNr", { fg = c.muted })
hi("SignColumn", { bg = c.bg })
hi("ColorColumn", { bg = c.bg1 })
hi("Visual", { bg = c.bg2 })
hi("VisualNOS", { bg = c.bg2 })
hi("Search", { fg = c.bg, bg = c.yellow })
hi("IncSearch", { fg = c.bg, bg = c.br_orange })
hi("CurSearch", { fg = c.bg, bg = c.br_orange })
hi("MatchParen", { fg = c.br_cyan, bold = true, underline = true })
hi("Pmenu", { fg = c.fg, bg = c.bg1 })
hi("PmenuSel", { fg = c.bg, bg = c.br_blue })
hi("PmenuSbar", { bg = c.bg2 })
hi("PmenuThumb", { bg = c.muted })
hi("StatusLine", { fg = c.fg, bg = c.bg1 })
hi("StatusLineNC", { fg = c.muted, bg = c.bg1 })
hi("TabLine", { fg = c.muted, bg = c.bg1 })
hi("TabLineFill", { bg = c.bg })
hi("TabLineSel", { fg = c.fg, bg = c.bg })
hi("WinSeparator", { fg = c.bg2 })
hi("Folded", { fg = c.muted, bg = c.bg1 })
hi("FoldColumn", { fg = c.muted })
hi("NonText", { fg = c.bg2 })
hi("SpecialKey", { fg = c.bg2 })
hi("Whitespace", { fg = c.bg2 })
hi("EndOfBuffer", { fg = c.bg })
hi("Directory", { fg = c.br_blue })
hi("Title", { fg = c.br_pink, bold = true })
hi("ErrorMsg", { fg = c.pink })
hi("WarningMsg", { fg = c.orange })
hi("MoreMsg", { fg = c.br_green })
hi("ModeMsg", { fg = c.fg, bold = true })
hi("Question", { fg = c.br_green })
hi("WildMenu", { fg = c.bg, bg = c.br_blue })
hi("Conceal", { fg = c.muted })
hi("SpellBad", { undercurl = true, sp = c.pink })
hi("SpellCap", { undercurl = true, sp = c.yellow })
hi("SpellRare", { undercurl = true, sp = c.cyan })
hi("SpellLocal", { undercurl = true, sp = c.br_green })
hi("DiffAdd", { fg = c.br_green, bg = "#1a2e1a" })
hi("DiffChange", { fg = c.br_yellow, bg = "#2e2a1a" })
hi("DiffDelete", { fg = c.pink, bg = "#2e1a1a" })
hi("DiffText", { fg = c.br_yellow, bg = "#3e3a2a", bold = true })

-- ── Syntax (vim legacy groups) ───────────────────────────────────────
hi("Comment", { fg = c.muted, italic = true })
hi("Constant", { fg = c.yellow })
hi("String", { fg = c.white })
hi("Character", { fg = c.green })
hi("Number", { fg = c.yellow })
hi("Boolean", { fg = c.br_cyan })
hi("Float", { fg = c.yellow })
hi("Identifier", { fg = c.fg })
hi("Function", { fg = c.blue })
hi("Statement", { fg = c.orange })
hi("Conditional", { fg = c.orange })
hi("Repeat", { fg = c.orange })
hi("Label", { fg = c.orange })
hi("Operator", { fg = c.br_orange })
hi("Keyword", { fg = c.orange })
hi("Exception", { fg = c.orange })
hi("PreProc", { fg = c.br_orange })
hi("Include", { fg = c.orange })
hi("Define", { fg = c.br_orange })
hi("Macro", { fg = c.br_orange })
hi("PreCondit", { fg = c.br_orange })
hi("Type", { fg = c.br_green })
hi("StorageClass", { fg = c.br_green })
hi("Structure", { fg = c.br_green })
hi("Typedef", { fg = c.br_green })
hi("Special", { fg = c.br_orange })
hi("SpecialChar", { fg = c.br_orange })
hi("Tag", { fg = c.orange })
hi("Delimiter", { fg = c.fg })
hi("SpecialComment", { fg = c.muted, bold = true })
hi("Debug", { fg = c.br_orange })
hi("Underlined", { underline = true })
hi("Error", { fg = c.pink })
hi("Todo", { fg = c.bg, bg = c.yellow, bold = true })

-- ── Treesitter ───────────────────────────────────────────────────────
-- Keywords — orange (palette 5)
hi("@keyword", { fg = c.orange })
hi("@keyword.function", { fg = c.orange })
hi("@keyword.return", { fg = c.orange })
hi("@keyword.import", { fg = c.orange })
hi("@keyword.type", { fg = c.orange })
hi("@keyword.operator", { fg = c.orange })
hi("@keyword.coroutine", { fg = c.orange })
hi("@keyword.exception", { fg = c.orange })
hi("@keyword.conditional", { fg = c.orange })
hi("@keyword.repeat", { fg = c.orange })

-- Functions — blue (palette 4)
hi("@function", { fg = c.blue })
hi("@function.call", { fg = c.blue })
hi("@function.builtin", { fg = c.blue })
hi("@function.method", { fg = c.blue })
hi("@function.method.call", { fg = c.blue })

-- Variables
hi("@variable", { fg = c.fg })
hi("@variable.builtin", { fg = c.br_blue, italic = true })
hi("@variable.parameter", { fg = c.br_blue })
hi("@variable.member", { fg = c.fg })

-- Types and classes — bright green for user types, cyan for builtins
hi("@type", { fg = c.br_green })
hi("@type.builtin", { fg = c.cyan })
hi("@type.definition", { fg = c.br_green })
hi("@constructor", { fg = c.br_green })

-- Strings
hi("@string", { fg = c.white })
hi("@string.escape", { fg = c.br_orange })
hi("@string.special", { fg = c.br_orange })
hi("@string.regex", { fg = c.br_orange })
hi("@string.documentation", { fg = c.white })

-- Numbers and constants — yellow (palette 3)
hi("@number", { fg = c.yellow })
hi("@number.float", { fg = c.yellow })
hi("@boolean", { fg = c.br_cyan })
hi("@constant", { fg = c.yellow })
hi("@constant.builtin", { fg = c.br_cyan })
hi("@constant.macro", { fg = c.yellow })

-- Comments
hi("@comment", { fg = c.muted, italic = true })
hi("@comment.documentation", { fg = c.muted, italic = true })
hi("@comment.todo", { fg = c.bg, bg = c.yellow, bold = true })
hi("@comment.note", { fg = c.bg, bg = c.br_blue, bold = true })
hi("@comment.warning", { fg = c.bg, bg = c.orange, bold = true })
hi("@comment.error", { fg = c.bg, bg = c.pink, bold = true })

-- Modules and namespaces
hi("@module", { fg = c.fg })

-- Operators and punctuation
hi("@operator", { fg = c.br_orange })
hi("@punctuation.bracket", { fg = c.fg })
hi("@punctuation.delimiter", { fg = c.fg })
hi("@punctuation.special", { fg = c.br_orange })

-- Properties and attributes
hi("@property", { fg = c.fg })
hi("@attribute", { fg = c.yellow })
hi("@attribute.builtin", { fg = c.yellow })

-- Decorators
hi("@decorator", { fg = c.yellow })

-- Tags (HTML/JSX)
hi("@tag", { fg = c.orange })
hi("@tag.attribute", { fg = c.br_green })
hi("@tag.delimiter", { fg = c.fg_dim })

-- ── LSP Semantic Tokens ──────────────────────────────────────────────
hi("@lsp.type.class", { fg = c.br_green })
hi("@lsp.type.function", { fg = c.blue })
hi("@lsp.type.method", { fg = c.blue })
hi("@lsp.type.parameter", { fg = c.br_blue })
hi("@lsp.type.variable", { fg = c.fg })
hi("@lsp.type.property", { fg = c.fg })
hi("@lsp.type.namespace", { fg = c.fg })
hi("@lsp.type.string", { fg = c.white })
hi("@lsp.type.number", { fg = c.yellow })
hi("@lsp.type.builtinConstant", { fg = c.br_cyan })
hi("@lsp.type.selfParameter", { fg = c.br_blue, italic = true })
hi("@lsp.type.decorator", { fg = c.yellow })

-- ── Diagnostics ──────────────────────────────────────────────────────
hi("DiagnosticError", { fg = c.pink })
hi("DiagnosticWarn", { fg = c.orange })
hi("DiagnosticInfo", { fg = c.br_blue })
hi("DiagnosticHint", { fg = c.br_cyan })
hi("DiagnosticUnderlineError", { undercurl = true, sp = c.pink })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.orange })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.br_blue })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.br_cyan })
hi("DiagnosticSignError", { fg = c.pink })
hi("DiagnosticSignWarn", { fg = c.orange })
hi("DiagnosticSignInfo", { fg = c.br_blue })
hi("DiagnosticSignHint", { fg = c.br_cyan })
hi("DiagnosticVirtualTextError", { fg = c.pink })
hi("DiagnosticVirtualTextWarn", { fg = c.orange })
hi("DiagnosticVirtualTextInfo", { fg = c.br_blue })
hi("DiagnosticVirtualTextHint", { fg = c.br_cyan })

-- ── Git Signs ────────────────────────────────────────────────────────
hi("GitSignsAdd", { fg = c.br_green })
hi("GitSignsChange", { fg = c.br_yellow })
hi("GitSignsDelete", { fg = c.pink })

-- ── Telescope ────────────────────────────────────────────────────────
hi("TelescopeBorder", { fg = c.muted })
hi("TelescopePromptBorder", { fg = c.br_blue })
hi("TelescopePromptTitle", { fg = c.br_blue, bold = true })
hi("TelescopeResultsTitle", { fg = c.br_cyan })
hi("TelescopePreviewTitle", { fg = c.br_green })
hi("TelescopeSelection", { bg = c.bg1 })
hi("TelescopeMatching", { fg = c.yellow, bold = true })

-- ── Completion (nvim-cmp) ────────────────────────────────────────────
hi("CmpItemAbbrMatch", { fg = c.yellow, bold = true })
hi("CmpItemAbbrMatchFuzzy", { fg = c.yellow, bold = true })
hi("CmpItemKindFunction", { fg = c.blue })
hi("CmpItemKindMethod", { fg = c.blue })
hi("CmpItemKindVariable", { fg = c.fg })
hi("CmpItemKindClass", { fg = c.br_green })
hi("CmpItemKindInterface", { fg = c.br_green })
hi("CmpItemKindModule", { fg = c.fg })
hi("CmpItemKindProperty", { fg = c.fg })
hi("CmpItemKindKeyword", { fg = c.orange })
hi("CmpItemKindText", { fg = c.fg })
hi("CmpItemKindSnippet", { fg = c.br_orange })
hi("CmpItemKindFile", { fg = c.fg })
hi("CmpItemKindFolder", { fg = c.br_blue })

-- ── Indent Blankline ─────────────────────────────────────────────────
hi("IblIndent", { fg = c.bg2 })
hi("IblScope", { fg = c.muted })

-- ── Which-Key ────────────────────────────────────────────────────────
hi("WhichKey", { fg = c.br_cyan })
hi("WhichKeyGroup", { fg = c.br_blue })
hi("WhichKeyDesc", { fg = c.fg })
hi("WhichKeySeparator", { fg = c.muted })
hi("WhichKeyValue", { fg = c.muted })

-- ── NvimTree ─────────────────────────────────────────────────────────
hi("NvimTreeNormal", { fg = c.fg, bg = c.bg })
hi("NvimTreeFolderName", { fg = c.br_blue })
hi("NvimTreeFolderIcon", { fg = c.br_blue })
hi("NvimTreeOpenedFolderName", { fg = c.br_blue, bold = true })
hi("NvimTreeRootFolder", { fg = c.br_pink })
hi("NvimTreeSpecialFile", { fg = c.br_green })
hi("NvimTreeGitDirty", { fg = c.orange })
hi("NvimTreeGitNew", { fg = c.br_green })
hi("NvimTreeGitDeleted", { fg = c.pink })
hi("NvimTreeIndentMarker", { fg = c.bg2 })

-- ── Bufferline ───────────────────────────────────────────────────────
hi("BufferLineBackground", { fg = c.muted, bg = c.bg })
hi("BufferLineBuffer", { fg = c.muted, bg = c.bg })
hi("BufferLineBufferSelected", { fg = c.fg, bg = c.bg, bold = true })
hi("BufferLineBufferVisible", { fg = c.fg_dim, bg = c.bg })
hi("BufferLineFill", { bg = c.bg })
hi("BufferLineIndicatorSelected", { fg = c.br_cyan, bg = c.bg })
hi("BufferLineSeparator", { fg = c.bg1, bg = c.bg })
hi("BufferLineModified", { fg = c.orange })
hi("BufferLineModifiedSelected", { fg = c.orange })

-- ── Lualine uses 'auto' theme which picks up Normal/StatusLine ──────
--
-- ── Markdown ─────────────────────────────────────────────────────────
hi("@markup.heading.1", { fg = c.orange, bold = true })
hi("@markup.heading.2", { fg = c.br_blue, bold = true })
hi("@markup.heading.3", { fg = c.yellow, bold = true })
hi("@markup.heading.4", { fg = c.br_green, bold = true })
hi("@markup.strong", { bold = true })
hi("@markup.italic", { italic = true })
hi("@markup.link", { fg = c.br_blue, underline = true })
hi("@markup.link.url", { fg = c.cyan, underline = true })
hi("@markup.raw", { fg = c.br_green })
hi("@markup.list", { fg = c.orange })

-- ── Nix ──────────────────────────────────────────────────────────────
-- Keywords (like Python/Rust: orange)
hi("nixLet", { fg = c.orange })
hi("nixIn", { fg = c.orange })
hi("nixWith", { fg = c.orange })
hi("nixInherit", { fg = c.orange })
hi("nixRec", { fg = c.orange })
hi("nixIf", { fg = c.orange })
hi("nixThen", { fg = c.orange })
hi("nixElse", { fg = c.orange })
hi("nixAssert", { fg = c.orange })
hi("nixImport", { fg = c.orange })

-- Attribute names — bright blue (like function params / identifiers)
hi("nixAttribute", { fg = c.br_blue })
hi("nixAttributePath", { fg = c.br_blue })
hi("nixAttributeDefinition", { fg = c.fg })
hi("nixAttributeAssignment", { fg = c.br_orange })

-- Function args (pkgs, lib, config) — bright orange
hi("nixArgumentDefinition", { fg = c.br_orange })
hi("nixFunctionArgument", { fg = c.fg })

-- Function calls — blue (like Python/Rust functions)
hi("nixFunctionCall", { fg = c.blue })
hi("nixSimpleBuiltin", { fg = c.blue })
hi("nixNamedBuiltin", { fg = c.blue })
hi("nixBuiltin", { fg = c.blue })

-- Strings — white (like Python/Rust)
hi("nixSimpleString", { fg = c.white })
hi("nixString", { fg = c.white })
hi("nixStringDelimiter", { fg = c.white })
hi("nixInterpolation", { fg = c.br_green })
hi("nixInterpolationDelimiter", { fg = c.br_green })

-- Booleans and null — bright cyan (like Python True/None)
hi("nixBoolean", { fg = c.br_cyan })
hi("nixNull", { fg = c.br_cyan })

-- Numbers — yellow (like Python/Rust)
hi("nixInteger", { fg = c.yellow })
hi("nixFloat", { fg = c.yellow })

-- Paths — cyan (unique to Nix)
hi("nixPathDelimiter", { fg = c.cyan })
hi("nixPath", { fg = c.cyan })
hi("nixHomePath", { fg = c.cyan })
hi("nixSearchPath", { fg = c.cyan })
hi("nixURI", { fg = c.cyan, underline = true })

-- Operators — bright orange (like Python/Rust)
hi("nixOperator", { fg = c.br_orange })

-- Comments — muted italic (like Python/Rust)
hi("nixComment", { fg = c.muted, italic = true })
hi("nixBlockComment", { fg = c.muted, italic = true })
hi("nixLineComment", { fg = c.muted, italic = true })

-- Let bindings container
hi("nixLetExpr", { fg = c.fg })

-- ── Rust ─────────────────────────────────────────────────────────────
-- Rust: self keyword
hi("@lsp.type.selfKeyword", { fg = c.br_blue, italic = true })

-- Rust: macros (println!, vec!, format!) — bright pink to stand out
hi("@function.macro", { fg = c.br_pink })
hi("@lsp.type.macro", { fg = c.br_pink })

-- Rust: lifetimes ('a, 'static) — muted but distinct
hi("@lsp.type.lifetime", { fg = c.muted, italic = true })
