require("lualine").setup({
  options = {
    theme = "nightfly",
    section_separators = { "", "" },
    component_separators = { "", "" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      {
        "filename",
        file_status = true, -- displays file status (readonly status, modified status)
        path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
      },
    },
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_lsp" },
        symbols = {
          error = " ",
          warn = " ",
          info = " ",
          hint = " ",
        },
      },
      "encoding",
      "filetype",
    },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  extensions = { "fugitive" },
})
