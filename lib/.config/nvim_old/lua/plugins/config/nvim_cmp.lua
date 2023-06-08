local lspkind = require('lspkind')

local source_mapping = {
	buffer = "[BUF]",
	nvim_lsp = "[LS]",
	nvim_lua = "[LUA]",
	cmp_tabnine = "[T9]",
	path = "[~]",
}

require'cmp'.setup {
	sources = {
		{ name = 'cmp_tabnine' },
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			if entry.source.name == 'cmp_tabnine' then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = entry.completion_item.data.detail .. ' ' .. menu
				end
				vim_item.kind = ''
			end
			vim_item.menu = menu
			return vim_item
		end
	},
}
