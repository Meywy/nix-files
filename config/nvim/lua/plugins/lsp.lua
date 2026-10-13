return {
	{
		'mason-org/mason.nvim',
		opts = {},
	},
    {
        'mason-org/mason-lspconfig.nvim',
        opts = {
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "rust_analyzer",
                "clangd"
            },
        },
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("ts_ls")
            vim.lsp.enable("rust_analyzer")
            vim.lsp.enable("clangd")
            vim.lsp.enable("denols")
            vim.lsp.enable("gopls")
        end
    },
}
