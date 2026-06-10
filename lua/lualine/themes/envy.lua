-- lualine theme for Envy.
-- Use with: require("lualine").setup({ options = { theme = "envy" } })

local p = require("envy.palette").colors

local function mode(accent)
  return {
    a = { fg = p.white, bg = accent, gui = "bold" },
    b = { fg = p.fg, bg = p.lgrey2 },
    c = { fg = p.fg, bg = p.lgrey1 },
  }
end

return {
  normal   = mode(p.blue),
  insert   = mode(p.green),
  visual   = mode(p.purple),
  replace  = mode(p.red),
  command  = mode(p.orange),
  inactive = {
    a = { fg = p.grey, bg = p.lgrey1, gui = "bold" },
    b = { fg = p.grey, bg = p.lgrey1 },
    c = { fg = p.grey, bg = p.lgrey1 },
  },
}
