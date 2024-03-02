require('lazy').setup({
  -- Git
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- nvim & tmux navigation
  { 'christoomey/vim-tmux-navigator' },

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      -- { 'j-hui/fidget.nvim', tag = 'legacy' },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',

      {
        'simrat39/inlay-hints.nvim',
        config = function()
          require('inlay-hints').setup()
        end,
      },
    },
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "theutz/neotest-pest"
    },
    config = function()
      require("neotest").setup({
        output = {
          open = function()
            vim.cmd("botright vsplit")

            return require('neotest.output').get_buffer()
          end,
        },
        adapters = {
          require('neotest-pest')({
            pest_cmd = function()
              return "vendor/bin/pest"
            end
          })
        }
      })
    end
  },

  {
    'sbdchd/neoformat',
    config = function()
      vim.api.nvim_exec([[
      augroup fmt
        autocmd!
        autocmd BufWritePre * undojoin | Neoformat
      augroup END
    ]], true)
      vim.g.neoformat_enabled_javascript = { 'eslint' }
    end,
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  { 'simrat39/rust-tools.nvim',      opts = {} },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',          opts = {} },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- Catppuccin
  --
  -- {
  --   'catppuccin/nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('catppuccin').setup({
  --       colorsheme = 'mocha'
  --     })
  --     -- vim.cmd.colorscheme 'catppuccin'
  --   end
  -- },

  -- Night Owl
  {
    'oxfist/night-owl.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("night-owl")
    end
  },

  { 'phpactor/phpactor' },

  -- {
  --   "adalessa/laravel.nvim",
  --   dependencies = {
  --     "nvim-telescope/telescope.nvim",
  --     "tpope/vim-dotenv",
  --     "MunifTanjim/nui.nvim",
  --   },
  --   cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
  --   keys = {
  --     { "<leader>la", ":Laravel artisan<cr>" },
  --     { "<leader>lr", ":Laravel routes<cr>" },
  --     { "<leader>lm", ":Laravel related<cr>" },
  --     {
  --       "<leader>lt",
  --       function()
  --         require("laravel.tinker").send_to_tinker()
  --       end,
  --       mode = "v",
  --       desc = "Laravel Application Routes",
  --     },
  --   },
  --   -- event = { "VeryLazy" },
  --   config = function()
  --     require("laravel").setup()
  --     require("telescope").load_extension "laravel"
  --   end,
  -- },

  -- {
  --   'Alexis12119/nightly.nvim',
  --   config = function()
  --     require('nightly').setup({
  --       transparent = true,
  --       styles = {
  --         comments = { italic = true },
  --         functions = { italic = false },
  --         variables = { italic = false },
  --         keywords = { italic = false },
  --       },
  --       highlights = {},
  --     })
  --
  --     vim.cmd.colorscheme('nightly')
  --   end
  -- },
  --
  {
    'arkav/lualine-lsp-progress',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'night-owl',
      }
    }
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'night-owl',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_c = {
          'lsp_progress',
        },
      },
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',         opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Harpoon
  {
    'theprimeagen/harpoon',
    config = function()
      require('harpoon').setup({
        settings = {
          save_on_toggle = true,
          save_on_change = true,
        },
        menu = {
          width = vim.api.nvim_win_get_width(0) - 4,
        },
      })
    end
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
  -- { 'christoomey/vim-tmux-navigator', opts = {} },
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ":TSUpdate",
  },

  {
    'github/copilot.vim',
    config = function()
    end
  },

  { 'lvimuser/lsp-inlayhints.nvim', opts = {} },

  {
    "nomnivore/ollama.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
    keys = {
      -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
      {
        "<leader>oo",
        ":<c-u>lua require('ollama').prompt()<cr>",
        desc = "ollama prompt",
        mode = { "n", "v" },
      },

      -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
      {
        "<leader>oG",
        ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
        desc = "ollama Generate Code",
        mode = { "n", "v" },
      },
    },

    opts = {
      model = "mistral",
    },
  },

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  --
  --    An additional note is that if you only copied in the `init.lua`, you can just comment this line
  --    to get rid of the warning telling you that there are not plugins in `lua/custom/plugins/`.
  -- { import = 'custom.plugins' },
}, {})

return {}
