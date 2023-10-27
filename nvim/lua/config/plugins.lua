-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
	    "clone",
	    "--filter=blob:none",
	    "https://github.com/folke/lazy.nvim.git",
	    "--branch=stable", -- latest stable release
	    lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup({
    spec = {
	    { import = "plugins" },
    },
    defaults = {
        lazy    = false,
	    version = false,
    },
    install = {
        missing = true,
        colorscheme = {
            "catppuccin",
	        "tokyonight",
	        "habamax"
	    }
    },
    checker = {
        enabled = true,
        concurrency = nil, -- @type number  set to 1 to check for updates very slowly
        notify = false, -- get a notification when new updates are found
    },
    performance = {
        cache = {
            enabled = true,
        },
        rtp = {
	        disabled_plugins = {},
	    },
    },
})
