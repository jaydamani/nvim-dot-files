local cmp = require 'cmp'

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

return {
	['<C-k>'] = cmp.mapping.scroll_docs(-4),
	['<C-j>'] = cmp.mapping.scroll_docs(4),
	['<CR>'] = cmp.mapping.confirm(),
	['<C-e>'] = cmp.mapping.abort(),
	["<Tab>"] = function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif vim.fn["vsnip#available"](1) == 1 then
			feedkey("<Plug>(vsnip-expand-or-jump)", "")
		elseif has_words_before() then
			cmp.complete()
		else
			fallback()
		end
	end,

	["<S-Tab>"] = function()
		if cmp.visible() then
			cmp.select_prev_item()
		elseif vim.fn["vsnip#jumpable"](-1) == 1 then
			feedkey("<Plug>(vsnip-jump-prev)", "")
		end
	end
}
