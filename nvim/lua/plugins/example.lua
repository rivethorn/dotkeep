return {
  {
    "folke/noice.nvim",
    enabled = false,
  },
  {
    "https://git.sr.ht/~swaits/scratch.nvim",
    lazy = true,
    keys = {
      { "<leader>bs", "<cmd>Scratch<cr>", desc = "Scratch Buffer", mode = "n" },
      { "<leader>bS", "<cmd>ScratchSplit<cr>", desc = "Scratch Buffer (split)", mode = "n" },
    },
    cmd = {
      "Scratch",
      "ScratchSplit",
    },
    opts = {},
  },
  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "regex",
        "vim",
        "yaml",
        "nim",
      },
    },
  },

  {
    "eandrju/cellular-automaton.nvim",
  },

  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "Second Brain",
          path = "~/Documents/GitHub/Second-Brain/",
        },
      },

      templates = {
        folder = "temp",
      },

      note_id_func = function(title)
        -- If a title is given, use it as the file name (sanitize it for filenames)
        return title and title:gsub("[^a-zA-Z0-9%-_]", "_") or tostring(os.time())
      end,
    },
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  {
    "folke/zen-mode.nvim",
    config = function()
      vim.keymap.set("n", "<leader>zz", function()
        require("zen-mode").setup({
          window = {
            width = 90,
            options = {},
          },
        })
        require("zen-mode").toggle()
        vim.wo.wrap = false
        vim.wo.number = true
        vim.wo.rnu = true
      end)

      vim.keymap.set("n", "<leader>zZ", function()
        require("zen-mode").setup({
          window = {
            width = 80,
            options = {},
          },
        })
        require("zen-mode").toggle()
        vim.wo.wrap = false
        vim.wo.number = false
        vim.wo.rnu = false
        vim.opt.colorcolumn = "0"
      end)
    end,
  },

  {
    "OXY2DEV/markview.nvim",
    enabled = true,
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      -- lsp_keymaps = false,
      -- other options
    },
    config = function(lp, opts)
      require("go").setup(opts)
      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require("go.format").goimports()
        end,
        group = format_sync_grp,
      })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },

  {
    "benomahony/uv.nvim",
    -- Optional filetype to lazy load when you open a python file
    ft = { python },
    -- Optional dependency, but recommended:
    -- dependencies = {
    --   "folke/snacks.nvim"
    -- or
    --   "nvim-telescope/telescope.nvim"
    -- },
    opts = {
      picker_integration = true,
    },
  },

  {
    "blazkowolf/gruber-darker.nvim",
    opts = {
      bold = true,
      italic = {
        strings = false,
      },
    },
  },

  {
    "tpope/vim-commentary",
  },

  {
    "ThePrimeagen/vim-be-good",
  },

  {
    "sainnhe/gruvbox-material",
    -- lazy = false,
    -- priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = false
      vim.g.gruvbox_material_enable_bold = true
      -- vim.g.gruvbox_material_background = "hard"
      -- vim.g.gruvbox_material_foreground = "mix"
      -- vim.cmd.colorscheme("gruvbox-material")
    end,
  },

  {
    "guttenbergovitz/guttenbergovitz-theme",
    -- lazy = false,
    -- priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      require("guttenbergovitz").setup()
      vim.cmd.colorscheme("guttenbergovitz")
    end,
  },

  {
    "xiyaowong/transparent.nvim",
    lazy = false,
  },

  {
    "Redoxahmii/json-to-types.nvim",
    build = "sh install.sh npm", -- Replace `npm` with your preferred package manager (e.g., yarn, pnpm).
    ft = "json",
    keys = {
      {
        "<leader>cU",
        "<CMD>ConvertJSONtoLang go<CR>",
        desc = "Convert JSON to Go",
      },
      {
        "<leader>ct",
        "<CMD>ConvertJSONtoLangBuffer go<CR>",
        desc = "Convert JSON to Go Buffer",
      },
    },
  },

  {
    "stevedylandev/compline-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme compline")
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "compline",
    },
  },

  {
    "snacks.nvim",
    opts = {
      dashboard = {
        enabled = false,
      },
    },
  },

  {
    "MysticalDevil/inlay-hints.nvim",
    event = "LspAttach",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("inlay-hints").setup()
    end,
  },
}
