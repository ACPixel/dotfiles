local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
  return
end

bufferline.setup{
  options = {
    offsets = {{filetype = "neo-tree", text = "File Explorer", padding = 1}},
    style = "slant",
    numbers = function(opts)
      if vim.api.nvim_get_current_buf() == opts.id then return "" end
      return opts.ordinal
    end,
  }
}