-- Small helpers for applying highlights.

local M = {}

-- Apply a table of highlight definitions.
--
-- Each entry is either:
--   name = { fg = ..., bg = ..., bold = true, ... }   -- a spec
--   name = { link = "OtherGroup" }                    -- a link
function M.apply(highlights)
  for group, spec in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

-- Set the terminal ANSI colors from a 16-entry list (index 1..16).
function M.terminal(list)
  for i, color in ipairs(list) do
    vim.g["terminal_color_" .. (i - 1)] = color
  end
end

return M
