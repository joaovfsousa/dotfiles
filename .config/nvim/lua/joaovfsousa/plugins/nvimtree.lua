local icons = require("joaovfsousa.theme.icons")
local nvimtree = require("nvim-tree")

local setup = function()
  local on_attach = function(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
      return {
        desc = "nvim-tree: " .. desc,
        buffer = bufnr,
        noremap = true,
        silent = true,
        nowait = true,
      }
    end

    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
    vim.keymap.set(
      "n",
      "h",
      api.node.navigate.parent_close,
      opts("Close Directory")
    )
    vim.keymap.set("n", "v", api.node.open.vertical, opts("Open split"))
  end

  local cfg = {
    on_attach = on_attach,
    renderer = {
      special_files = {
        "cargo.toml",
        "makefile",
        "readme.md",
        "readme.md",
        "yarn.lock",
        "package.json",
        "package-lock.json",
        "requirements.txt",
      },
      symlink_destination = true,
      icons = {
        webdev_colors = true,
        git_placement = "before",
        padding = " ",
        symlink_arrow = " ➛ ",
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
        glyphs = {
          default = icons.ui.Text,
          symlink = icons.ui.FileSymlink,
          bookmark = icons.ui.BookMark,
          folder = {
            arrow_closed = icons.ui.TriangleShortArrowRight,
            arrow_open = icons.ui.TriangleShortArrowDown,
            default = icons.ui.Folder,
            open = icons.ui.FolderOpen,
            empty = icons.ui.EmptyFolder,
            empty_open = icons.ui.EmptyFolderOpen,
            symlink = icons.ui.FolderSymlink,
            symlink_open = icons.ui.FolderOpen,
          },
          git = {
            unstaged = icons.git.FileUnstaged,
            staged = icons.git.FileStaged,
            unmerged = icons.git.FileUnmerged,
            renamed = icons.git.FileRenamed,
            untracked = icons.git.FileUntracked,
            deleted = icons.git.FileDeleted,
            ignored = icons.git.FileIgnored,
          },
        },
      },
    },
  }

  nvimtree.setup(cfg)
end

return {
  setup = setup,
}
