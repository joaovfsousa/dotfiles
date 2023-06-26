local jester = require("jester")

return {
  name = "Jester",
  r = {
    jester.run,
    "Run nearest",
  },
  f = {
    jester.run_file,
    "Run file",
  },
  R = {
    jester.debug,
    "Debug nearest",
  },
  F = {
    jester.debug_file,
    "Debug file",
  },
  l = {
    jester.run_last,
    "Run last",
  },
  L = {
    jester.debug_last,
    "Debug last",
  },
}
