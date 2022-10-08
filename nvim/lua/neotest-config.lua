require("neotest").setup({
  adapters = {
    require("neotest-jest")({
      jestCommand = "yarn test --",
      jestConfigFile = "jest.config.js",
    }),
    require("neotest-rspec"),
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
