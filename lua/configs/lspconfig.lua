local lspconfig = require "lspconfig"
local server ={"lua_ls", "pyright","jdtls"}
require('lspconfig').lua_ls.setup({})
require('lspconfig').pyright.setup({})
require('lspconfig').jdtls.setup({})
