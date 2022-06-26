require("nvim-tree").setup({
  -- each of these are documented in `:help nvim-tree.OPTION_NAME`
  -- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`).
  create_in_closed_folder = true,
  respect_buf_cwd = true,
})
