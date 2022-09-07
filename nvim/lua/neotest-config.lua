require("neotest").setup({
  adapters = {
    require("neotest-jest")({
      jestCommand = "yarn test --",
      jestConfigFile = "jest.config.js",
    }),
    require("neotest-rspec"),
    require("neotest-vim-test")({
      ignore_file_types = {
        "ruby",
        "typescript",
        "typescriptreact",
        "javascript",
        "javascriptreact",
        "lua",
      },
    }),
  },
  icons = {
    child_indent = "│",
    child_prefix = "├",
    collapsed = "─",
    expanded = "╮",
    failed = "",
    final_child_indent = " ",
    final_child_prefix = "╰",
    non_collapsible = "─",
    passed = "",
    running = "",
    skipped = "",
    unknown = "",
  },
})
