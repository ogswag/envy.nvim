-- Assemble the full highlight table for a given variant.

local palette = require("envy.palette")

local M = {}

-- variant: "envy" | "colorful"
-- opts:    the resolved options table (see config.lua)
function M.build(variant, opts)
  local c = palette.colors

  -- Per-variant transparency.
  local variant_opts = {
    transparent     = opts[variant] and opts[variant].transparent or false,
    italic_comments = opts.italic_comments,
    bold_keywords   = opts.bold_keywords,
  }

  local highlights = {}
  local function merge(tbl)
    for group, spec in pairs(tbl) do
      highlights[group] = spec
    end
  end

  merge(require("envy.groups.editor").get(c, variant_opts, variant))
  merge(require("envy.groups.syntax").get(c, variant_opts, variant))
  merge(require("envy.groups.treesitter").get(c, variant_opts, variant))
  merge(require("envy.groups.lsp").get(c, variant_opts, variant))
  merge(require("envy.groups.plugins").get(c, variant_opts, variant))

  -- User override hook.
  if type(opts.on_highlights) == "function" then
    opts.on_highlights(highlights, c)
  end

  return highlights
end

return M
