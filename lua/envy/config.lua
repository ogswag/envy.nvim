-- Envy configuration
--
-- Holds module-level options merged from the user's setup() call. Background
-- transparency is configured *independently per variant* (envy vs colorful)
-- so each colorscheme can be transparent or opaque on its own.

local M = {}

M.defaults = {
  -- Per-variant background transparency. Set to true to make Normal and the
  -- main UI backgrounds NONE for that variant only.
  envy     = { transparent = false },
  colorful = { transparent = false },

  -- Global style options (apply to both variants).
  italic_comments = true,  -- render comments in italic
  bold_keywords   = true,  -- envy's signature bold keywords (minimal variant)
  terminal_colors = true,  -- set g:terminal_color_* from the palette

  -- Hook to override/extend highlights after the theme is built.
  -- function(highlights, colors) ... end  -- mutate `highlights` in place
  on_highlights = nil,
}

-- Active options (starts as a copy of defaults).
M.options = vim.deepcopy(M.defaults)

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", M.options, opts or {})
  return M.options
end

return M
