local flow = require "flow"
flow.setup_options {
  transparent = true, -- Set transparent background.
  fluo_color = "pink", -- Fluo color: pink, yellow, orange, or green.
  mode = "normal", -- Intensity of the palette: normal, dark, or bright. Note that 'dark' may not appear visually appealing.
  aggressive_spell = false, -- Disable display colors for spell check.
}
