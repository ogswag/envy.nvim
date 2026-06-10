-- Envy — a light Neovim colorscheme.
--
-- Two variants:
--   envy           minimal / near-monochrome (the original look)
--   envy-colorful  moderate extra syntax color
--
-- Usage:
--   require("envy").setup({ colorful = { transparent = true } })
--   vim.cmd.colorscheme("envy")            -- or "envy-colorful"

local config = require("envy.config")
local util   = require("envy.util")
local theme  = require("envy.theme")
local palette = require("envy.palette")

local M = {}

-- Merge user options. Does not apply highlights (lazy.nvim opts/config pattern).
function M.setup(opts)
  return config.setup(opts)
end

-- Load a variant and apply its highlights.
-- variant: "envy" (default) | "colorful"
function M.load(variant)
  variant = variant or "envy"

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.background = "light"
  vim.o.termguicolors = true
  vim.g.colors_name = (variant == "colorful") and "envy-colorful" or "envy"

  local opts = config.options
  util.apply(theme.build(variant, opts))

  if opts.terminal_colors then
    util.terminal(palette.terminal)
  end
end

return M
