return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-cmdline" },
      { "petertriho/cmp-git" },
      { "saadparwaiz1/cmp_luasnip" },
      { "L3MON4D3/LuaSnip" },
      {
        "zbirenbaum/copilot-cmp",
      },
    },
    config = function()
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
        codeium = "[Codeium]",
        dadbod = "[Dadbod]",
      }

      local icons = require("joaovfsousa.theme.icons")
      local kind_icons = icons.kind

      cmp.setup({
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
          expandable_indicator = true,
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
            behavior = cmp.ConfirmBehavior.Insert,
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
          behavior = cmp.ConfirmBehavior.Insert,
          select = false,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          {
            name = "lazydev",
            group_index = 0, -- set group index to 0 to skip loading LuaLS completions
          },
          { name = "nvim_lua" },
          { name = "luasnip" },
          { name = "path" },
          { name = "copilot" },
          { name = "codeium" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    enabled = false,
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    enabled = false,
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "Exafunction/codeium.nvim",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    opts = { enable_chat = true },
  },
}
