return { 
    "m4xshen/autoclose.nvim",
    enabled = true,
    config = function()
        require("autoclose").setup({
            options = {
                disabled_filetypes = {
                    "text",
                    "markdown"
                }
            }
        })
    end
}
