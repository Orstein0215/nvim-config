require("notify").history()
local async = require("plenary.async")
local notify = require("notify").async

async.run(function()
  notify("Comming Soon!").events.close()
  notify("It closed!")
end)
local plugin = "My Awesome Plugin"

vim.notify("This is an error message.\nSomething went wrong!", "error", {
  title = plugin,
  on_open = function()
    vim.notify("Attempting recovery.", vim.log.levels.WARN, {
      title = plugin,
    })
    local timer = vim.loop.new_timer()
    timer:start(500, 0, function()
      vim.notify({ "Fixing problem.", "Please wait..." }, "info", {
        title = plugin,
        timeout = 1000,
        on_close = function()
          vim.notify("Problem solved", nil, { title = plugin })
          vim.notify("Error code 0x0395AF", 1, { title = plugin })
        end,
      })
    end)
  end,
})
