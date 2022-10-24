local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
	options = {
		mode = "tabs",
		always_show_bufferline = false,
		diagnostics = 'nvim-lsp',
		sort_by = 'extension',
		buffer_close_icon = '',
	},
	highlights = {
		separator = {
			fg = '#073642',
			bg = '#002b36',
		},
		separator_selected = {
			fg = '#073642',
		},
		background = {
			fg = '#657b83',
			bg = '#002b36'
		},
		buffer_selected = {
			fg = '#fdf6e3',
			bold = true,
		},
		fill = {
			bg = '#073642'
		}
	},
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
vim.keymap.set('n', 'A-Left', '<Cmd>BufferLineMovePrev<CR>', {})
vim.keymap.set('n', '<A-Right>', '<Cmd>BufferLineMoveNext<CR>', {})
