-- Tweaking diagnostics
vim.diagnostic.config({
    float = { border = "single" },
    severity_sort = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    virtual_text = true,
})
-- Customizing floating windows
local border = {
      {"🭽", "FloatBorder"},
      {"▔", "FloatBorder"},
      {"🭾", "FloatBorder"},
      {"▕", "FloatBorder"},
      {"🭿", "FloatBorder"},
      {"▁", "FloatBorder"},
      {"🭼", "FloatBorder"},
      {"▏", "FloatBorder"},
}

local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Bunch of very keybindings
local on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    if client.supports_method "textDocument/hover" then
        vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<cmd>lua vim.lsp.buf.hover()<CR>", {} )
    end
    if client.supports_method "textDocument/definition" then
        vim.api.nvim_buf_set_keymap(0, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {} )
    end
    if client.supports_method "textDocument/declaration" then
        vim.api.nvim_buf_set_keymap(0, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", {} )
    end
    if client.supports_method "textDocument/reference" then
        vim.api.nvim_buf_set_keymap(0, "n", "gr", "<cmd>Trouble lsp_references<CR>", {} )
    end
    vim.api.nvim_buf_set_keymap(0, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", {} )
    vim.api.nvim_buf_set_keymap(0, "n", "cn", "<cmd>lua vim.diagnostic.goto_next()<CR>", {} )
    vim.api.nvim_buf_set_keymap(0, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", {} )
    vim.api.nvim_buf_set_keymap(0, "n", "cp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", {} )
    vim.api.nvim_buf_set_keymap(0, "n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", {} )
end



vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]


local function preview_location_callback(_, result)
  if result == nil or vim.tbl_isempty(result) then
    return nil
  end
  vim.lsp.util.preview_location(result[1])
end

function PeekDefinition()
  local params = vim.lsp.util.make_position_params()
  return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
end

local servers = { "pyright", "bashls", "clangd", "yamlls", "texlab", "jdtls"}
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup{
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
    }
end


require'lspconfig'.sumneko_lua.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                },
                diagnostics = {
                    globals = { 'vim' },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                },
            },
        }
}

require'lspconfig'.rust_analyzer.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy",
                    -- overrideCommand = {
                    --     'cargo', 'clippy', '--workspace', '--message-format=json',
                    --     '--all-targets', '--all-features'
                    -- },
                },
            }
        }
}
