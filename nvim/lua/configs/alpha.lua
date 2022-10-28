local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end
local alpha_button = pixelvim.alpha_button

alpha.setup({
    layout = {{
        type = "padding",
        val = vim.fn.max {2, vim.fn.floor(vim.fn.winheight(0) * 0.2)}
    }, {
        type = "text",
        val = {" █████  ███████ ████████ ██████   ██████",
               "██   ██ ██         ██    ██   ██ ██    ██",
               "███████ ███████    ██    ██████  ██    ██",
               "██   ██      ██    ██    ██   ██ ██    ██",
               "██   ██ ███████    ██    ██   ██  ██████", " ",
               "    ███    ██ ██    ██ ██ ███    ███",
               "    ████   ██ ██    ██ ██ ████  ████",
               "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
               "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
               "    ██   ████   ████   ██ ██      ██"},
        opts = {
            position = "center",
            hl = "DashboardHeader"
        }
    }, {
        type = "padding",
        val = 5
    }, {
        type = "group",
        val = {alpha_button("LDR f f", "  Find File  "), alpha_button("LDR s a", "  Recents  "),
               alpha_button("LDR s l", "  Last Session  ")},
        opts = {
            spacing = 1
        }
    }},
    opts = {}
})
