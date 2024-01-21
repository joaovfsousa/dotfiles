local lspconfig = require("lspconfig")

local my_arduino_fqbn = {
  ["/Users/joaovfsousa/Projects/nymeria/esp32"] = "esp32:esp32:nodemcu-32s",
}

local DEFAULT_FQBN = "esp32:esp32:nodemcu-32s"

lspconfig.arduino_language_server.setup({
  on_new_config = function(config, root_dir)
    local fqbn = my_arduino_fqbn[root_dir]
    if not fqbn then
      vim.notify(
        ("Could not find which FQBN to use in %q. Defaulting to %q."):format(
          root_dir,
          DEFAULT_FQBN
        )
      )
      fqbn = DEFAULT_FQBN
    end
    config.cmd = {
      "arduino-language-server",
      "-fqbn",
      fqbn,
    }
  end,
})
