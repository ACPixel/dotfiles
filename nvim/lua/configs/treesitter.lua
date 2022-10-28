local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

treesitter.setup {
    highlight = { -- Be sure to enable highlights if you haven't!
        enable = true
    },
    context_commentstring = {
        enable = true
    }
}
