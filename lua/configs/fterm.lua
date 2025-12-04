-- lua/configs/fterm.lua

local ok, fterm = pcall(require, "FTerm")
if not ok then
  return
end

-- Basic setup, straight from the README style
fterm.setup({
  border = "double",
  dimensions = {
    height = 0.9,
    width = 0.9,
    x = 0.5,
    y = 0.5,
  },
  -- cmd = os.getenv("SHELL"), -- default, can omit
})
