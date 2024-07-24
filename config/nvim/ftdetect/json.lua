vim.filetype.add({
  filename = {
    [".swcrc"] = "jsonc",
    [".swcrc.build"] = "jsonc",
    [".eslintrc"] = "jsonc",
    [".eslintrc.json"] = "jsonc",
  },
  pattern = {
    ["[jt]sconfig%.json"] = "jsonc",
  },
})
