local actions = require("telescope.actions")
local telescope = require("telescope")

P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, "plenary") then
  RELOAD = require("plenary.reload").reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        -- IMPORTANT
        -- either hot-reloaded or `function(prompt_bufnr) telescope.extensions.hop.hop end`
        ["<C-h>"] = R("telescope").extensions.hop.hop, -- hop.hop_toggle_selection
        -- custom hop loop to multi selects and sending selected entries to quickfix list
        ["<C-space>"] = function(prompt_bufnr)
          local opts = {
            callback = actions.toggle_selection,
            loop_callback = actions.send_selected_to_qflist,
          }
          require("telescope").extensions.hop._hop_loop(prompt_bufnr, opts)
        end,
      },
    },
  },
  extensions = {
    hop = {
      -- keys define your hop keys in order; defaults to roughly lower- and uppercased home row
      keys = {
        "a",
        "s",
        "d",
        "f",
        "g",
        "q",
        "w",
        "e",
        "r",
        "t",
        "z",
        "x",
        "c",
        "v",
        "b",
        "1",
        "2",
        "3",
        "4",
        "5",
        "A",
        "S",
        "D",
        "F",
        "G",
        "Q",
        "W",
        "E",
        "R",
        "T",
        "Z",
        "X",
        "C",
        "V",
        "B",
      }, -- ... and more

      -- Highlight groups to link to signs and lines; the below configuration refers to demo
      -- sign_hl typically only defines foreground to possibly be combined with line_hl
      sign_hl = { "WarningMsg", "Title" },
      -- optional, typically a table of two highlight groups that are alternated between
      line_hl = { "CursorLine", "Normal" },
      -- options specific to `hop_loop`
      -- true temporarily disables Telescope selection highlighting
      clear_selection_hl = false,
      -- highlight hopped to entry with telescope selection highlight
      -- note: mutually exclusive with `clear_selection_hl`
      trace_entry = true,
      -- jump to entry where hoop loop was started from
      reset_selection = true,
    },
  },
})
require("telescope").load_extension("frecency")
require("telescope").load_extension("ultisnips")
require("telescope").load_extension("neoclip")
telescope.load_extension("hop")
