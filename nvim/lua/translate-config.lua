vim.g.deepl_api_auth_key = os.getenv("DEEPL_API_AUTH_KEY")
require("translate").setup({
  default = {
    command = "deepl_free",
    output = 'insert',
  },
})
