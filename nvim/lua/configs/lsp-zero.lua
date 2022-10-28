local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
    return
end

lsp.preset('lsp-compe')

lsp.setup()
local notification
local started = {}

lsp.on_attach(function(client, bufnr)
    table.insert(started, client.name)

    if not notification then
        notification = vim.notify("Started:\n" .. table.concat(started, ", "), vim.log.levels.INFO, {
            title = 'LSP started',
            timeout = 3000
        })
    else
        notification = vim.notify("Started:\n" .. table.concat(started, ", "), vim.log.levels.INFO, {
            title = 'LSP started',
            replace = notification,
            timeout = 3000,
            on_close = function()
                notification = nil
                started = {}
            end
        })
    end
end)
