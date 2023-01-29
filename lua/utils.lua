local M = {}

M.merge = function(t1, t2)
	local t = {}
	for name, value in pairs(t2) do
		t[name] = value
	end
	for name, value in pairs(t1) do
		t[name] = value
	end

	return t
end

M.map_file = function(filename, o)
	local keybinds = require('keybinds.'..filename)

	M.map(keybinds, o)
end

M.map = function(keybinds, options)
	options = M.merge(options or {}, {
		mode = 'n',
		prefix = '',
		suffix = '',
		func = vim.api.nvim_set_keymap
	})

	for lhs, rhs in pairs(keybinds) do
		local o = options
		if type(rhs) ~= 'string' then
			o = M.merge(rhs, options)
			rhs = rhs[1]
		end

    	o.func(o.mode, lhs, o.prefix..rhs..o.suffix, {  })
	end
end
M.set = function(options, scope)
	if not scope then scope = 'o' end

	for name, value in pairs(options) do
		vim[scope][name] = value
	end
end

return M
