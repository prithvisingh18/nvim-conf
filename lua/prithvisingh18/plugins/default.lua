return {
    {
    	"nvim-neo-tree/neo-tree.nvim",
    	branch = "v3.x",
    	dependencies = {
    	  "nvim-lua/plenary.nvim",
    	  "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    	  "MunifTanjim/nui.nvim",
    	  -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    	}
    },
    {
    	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
	  "folke/tokyonight.nvim",
	  lazy = false,
	  priority = 1000,
	  opts = { style = "night" },
    },
    {
	    'nvim-treesitter/nvim-treesitter',
    },
    {
	    'sbdchd/neoformat'
    }

}
