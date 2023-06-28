local setup = function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  require("luasnip.loaders.from_vscode").lazy_load({
    paths = {
      "./lua/joaovfsousa/snippets",
    },
  })

  vim.g.cmp_active = true

  local source_mapping = {
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    luasnip = "[Snippet]",
    buffer = "[Buffer]",
    path = "[Path]",
    copilot = "[Copilot]",
  }

  local icons = require("joaovfsousa.theme.icons")
  local kind_icons = icons.kind

  cmp.setup({
    enabled = function()
      local buftype = vim.api.nvim_buf_get_option(0, "buftype")
      if buftype == "prompt" then
        return false
      end
      return vim.g.cmp_active
    end,
    preselect = cmp.PreselectMode.None,
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        vim_item.kind = kind_icons[vim_item.kind]

        vim_item.menu = (source_mapping)[entry.source.name]
        return vim_item
      end,
    },
    experimental = {
      ghost_text = false,
    },
    mapping = cmp.mapping.preset.insert({
      ["<CR>"] = cmp.mapping.confirm({
        select = true,
        behavior = cmp.ConfirmBehavior.Replace,
      }),
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-l>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      ["<C-c>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ["<c-n>"] = cmp.mapping(function(fallback)
        if luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    }),
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" },
      { name = "path" },
      { name = "copilot" },
    }, {
      { name = "buffer" },
    }),
  })
end

return {
  setup = setup,
}
