-- plugin: presence
return {
    "andweeb/presence.nvim",
    config = function()
        require("presence").setup()
    end
}
