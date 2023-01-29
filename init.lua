local modules = {
	"plugins",
	"keybinds",
	"settings"
}
local utils = require('utils')
utils.set(require('settings'))

for _, module in ipairs(modules) do
	require(module)
end
