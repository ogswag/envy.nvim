-- Envy palette
--
-- Raw colors ported verbatim from envy.colortemplate. No new colors are
-- invented for envy-colorful; it only assigns these existing hues to more
-- syntax groups than the minimal envy variant.

local M = {}

M.colors = {
  bg      = "#eeeeee", -- background
  fg      = "#000000", -- black / foreground
  black   = "#000000",
  brblack = "#585858", -- muted foreground (properties/params in colorful)
  blue    = "#005fd7",
  lblue   = "#afd7ff", -- visual / search / matchparen bg
  green   = "#005f00",
  red     = "#d70000",
  lred    = "#ffafaf", -- error bg
  orange  = "#d75f00", -- "yellow" in the original (regexp / warnings)
  lyellow = "#ffd787", -- warning bg
  purple  = "#5f00d7",
  pink    = "#ffafff",
  cyan    = "#0087af",
  lcyan   = "#afd7af", -- hint bg
  white   = "#ffffff",
  grey    = "#6c6c6c", -- comments
  lgrey1  = "#e4e4e4", -- cursorline / colorcolumn / folds
  lgrey2  = "#c6c6c6", -- nontext / tabline / statuslinenc
  lgrey3  = "#b2b2b2", -- statusline bg
}

-- Terminal ANSI colors (the original 16-color list from envy.vim).
M.terminal = {
  M.colors.black,   -- 0
  M.colors.red,     -- 1
  M.colors.green,   -- 2
  M.colors.orange,  -- 3
  M.colors.blue,    -- 4
  M.colors.purple,  -- 5
  M.colors.cyan,    -- 6
  M.colors.lgrey3,  -- 7
  M.colors.brblack, -- 8
  M.colors.red,     -- 9
  M.colors.green,   -- 10
  M.colors.orange,  -- 11
  M.colors.blue,    -- 12
  M.colors.purple,  -- 13
  M.colors.cyan,    -- 14
  M.colors.lgrey3,  -- 15
}

return M
