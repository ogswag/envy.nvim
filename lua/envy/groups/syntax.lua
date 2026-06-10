-- Syntax highlights (legacy regex groups) + the per-variant token map.
--
-- The `tokens` table is the single place where envy (minimal) and
-- envy-colorful (moderate) diverge. Treesitter and LSP groups reuse it via
-- M.tokens(...) so legacy and modern highlighting always agree.

local M = {}

-- Resolve the per-variant spec for each semantic token category.
function M.tokens(c, opts, variant)
	local colorful = variant == "colorful"
	return {
		keyword = colorful and { fg = c.purple, bold = opts.bold_keywords }
			or { fg = c.fg, bold = opts.bold_keywords },
		func = colorful and { fg = c.blue } or { fg = c.fg },
		type = colorful and { fg = c.cyan } or { fg = c.fg },
		constant = colorful and { fg = c.red } or { fg = c.fg },
		string = { fg = c.green },
		number = { fg = c.blue },
		property = colorful and { fg = c.brblack } or { fg = c.fg },
		parameter = colorful and { fg = c.brblack } or { fg = c.fg },
		operator = { fg = c.fg },
		identifier = { fg = c.fg },
		special = { fg = c.fg },
		comment = { fg = c.grey, italic = opts.italic_comments },
		macro = { fg = c.purple },
		regexp = { fg = c.orange },
	}
end

function M.get(c, opts, variant)
	local t = M.tokens(c, opts, variant)

	local hl = {
		-- Generic syntax (ported from envy.vim, now variant-aware)
		Comment = t.comment,
		Constant = t.constant,
		String = t.string,
		Character = { link = "String" },
		Number = t.number,
		Float = { link = "Number" },
		Boolean = t.constant,
		Identifier = t.identifier,
		Function = t.func,
		Statement = t.keyword,
		Conditional = t.keyword,
		Repeat = t.keyword,
		Label = t.special,
		Operator = t.operator,
		Keyword = t.keyword,
		Exception = t.keyword,
		PreProc = t.identifier,
		Include = { link = "Keyword" },
		Define = t.macro,
		Macro = t.macro,
		PreCondit = t.macro,
		Type = t.type,
		StorageClass = { link = "Keyword" },
		Structure = t.type,
		Typedef = t.type,
		Special = t.special,
		SpecialChar = t.special,
		Tag = t.special,
		Delimiter = t.operator,
		SpecialComment = t.comment,
		Debug = t.special,
		Underlined = { fg = c.blue, underline = true },
		Ignore = { fg = c.lgrey2 },
		Todo = { fg = c.cyan, bold = true },
		Regexp = t.regexp,

		-- Language-specific links (ported from envy.vim so filetypes without a
		-- Treesitter parser still look right).
		-- CSS / SASS
		cssClassName = { link = "Keyword" },
		cssColor = { link = "Number" },
		cssIdentifier = { link = "Keyword" },
		cssImportant = { link = "Keyword" },
		cssProp = { link = "Identifier" },
		cssTagName = { link = "Keyword" },
		sassClass = { link = "cssClassName" },
		sassId = { link = "cssIdentifier" },

		-- HTML / HAML
		htmlArg = { link = "Identifier" },
		htmlTag = { fg = c.fg, bold = true },
		htmlLink = { link = "String" },
		htmlScriptTag = { link = "htmlTag" },
		htmlSpecialTagName = { link = "htmlTag" },
		htmlTagName = { link = "htmlTag" },
		hamlClass = { fg = c.fg },
		hamlId = { fg = c.fg },
		hamlTag = { fg = c.fg, bold = true },
		hamlDocType = { link = "Comment" },

		-- JavaScript / TypeScript
		JavaScriptNumber = { link = "Number" },
		javaScriptBraces = { link = "Operator" },
		javaScriptFunction = { link = "Keyword" },
		javaScriptIdentifier = { link = "Keyword" },
		javaScriptMember = { link = "Identifier" },
		typescriptBraces = { link = "Operator" },
		typescriptEndColons = { link = "Operator" },
		typescriptExceptions = { link = "Keyword" },
		typescriptFuncKeyword = { link = "Keyword" },
		typescriptFunction = { link = "Function" },
		typescriptIdentifier = { link = "Identifier" },
		typescriptLogicSymbols = { link = "Operator" },

		-- JSON
		jsonKeyword = { link = "String" },

		-- Java
		javaAnnotation = { link = "Directory" },
		javaDocParam = { link = "Todo" },
		javaDocTags = { link = "Todo" },
		javaExternal = { link = "Keyword" },
		javaStorageClass = { link = "Keyword" },

		-- Ruby
		rubyAttribute = { link = "Identifier" },
		rubyClass = { link = "Keyword" },
		rubyConstant = { link = "Constant" },
		rubyDefine = { link = "Keyword" },
		rubyFunction = { link = "Function" },
		rubyInstanceVariable = { link = "Directory" },
		rubyMacro = { link = "Identifier" },
		rubyModule = { link = "rubyClass" },
		rubyRegexp = { link = "Regexp" },
		rubyRegexpCharClass = { link = "Regexp" },
		rubyRegexpDelimiter = { link = "Regexp" },
		rubyRegexpQuantifier = { link = "Regexp" },
		rubyRegexpSpecial = { link = "Regexp" },
		rubyStringDelimiter = { link = "String" },
		rubySymbol = { link = "Regexp" },

		-- Rust
		rustCommentBlockDoc = { link = "Comment" },
		rustCommentLineDoc = { link = "Comment" },
		rustFuncCall = { link = "Identifier" },
		rustModPath = { link = "Identifier" },

		-- Python / Perl / Shell / SQL / Make / Dot
		pythonOperator = { link = "Keyword" },
		perlPackageDecl = { link = "Identifier" },
		perlStatementInclude = { link = "Statement" },
		perlStatementPackage = { link = "Statement" },
		podCmdText = { link = "Todo" },
		podCommand = { link = "Comment" },
		podVerbatimLine = { link = "Todo" },
		shFunctionKey = { link = "Keyword" },
		sqlKeyword = { link = "Keyword" },
		makeTarget = { link = "Function" },
		dotKeyChar = { link = "Operator" },

		-- Markdown
		markdownCode = { link = "Comment" },
		markdownCodeBlock = { link = "Comment" },
		markdownListMarker = { link = "Keyword" },
		markdownOrderedListMarker = { link = "Keyword" },

		-- Vimscript
		VimCommentTitle = { link = "Todo" },
		VimIsCommand = { link = "Constant" },
		vimGroup = { link = "Constant" },
		vimHiGroup = { link = "Constant" },

		-- XML / YAML
		xmlAttrib = { link = "Identifier" },
		xmlTag = { link = "Identifier" },
		xmlTagName = { link = "Identifier" },
		yamlPlainScalar = { link = "String" },

		-- netrw
		netrwClassify = { link = "Identifier" },
	}

	return hl
end

return M
