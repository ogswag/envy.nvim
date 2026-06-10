-- LSP: diagnostics, references, inlay hints, and semantic tokens.
--
-- Diagnostics link to the semantic helper groups defined in editor.lua
-- (ErrorSign/ErrorHighlight/ErrorUnderline/…), keeping behaviour consistent
-- with the original envy.vim. Semantic tokens reuse the per-variant token map.

local syntax = require("envy.groups.syntax")

local M = {}

function M.get(c, opts, variant)
	local t = syntax.tokens(c, opts, variant)

	return {
		-- Diagnostic base colors
		DiagnosticError = { fg = c.red },
		DiagnosticWarn = { fg = c.orange },
		DiagnosticInfo = { fg = c.cyan },
		DiagnosticHint = { fg = c.cyan },
		DiagnosticOk = { fg = c.green },

		-- Virtual text (background-tinted, like the original design)
		DiagnosticVirtualTextError = { link = "ErrorHighlight" },
		DiagnosticVirtualTextWarn = { link = "WarningHighlight" },
		DiagnosticVirtualTextInfo = { link = "HintHighlight" },
		DiagnosticVirtualTextHint = { link = "HintHighlight" },

		-- Underlines
		DiagnosticUnderlineError = { link = "ErrorUnderline" },
		DiagnosticUnderlineWarn = { link = "WarningUnderline" },
		DiagnosticUnderlineInfo = { link = "HintUnderline" },
		DiagnosticUnderlineHint = { link = "HintUnderline" },

		-- Signs
		DiagnosticSignError = { link = "ErrorSign" },
		DiagnosticSignWarn = { link = "WarningSign" },
		DiagnosticSignInfo = { link = "HintSign" },
		DiagnosticSignHint = { link = "HintSign" },

		-- Floating
		DiagnosticFloatingError = { link = "ErrorFloatWindow" },
		DiagnosticFloatingWarn = { link = "WarningFloatWindow" },
		DiagnosticFloatingInfo = { link = "HintFloatWindow" },
		DiagnosticFloatingHint = { link = "HintFloatWindow" },

		DiagnosticUnnecessary = { fg = c.grey, undercurl = true, sp = c.grey },
		DiagnosticDeprecated = { fg = c.grey, strikethrough = true },

		-- References / signature / inlay hints / codelens
		LspReferenceText = { bg = c.lblue },
		LspReferenceRead = { bg = c.lblue },
		LspReferenceWrite = { bg = c.lblue, bold = true },
		LspSignatureActiveParameter = { bg = c.lblue, bold = true },
		LspInlayHint = { fg = c.grey, bg = c.lgrey1, italic = true },
		LspCodeLens = { link = "Comment" },
		LspInfoBorder = { link = "FloatBorder" },

		-- Semantic tokens
		["@lsp.type.class"] = { link = "Type" },
		["@lsp.type.decorator"] = { link = "Macro" },
		["@lsp.type.enum"] = { link = "Type" },
		["@lsp.type.enumMember"] = { link = "Constant" },
		["@lsp.type.function"] = { link = "Function" },
		["@lsp.type.interface"] = { link = "Type" },
		["@lsp.type.macro"] = { link = "Macro" },
		["@lsp.type.method"] = { link = "Function" },
		["@lsp.type.namespace"] = t.type,
		["@lsp.type.parameter"] = t.parameter,
		["@lsp.type.property"] = t.property,
		["@lsp.type.struct"] = { link = "Type" },
		["@lsp.type.type"] = { link = "Type" },
		["@lsp.type.typeParameter"] = { link = "Type" },
		["@lsp.type.keyword"] = { link = "Keyword" },
		["@lsp.type.string"] = { link = "String" },
		["@lsp.type.number"] = { link = "Number" },
		["@lsp.type.comment"] = { link = "Comment" },
		["@lsp.type.variable"] = {}, -- defer to Treesitter @variable

		["@lsp.typemod.function.defaultLibrary"] = t.func,
		["@lsp.typemod.variable.defaultLibrary"] = t.constant,
		["@lsp.typemod.variable.readonly"] = { link = "Constant" },
		["@lsp.typemod.variable.global"] = { link = "Constant" },
	}
end

return M
