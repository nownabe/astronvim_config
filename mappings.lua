local utils = require "astronvim.utils"
local get_icon = utils.get_icon

return {
  n = {
    -- Disable AstroNvim's default keymaps
    -- https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/mappings.lua
    -- https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/utils/lsp.lua
    ["<leader>w"] = false,
    ["<leader>q"] = false,
    ["<leader>h"] = false,
    ["<leader>l"] = false,
    ["<leader>c"] = false,
    ["<leader>C"] = false,
    ["<leader>bc"] = false,
    ["<leader>bC"] = false,
    ["<leader>bd"] = false,
    ["<leader>bl"] = false,
    ["<leader>ls"] = false,
    ["<leader>lS"] = false,

    -- Cursor
    ["<Leader>h"] = { "^", desc = "Move to first non-whitespace" },
    ["<Leader>l"] = { "$", desc = "Move to end of line" },
    ["<Leader>m"] = { "%", desc = "Match nearest [], (), {}" },

    -- Buffer
    ["<Leader>bB"] = {
      function()
        require("astronvim.utils.status.heirline").buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Close buffer",
    },
    ["<Leader>bc"] = { function() require("astronvim.utils.buffer").close() end,         desc = "Close buffer" },
    ["<Leader>bC"] = { function() require("astronvim.utils.buffer").close_all(true) end, desc = "Close all buffers except current" },
    ["<Leader>bh"] = { function() require("astronvim.utils.buffer").prev() end,          desc = "Previous buffer" },
    ["<Leader>bl"] = { function() require("astronvim.utils.buffer").next() end,          desc = "Next buffer" },

    -- Window (using smart-splits)
    ["<Leader>w"]        = { desc = get_icon("Window", 1, true) .. "Window" }, -- Section
    ["<Leader>wh"]       = { function() require("smart-splits").move_cursor_left() end,  desc = "Move to left split" },
    ["<Leader>wj"]       = { function() require("smart-splits").move_cursor_down() end,  desc = "Move to below split" },
    ["<Leader>wk"]       = { function() require("smart-splits").move_cursor_up() end,    desc = "Move to above split" },
    ["<Leader>wl"]       = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },
    ["<Leader>w<Up>"]    = { function() require("smart-splits").resize_up() end,         desc = "Resize split up" },
    ["<Leader>w<Down>"]  = { function() require("smart-splits").resize_down() end,       desc = "Resize split down" },
    ["<Leader>w<Left>"]  = { function() require("smart-splits").resize_left() end,       desc = "Resize split left" },
    ["<Leader>w<Right>"] = { function() require("smart-splits").resize_right() end,      desc = "Resize split right" },

    -- Telescope
    ["<Leader>fg"] = { function() require("telescope.builtin").live_grep() end, desc = "Search for a string" },
    ["<Leader>fG"] = {
      function()
        require("telescope.builtin").live_grep {
          additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
        }
      end,
      desc = "Search for a string (incl. hidden files)",
    },

    -- LSP
    ["<Leader>;"]  = { desc = get_icon("ActiveLSP", 1, true) .. "LSP" }, -- Section
    ["<Leader>;a"] = { function() vim.lsp.buf.code_action() end,                            desc = "Code action" },
    ["<Leader>;d"] = { function() require("telescope.builtin").lsp_definitions() end,       desc = "Definition of current symbol" },
    ["<Leader>;D"] = { function() vim.lsp.buf.declaration() end,                            desc = "Declaration of current symbol"},
    ["<Leader>;f"] = { function() vim.lsp.buf.format() end,                                 desc = "Format buffer" },
    ["<Leader>;h"] = { function() vim.lsp.buf.signature_help() end,                         desc = "Signature help" },
    ["<Leader>;i"] = { function() require("telescope.builtin").lsp_implementations() end,   desc = "Implementation of current symbol" },
    ["<Leader>;j"] = { function() vim.lsp.buf.hover() end,                                  desc = "Hover symbol details" },
    ["<Leader>;l"] = { function() vim.lsp.codelens.refresh() end,                           desc = "LSP CodeLens refresh" },
    ["<Leader>;L"] = { function() vim.lsp.codelens.run() end,                               desc = "LSP CodeLens run" },
    ["<Leader>;n"] = { function() vim.diagnostic.open_float() end,                          desc = "Hover diagnostics" },
    ["<Leader>;N"] = { function() require("telescope.builtin").diagnostics() end,           desc = "Search diagnostics" },
    ["<Leader>;r"] = { function() require("telescope.builtin").lsp_references() end,        desc = "Search references" },
    ["<Leader>;R"] = { function() vim.lsp.buf.rename() end,                                 desc = "Rename current symbol" },
    ["<Leader>;s"] = { function() require("telescope.builtin").lsp_document_symbols() end,  desc = "Search symbols in current buffer" },
    ["<Leader>;S"] = {
      function()
        vim.ui.input({ prompt = "Symbol Query: " }, function(query)
          if query then
            require("telescope.builtin").lsp_workspace_symbols({ query = query })
          end
        end)
      end,
      desc = "Search symbols in current workspace"
    },
    ["<Leader>;t"] = { function() require("telescope.builtin").lsp_type_definitions() end,  desc = "Definition of current type" },
    ["<Leader>;?l"] = { "<cmd>LspInfo<cr>",                                                 desc = "LSP information" },
    ["<Leader>;?n"] = { "<cmd>NullLsInfo<cr>",                                              desc = "Null-ls information" },

    -- aerial.nvim
    ["<Leader>;o"] = {
      function()
        local aerial_avail, _ = pcall(require, "aerial")
        if aerial_avail then
          require("telescope").extensions.aerial.aerial()
        else
          require("telescope.builtin").lsp_document_symbols()
        end
      end,
      desc = "Search symbols",
    },
    ["<Leader>;O"] = { function() require("aerial").toggle() end, desc = "Open outline window" },
  },
  
  v = {
    ["<Leader>;"]  = { desc = get_icon("ActiveLSP", 1, true) .. "LSP" }, -- Section
    ["<Leader>;a"] = { function() vim.lsp.buf.code_action() end, desc = "Code action" },
    ["<Leader>;f"] = { function() vim.lsp.buf.format() end, desc = "Format buffer" },
  },
}
