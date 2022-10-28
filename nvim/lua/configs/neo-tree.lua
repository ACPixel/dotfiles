local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then return end
neotree.setup({
  close_if_last_window = true,
  enable_diagnostics = false,
  source_selector = {
    winbar = true,
    content_layout = "center",
    tab_labels = {
      filesystem = pixelvim.get_icon "FolderClosed" .. " File",
      buffers = pixelvim.get_icon "DefaultFile" .. " Bufs",
      git_status = pixelvim.get_icon "Git" .. " Git",
      diagnostics = pixelvim.get_icon "Diagnostic" .. " Diagnostic",
    },
  },
  default_component_configs = {
    indent = {
      padding = 0,
    },
    icon = {
      folder_closed = pixelvim.get_icon "FolderClosed",
      folder_open = pixelvim.get_icon "FolderOpen",
      folder_empty = pixelvim.get_icon "FolderEmpty",
      default = pixelvim.get_icon "DefaultFile",
    },
    git_status = {
      symbols = {
        added = pixelvim.get_icon "GitAdd",
        deleted = pixelvim.get_icon "GitDelete",
        modified = pixelvim.get_icon "GitChange",
        renamed = pixelvim.get_icon "GitRenamed",
        untracked = pixelvim.get_icon "GitUntracked",
        ignored = pixelvim.get_icon "GitIgnored",
        unstaged = pixelvim.get_icon "GitUnstaged",
        staged = pixelvim.get_icon "GitStaged",
        conflict = pixelvim.get_icon "GitConflict",
      },
    },
  },
  window = {
    width = 30,
    mappings = {
      ["o"] = "open",
    },
  },
  filesystem = {
    follow_current_file = true,
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
  },
  event_handlers = {
    { event = "neo_tree_buffer_enter", handler = function(_) vim.opt_local.signcolumn = "auto" end },
  },
})
