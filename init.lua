--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below



vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


local g = vim.g
local o = vim.o
local opt = vim.opt

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

    -- Configure AstroNvim updates
    updater = {
        remote = "origin", -- remote to use
        channel = "nightly", -- "stable" or "nightly"
        version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
        branch = "main", -- branch name (NIGHTLY ONLY)
        commit = nil, -- commit hash (NIGHTLY ONLY)
        pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
        skip_prompts = false, -- skip prompts about breaking changes
        show_changelog = true, -- show the changelog after performing an update
        auto_reload = false, -- automatically reload and sync packer after a successful update
        auto_quit = false, -- automatically quit the current session after a successful update
        -- remotes = { -- easily add new remotes to track
        --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
        --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
        --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
        -- },
    },

    -- Set colorscheme to use
    colorscheme = "default_theme",

    -- Add highlight groups in any theme
    highlights = {
        -- init = { -- this table overrides highlights in all themes
        --   Normal = { bg = "#000000" },
        -- }
        -- duskfox = { -- a table of overrides/changes to the duskfox theme
        --   Normal = { bg = "#000000" },
        -- },
    },

    -- set vim options here (vim.<first_key>.<second_key> = value)
    options = {
        opt = {
            -- set to true or false etc.
            relativenumber = true, -- sets vim.opt.relativenumber
            number = true, -- sets vim.opt.number
            spell = false, -- sets vim.opt.spell
            signcolumn = "auto", -- sets vim.opt.signcolumn to auto
            wrap = false, -- sets vim.opt.wrap
        },
        g = {
            mapleader = " ", -- sets vim.g.mapleader
            autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
            cmp_enabled = true, -- enable completion at start
            autopairs_enabled = true, -- enable autopairs at start
            diagnostics_enabled = true, -- enable diagnostics at start
            status_diagnostics_enabled = true, -- enable diagnostics in statusline
            icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
            ui_notifications_enabled = true, -- disable notifications when toggling UI elements
        },
    },
    -- If you need more control, you can use the function()...end notation
    -- options = function(local_vim)
    --   local_vim.opt.relativenumber = true
    --   local_vim.g.mapleader = " "
    --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
    --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
    --
    --   return local_vim
    -- end,

    -- Set dashboard header
    header = {
        " ???????????????  ????????????????????? ???????????????????????? ??????????????????   ??????????????????",
        "??????   ?????? ??????         ??????    ??????   ?????? ??????    ??????",
        "????????????????????? ?????????????????????    ??????    ??????????????????  ??????    ??????",
        "??????   ??????      ??????    ??????    ??????   ?????? ??????    ??????",
        "??????   ?????? ?????????????????????    ??????    ??????   ??????  ??????????????????",
        " ",
        "    ????????????   ??????????????????   ??????????????????????????????   ?????????",
        "    ???????????????  ??????????????????   ????????????????????????????????? ????????????",
        "    ?????????????????? ??????????????????   ????????????????????????????????????????????????",
        "    ?????????????????????????????????????????? ???????????????????????????????????????????????????",
        "    ????????? ?????????????????? ????????????????????? ?????????????????? ????????? ??????",
    },

    -- Default theme configuration
    default_theme = {
        -- Modify the color palette for the default theme
        colors = {
            fg = "#abb2bf",
            bg = "#1e222a",
        },
        highlights = function(hl) -- or a function that returns a new table of colors to set
            local C = require "default_theme.colors"

            hl.Normal = { fg = C.fg, bg = C.bg }

            -- New approach instead of diagnostic_style
            hl.DiagnosticError.italic = true
            hl.DiagnosticHint.italic = true
            hl.DiagnosticInfo.italic = true
            hl.DiagnosticWarn.italic = true

            return hl
        end,
        -- enable or disable highlighting for extra plugins
        plugins = {
            aerial = true,
            beacon = false,
            bufferline = true,
            cmp = true,
            dashboard = true,
            highlighturl = true,
            hop = false,
            indent_blankline = true,
            lightspeed = false,
            ["neo-tree"] = true,
            notify = true,
            ["nvim-tree"] = false,
            ["nvim-web-devicons"] = true,
            rainbow = true,
            symbols_outline = false,
            telescope = true,
            treesitter = true,
            vimwiki = false,
            ["which-key"] = true,
        },
    },

    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
        virtual_text = true,
        underline = true,
    },

    -- Extend LSP configuration
    lsp = {
        -- enable servers that you already have installed without mason
        servers = {
            -- "pyright"
        },
        formatting = {
            -- control auto formatting on save
            format_on_save = {
                enabled = true, -- enable or disable format on save globally
                allow_filetypes = { -- enable format on save for specified filetypes only
                    -- "go",
                },
                ignore_filetypes = { -- disable format on save for specified filetypes
                    -- "python",
                },
            },
            disabled = { -- disable formatting capabilities for the listed language servers
                -- "sumneko_lua",
            },
            timeout_ms = 1000, -- default format timeout
            -- filter = function(client) -- fully override the default formatting function
            --   return true
            -- end
        },
        -- easily add or disable built in mappings added during LSP attaching
        mappings = {
            n = {
                -- ["<leader>lf"] = false -- disable formatting keymap
            },
        },
        -- add to the global LSP on_attach function
        -- on_attach = function(client, bufnr)
        -- end,

        -- override the mason server-registration function
        -- server_registration = function(server, opts)
        --   require("lspconfig")[server].setup(opts)
        -- end,

        -- Add overrides for LSP server settings, the keys are the name of the server
        ["server-settings"] = {
            -- example for addings schemas to yamlls
            -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
            --   settings = {
            --     yaml = {
            --       schemas = {
            --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
            --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
            --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
            --       },
            --     },
            --   },
            -- },
        },
    },

    -- Mapping data with "desc" stored directly by vim.keymap.set().
    --
    -- Please use this mappings table to set keyboard mapping since this is the
    -- lower level configuration and more robust one. (which-key will
    -- automatically pick-up stored data by this setting.)
    mappings = {
        -- first key is the mode
        n = {
            -- second key is the lefthand side of the map
            -- mappings seen under group name "Buffer"
            -- ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
            -- ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
            -- ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
            -- ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },

            -- clear highlight for founded results
            [",<space>"] = { "<cmd>nohlsearch<cr>", desc = "Clear Founded" },

            -- commend on ctrl + /
            ["<C-/>"] = { "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", desc = "Comment Line" },

            -- debugging
            ["<leader>d"] = false,
            -- ["<leader>dr"] = { "<cmd>lua require'dap'.run_last()<cr>", desc = "Debug: Run" },
            ["<leader>drd"] = { "<cmd>lua require'dap'.run(DjangoConf)<cr>", desc = "Debug: Run Django conf" },
            ["<leader>drf"] = { "<cmd>lua require'dap'.run(LaunchFileConf)<cr>", desc = "Debug: Run file conf" },
            ["<leader>dra"] = { "<cmd>lua require'dap'.run(LaunchAppConf)<cr>", desc = "Debug: Run main file from poetry" },
            ["<leader>drl"] = { "<cmd>lua require'dap'.run_last()<cr>", desc = "Debug: Run last session" },

            ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", desc = "Debug: Continue" },

            ["<leader>dt"] = { "<cmd>lua require'dap'.terminate()<cr>", desc = "Debug: Terminate" },

            ["<leader>dso"] = { "<cmd>lua require'dap'.step_out()<cr>", desc = "Debug: Step Out" },
            ["<leader>dsi"] = { "<cmd>lua require'dap'.step_into()<cr>", desc = "Debug: Step Into" },

            ["<leader>dro"] = { "<cmd>lua require('dapui').open()<cr>", desc = "Debug: Open debug terminal" },
            ["<leader>drc"] = { "<cmd>lua require('dapui').close()<cr>", desc = "Debug: Close debug terminal" },
            ["<leader>drt"] = { "<cmd>lua require('dapui').toggle()<cr>", desc = "Debug: Toggle debug terminal" },

            ["<leader>dbc"] = { "<cmd>lua require'dap'.clear_breakpoints()<cr>", desc = "Debug: Clear all breakpoints" },
            ["<leader>dbt"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
                desc = "Debug: Toggle Breakpoint" },

            -- quick save
            ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
            ["<leader>ss"] = { ":w!<cr>", desc = "Save File" },
        },
        t = {
            -- setting a mapping to false will disable it
            -- ["<esc>"] = false,
        },
    },

    -- Configure plugins
    plugins = {
        init = {
            -- You can disable default plugins as follows:
            -- ["goolord/alpha-nvim"] = { disable = true },
            -- "nvim-tree/nvim-tree.lua",
                "Koihik/LuaFormatter",              -- for better work with configs
                "mfussenegger/nvim-dap",            -- debugger plugin
                "hesselbom/vim-hsftp",              -- sftp plugin
                "Shougo/deoplete.nvim",             -- good autocomplete 
                "deoplete-plugins/deoplete-jedi",   -- good autocomplete for python
                "mattn/emmet-vim",                  -- for html and css work
                "rcarriga/nvim-dap-ui",

            -- You can also add new plugins here as well: Add plugins, the packer syntax without the "use"
            -- { "andweeb/presence.nvim" },
            -- {
            --   "ray-x/lsp_signature.nvim",
            --   event = "BufRead",
            --   config = function()
            --     require("lsp_signature").setup()
            --   end,
            -- },

            -- We also support a key value style plugin definition similar to NvChad:
            -- ["ray-x/lsp_signature.nvim"] = {
            --   event = "BufRead",
            --   config = function()
            --     require("lsp_signature").setup()
            --   end,
            -- },
        },
        -- All other entries override the require("<key>").setup({...}) call for default plugins
        ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
            -- config variable is the default configuration table for the setup function call
            -- local null_ls = require "null-ls"

            -- Check supported formatters and linters
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
            config.sources = {
                -- Set a formatter
                -- null_ls.builtins.formatting.stylua,
                -- null_ls.builtins.formatting.prettier,
            }
            return config -- return final config table
        end,
        treesitter = { -- overrides `require("treesitter").setup(...)`
            -- ensure_installed = { "lua" },
        },
        -- use mason-lspconfig to configure LSP installations
        ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
            -- ensure_installed = { "sumneko_lua" },
        },
        -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
        ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
            -- ensure_installed = { "prettier", "stylua" },
        },
    },

    -- LuaSnip Options
    luasnip = {
        -- Extend filetypes
        filetype_extend = {
            -- javascript = { "javascriptreact" },
        },
        -- Configure luasnip loaders (vscode, lua, and/or snipmate)
        vscode = {
            -- Add paths for including more VS Code style snippets in luasnip
            paths = {},
        },
    },

    -- CMP Source Priorities
    -- modify here the priorities of default cmp sources
    -- higher value == higher priority
    -- The value can also be set to a boolean for disabling default sources:
    -- false == disabled
    -- true == 1000
    cmp = {
        source_priority = {
            nvim_lsp = 1000,
            luasnip = 750,
            buffer = 500,
            path = 250,
        },
    },

    -- Modify which-key registration (Use this with mappings table in the above.)
    ["which-key"] = {
        -- Add bindings which show up as group name
        register = {
            -- first key is the mode, n == normal mode
            n = {
                -- second key is the prefix, <leader> prefixes
                ["<leader>"] = {
                    -- third key is the key to bring up next level and its displayed
                    -- group name in which-key top level menu
                    ["b"] = { name = "Buffer" },
                    ["d"] = { 
                            ["s"] = { name = "+Step" },  
                            ["r"] = { name = "+Run" },  
                            ["b"] = { name = "+Breakpoints" },  
                            name = "Debug options" 
                    },
                },
            },
        },
    },

    -- This function is run last and is a good place to configuring
    -- augroups/autocommands and custom filetypes also this just pure lua so
    -- anything that doesn't fit in the normal config locations above can go here
    polish = function()
        -- Set up custom filetypes
        -- vim.filetype.add {
        --   extension = {
        --     foo = "fooscript",
        --   },
        --   filename = {
        --     ["Foofile"] = "fooscript",
        --   },
        --   pattern = {
        --     ["~/%.config/foo/.*"] = "fooscript",
        --   },
        -- }
    end,
}


--------------------------------------------------
--
--
--      Setup the debugger
--
--
--------------------------------------------------


vim.fn.sign_define('DapBreakpoint', {text='????', texthl='', linehl='', numhl=''})
path_to_python_from_venv = "/venv/bin/python"

-- For sing file
LaunchFileConf = {
        -- The first three options are required by nvim-dap
        type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch';
        name = "Launch file";

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}"; -- This configuration will launch the current file if used.
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. path_to_python_from_venv) == 1 then
                return cwd .. path_to_python_from_venv
            else
                return '/usr/bin/python'
            end
        end;
}

LaunchAppConf = {
        -- The first three options are required by nvim-dap
        type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch';
        name = "Launch app";

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "main.py"; -- This configuration will launch the current file if used.
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. path_to_python_from_venv) == 1 then
                return cwd .. path_to_python_from_venv
            else
                return '/usr/bin/python'
            end
        end;
}


-- For django
DjangoConf = {
  type = 'python',
  request = 'launch',
  name = 'Django',
  program = vim.fn.getcwd() .. '/manage.py',  -- NOTE: Adapt path to manage.py as needed
  args = {'runserver', '--noreload'},
}


local dap = require('dap')
dap.adapters.python = {
    type = 'executable';
    -- command = os.getenv("VIRTUAL_ENV") .. "/bin/python"; -- before start nvim must be in need environment
    command = vim.fn.getcwd() .. "/venv/bin/python"; -- before start nvim must be in need environment
    args = { '-m', 'debugpy.adapter' };
}
-- dap.defaults.fallback.terminal_win_cmd = '10vsplit new'

dap.configurations.python = {
        LaunchFileConf,
}
table.insert(dap.configurations.python, DjangoConf)
-- table.insert(dap.configurations.python, LaunchAppConf)

--------------------------------------------------
--
--
--      Setup the emmet
--
--
--------------------------------------------------

vim.g.user_emmet_install_global = 0                     -- off for all files
vim.g.user_emmet_expandabbr_key = '<C-,>'               -- emmet action of expand on ctrl + ,
vim.g.user_emmet_balancetaginward_key = '<C-y>d'        -- all tag from inner text (required cursor on letter)
vim.g.user_emmet_balancetagoutward_key = '<C-y>D'       -- all inner tag from outer tag

vim.api.nvim_create_autocmd("FileType", {
    pattern = { 'html', 'css', 'htmldjango', 'jinja', 'jinja.html'},            -- make available in css and html and jinja html
    command = "EmmetInstall"
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { 'dap-repl', },           
    command = "lua require('dap.ext.autocompl').attach()"
})

--------------------------------------------------
--
--
--      Setup the debug ui
--
--
--------------------------------------------------


require("dapui").setup({
  icons = { expanded = "v", collapsed = ">", current_frame = "???" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = false,
    -- Display controls in this element
    },})
    --
--------------------------------------------------
--
--
--      Setup the neo-tree
--
--
--------------------------------------------------


require("neo-tree").setup({
     window = {
       mappings = {
         ["O"] = "open <cfile>"              -- mapping for open file from neo tree in system
       }
     },
     -- filesystem = {
     --   window = {
     --     mappings = {
     --       ["A"] = "command_b"
     --     }
     --   }
     -- }
   })


return config
-- EOF
-- after this line must be NOTHING


