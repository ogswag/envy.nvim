-- Base editor / UI highlights.
--
-- These are identical for both variants (envy and envy-colorful) and are
-- ported 1:1 from the original envy.vim gui section. Transparency only affects
-- the main background groups, per the active variant's `transparent` option.

local M = {}

function M.get(c, opts)
	local transparent = opts.transparent
	local normal_bg = transparent and "NONE" or c.bg

	local hl = {
		-- Core
		Normal = { fg = c.fg, bg = normal_bg },
		NormalNC = { fg = c.fg, bg = normal_bg },
		NormalFloat = { fg = c.fg, bg = transparent and "NONE" or c.white },
		FloatBorder = { fg = c.grey, bg = transparent and "NONE" or c.white },
		FloatTitle = { fg = c.fg, bg = transparent and "NONE" or c.white, bold = true },
		ColorColumn = { bg = c.lgrey1 },
		Conceal = {},
		Cursor = { reverse = true },
		lCursor = { reverse = true },
		CursorIM = { reverse = true },
		CursorLine = { bg = c.lgrey2 },
		CursorColumn = { bg = c.lgrey1 },
		LineNr = { fg = c.grey, bg = transparent and "NONE" or c.lgrey1 },
		CursorLineNr = { fg = c.grey, bg = transparent and "NONE" or c.lgrey1, bold = true },
		SignColumn = { fg = c.grey, bg = transparent and "NONE" or c.lgrey1 },
		FoldColumn = { fg = c.grey, bg = transparent and "NONE" or c.lgrey1 },
		Folded = { bg = c.lgrey1 },
		MatchParen = { bg = c.lblue, bold = true },
		NonText = { fg = c.lgrey2 },
		Whitespace = { fg = c.lgrey2 },
		SpecialKey = { fg = c.blue },
		EndOfBuffer = { fg = c.lgrey2 },

		-- Popup menu / wildmenu
		Pmenu = { fg = c.fg, bg = c.white },
		PmenuSel = { fg = c.fg, bg = c.lgrey2, bold = true },
		PmenuSbar = { bg = c.lgrey1 },
		PmenuThumb = { bg = c.lgrey2 },
		WildMenu = { fg = c.fg, bg = c.lgrey2, bold = true },

		-- Search / selection
		Search = { bg = c.lblue },
		IncSearch = { bg = c.lblue, bold = true },
		CurSearch = { bg = c.lblue, bold = true },
		Substitute = { bg = c.lyellow },
		Visual = { bg = c.lblue },
		VisualNOS = { bg = c.lblue },

		-- Statusline / tabline / splits
		StatusLine = { fg = c.fg, bg = transparent and "NONE" or c.lgrey3, bold = true },
		StatusLineNC = { fg = c.fg, bg = transparent and "NONE" or c.lgrey2 },
		TabLine = { fg = c.fg, bg = transparent and "NONE" or c.lgrey2 },
		TabLineFill = { fg = c.fg, bg = transparent and "NONE" or c.lgrey2 },
		TabLineSel = { fg = c.fg, bg = normal_bg, bold = true },
		WinBar = { fg = c.fg, bg = "NONE", bold = true },
		WinBarNC = { fg = c.grey, bg = "NONE" },
		WinSeparator = { fg = c.lgrey2, bg = "NONE" },
		VertSplit = { fg = c.lgrey2, bg = "NONE" },

		-- Messages
		Title = { fg = c.fg, bold = true },
		Directory = { fg = c.blue, bold = true },
		MoreMsg = { fg = c.fg },
		Question = { fg = c.fg },
		ModeMsg = { fg = c.fg, bold = true },
		MsgArea = { fg = c.fg },
		ErrorMsg = { fg = c.white, bg = c.red },
		WarningMsg = { fg = c.white, bg = c.orange },
		HintMsg = { fg = c.white, bg = c.cyan },
		QuickFixLine = { bg = c.lblue },

		-- Spell
		SpellBad = { sp = c.red, undercurl = true },
		SpellCap = { sp = c.purple, undercurl = true },
		SpellLocal = { sp = c.green, undercurl = true },
		SpellRare = { sp = c.purple, undercurl = true },

		-- Diff
		DiffAdd = { fg = c.green, bg = c.lgrey1 },
		DiffChange = { fg = c.orange, bg = c.lgrey1 },
		DiffDelete = { fg = c.red, bg = c.lgrey1 },
		DiffText = { fg = c.blue, bg = c.lgrey1 },
		Added = { fg = c.green },
		Changed = { fg = c.orange },
		Removed = { fg = c.red },

		-- Semantic helper groups (reused by LSP, diagnostics, and plugins).
		-- These mirror the named groups in the original envy.vim so plugin
		-- highlights can link to them and stay consistent with the legacy theme.
		FloatWindow = { fg = c.fg, bg = c.white },
		ErrorFloatWindow = { fg = c.red, bg = c.white },
		WarningFloatWindow = { fg = c.orange, bg = c.white },
		HintFloatWindow = { fg = c.cyan, bg = c.white },

		ErrorSign = { fg = c.fg, bg = c.lred, bold = true },
		WarningSign = { fg = c.fg, bg = c.lyellow, bold = true },
		HintSign = { fg = c.fg, bg = c.lcyan, bold = true },

		ErrorHighlight = { bg = c.lred },
		WarningHighlight = { bg = c.lyellow },
		HintHighlight = { bg = c.lcyan },

		ErrorUnderline = { sp = c.red, undercurl = true },
		WarningUnderline = { sp = c.orange, undercurl = true },
		HintUnderline = { sp = c.cyan, undercurl = true },

		WhiteOnYellow = { fg = c.white, bg = c.orange },
		WhiteOnRed = { fg = c.white, bg = c.red },
		WhiteOnPurple = { fg = c.white, bg = c.purple },

		-- Misc
		Error = { link = "ErrorMsg" },
		ErrorMsgNC = { link = "ErrorMsg" },
		debugPC = { bg = c.lblue },
		debugBreakpoint = { fg = c.red, bg = c.lgrey1 },
	}

	return hl
end

return M
