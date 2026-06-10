-- Treesitter highlights (@-captures).
--
-- Reuses the per-variant token map from syntax.lua, so modern Treesitter
-- highlighting matches the legacy regex groups for both variants. Covers both
-- the current (@markup.*, @variable.member) and legacy (@text.*, @field)
-- capture names.

local syntax = require("envy.groups.syntax")

local M = {}

function M.get(c, opts, variant)
  local t = syntax.tokens(c, opts, variant)

  return {
    -- Comments
    ["@comment"]               = { link = "Comment" },
    ["@comment.documentation"] = { link = "Comment" },
    ["@comment.error"]         = { link = "ErrorMsg" },
    ["@comment.warning"]       = { link = "WarningMsg" },
    ["@comment.note"]          = { link = "Todo" },
    ["@comment.todo"]          = { link = "Todo" },

    -- Constants / literals
    ["@constant"]          = { link = "Constant" },
    ["@constant.builtin"]  = t.constant,
    ["@constant.macro"]    = { link = "Macro" },
    ["@boolean"]           = { link = "Boolean" },
    ["@number"]            = { link = "Number" },
    ["@number.float"]      = { link = "Float" },
    ["@character"]         = { link = "Character" },
    ["@character.special"] = { link = "SpecialChar" },
    ["@symbol"]            = { link = "Constant" },

    -- Strings
    ["@string"]             = { link = "String" },
    ["@string.regexp"]      = { link = "Regexp" },
    ["@string.escape"]      = { link = "SpecialChar" },
    ["@string.special"]     = { link = "Special" },
    ["@string.special.url"] = { fg = c.blue, underline = true },

    -- Functions
    ["@function"]            = { link = "Function" },
    ["@function.builtin"]    = t.func,
    ["@function.call"]       = { link = "Function" },
    ["@function.macro"]      = { link = "Macro" },
    ["@function.method"]     = { link = "Function" },
    ["@function.method.call"]= { link = "Function" },
    ["@constructor"]         = t.type,

    -- Keywords
    ["@keyword"]              = { link = "Keyword" },
    ["@keyword.function"]     = { link = "Keyword" },
    ["@keyword.operator"]     = { link = "Keyword" },
    ["@keyword.return"]       = { link = "Keyword" },
    ["@keyword.conditional"]  = { link = "Conditional" },
    ["@keyword.repeat"]       = { link = "Repeat" },
    ["@keyword.import"]       = { link = "Include" },
    ["@keyword.exception"]    = { link = "Exception" },
    ["@keyword.directive"]    = { link = "PreProc" },
    ["@conditional"]          = { link = "Conditional" },
    ["@repeat"]               = { link = "Repeat" },
    ["@label"]                = { link = "Label" },
    ["@include"]              = { link = "Include" },
    ["@exception"]            = { link = "Exception" },

    -- Types
    ["@type"]            = { link = "Type" },
    ["@type.builtin"]    = { link = "Type" },
    ["@type.definition"] = { link = "Typedef" },
    ["@type.qualifier"]  = { link = "Keyword" },
    ["@storageclass"]    = { link = "StorageClass" },
    ["@attribute"]       = { link = "Macro" },
    ["@module"]          = t.type,
    ["@namespace"]       = t.type,

    -- Identifiers / variables
    ["@variable"]           = t.identifier,
    ["@variable.builtin"]   = t.constant,
    ["@variable.parameter"] = t.parameter,
    ["@variable.member"]    = t.property,
    ["@parameter"]          = t.parameter,
    ["@field"]              = t.property,
    ["@property"]           = t.property,

    -- Operators / punctuation
    ["@operator"]              = { link = "Operator" },
    ["@punctuation.delimiter"] = { link = "Delimiter" },
    ["@punctuation.bracket"]   = { fg = c.fg },
    ["@punctuation.special"]   = { link = "Special" },

    -- Preprocessor
    ["@preproc"] = { link = "PreProc" },
    ["@define"]  = { link = "Define" },
    ["@macro"]   = { link = "Macro" },

    -- Tags (HTML/JSX/XML)
    ["@tag"]               = { link = "Tag" },
    ["@tag.attribute"]     = { link = "Identifier" },
    ["@tag.delimiter"]     = { link = "Delimiter" },

    -- Markup (current names)
    ["@markup"]              = { fg = c.fg },
    ["@markup.strong"]       = { bold = true },
    ["@markup.italic"]       = { italic = true },
    ["@markup.strikethrough"]= { strikethrough = true },
    ["@markup.underline"]    = { underline = true },
    ["@markup.heading"]      = { link = "Title" },
    ["@markup.quote"]        = { link = "Comment" },
    ["@markup.math"]         = { link = "Number" },
    ["@markup.link"]         = { fg = c.blue, underline = true },
    ["@markup.link.label"]   = { link = "Identifier" },
    ["@markup.link.url"]     = { fg = c.blue, underline = true },
    ["@markup.raw"]          = { link = "Comment" },
    ["@markup.raw.block"]    = { link = "Comment" },
    ["@markup.list"]         = { link = "Keyword" },
    ["@markup.list.checked"] = { fg = c.green },
    ["@markup.list.unchecked"] = { fg = c.grey },

    -- Legacy @text.* (older Treesitter)
    ["@text"]           = { fg = c.fg },
    ["@text.strong"]    = { bold = true },
    ["@text.emphasis"]  = { italic = true },
    ["@text.underline"] = { underline = true },
    ["@text.title"]     = { link = "Title" },
    ["@text.literal"]   = { link = "Comment" },
    ["@text.uri"]       = { fg = c.blue, underline = true },
    ["@text.reference"] = { link = "Identifier" },
    ["@text.todo"]      = { link = "Todo" },
    ["@text.note"]      = { link = "Todo" },
    ["@text.warning"]   = { link = "WarningMsg" },
    ["@text.danger"]    = { link = "ErrorMsg" },
    ["@text.diff.add"]  = { link = "DiffAdd" },
    ["@text.diff.delete"] = { link = "DiffDelete" },

    -- Misc
    ["@none"]  = {},
    ["@error"] = { link = "Error" },
  }
end

return M
