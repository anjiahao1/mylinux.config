--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
-- vim.opt.listchars:append "eol:↴"
-- vim.opt.listchars:append "space:."
vim.opt.listchars:append "tab:~~"
vim.opt.list = true
vim.opt.cursorline = false
vim.opt.shell = "/bin/bash"
vim.opt.spelllang = { "en"}

lvim.transparent_window = true

-- general
lvim.log.level = "info"

lvim.format_on_save = {
    enabled = false,
    pattern = "*.lua",
    timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["L"] = "$"
lvim.keys.normal_mode["H"] = "^"
lvim.keys.normal_mode["<A-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<A-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<leader>%"] = ":vsp<CR>"
lvim.keys.normal_mode["<leader>\""] = ":sp<CR>"
lvim.keys.normal_mode["<leader>si"] = ":Telescope find_files no_ignore=true<CR>"

if vim.loop.getuid() ~= 0 then
lvim.keys.normal_mode["j"] = "<Plug>(accelerated_jk_gj)"
lvim.keys.normal_mode["k"] = "<Plug>(accelerated_jk_gk)"
end

lvim.keys.insert_mode["<A-h>"] = "<Esc>:BufferLineCyclePrev<CR>"
lvim.keys.insert_mode["<A-l>"] = "<Esc>:BufferLineCycleNext<CR>"
lvim.keys.insert_mode["jj"] = "<Esc>"

lvim.keys.visual_mode["L"] = "$"
lvim.keys.visual_mode["H"] = "0"

lvim.builtin.which_key.mappings["lr"] = {
    { "<cmd>lua require('renamer').rename()<cr>", "Rename" },
}

lvim.builtin.which_key.mappings["lg"] = {
    { "<cmd>GitBlameToggle<cr>", "Gitblame" },
}

function copy_file_and_line()
  -- 获取当前文件名
  local filename = vim.fn.expand('%:p')
  -- 获取当前光标行号
  local linenr = vim.fn.line('.')
  -- 构建文件名和行号字符串
  local result = string.format("%s:%d", filename, linenr)
  -- 将结果放入粘贴寄存器
  vim.fn.setreg('+', result)
  -- 提示用户
  print('Copied to clipboard: ' .. result)
end

lvim.keys.normal_mode["<leader>gy"] = ":lua copy_file_and_line()<CR>"

-- 创建快捷键绑定
vim.api.nvim_set_keymap('n', '<Leader>c', ':lua copy_file_and_line()<CR>', { noremap = true, silent = true })
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd", "pyright" })

local clangd_flags = {
    "--fallback-style=google",
    "--background-index",
    "-j=20",
    "--all-scopes-completion",
    "--pch-storage=disk",
    "--clang-tidy",
    "--log=error",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--header-insertion-decorators",
    "--enable-config",
    "--offset-encoding=utf-16",
    "--ranking-model=heuristics",
    "--folding-ranges",
}

local clangd_bin = "clangd"

local opts = {
    cmd = { clangd_bin, unpack(clangd_flags) },
}
-- add `pyright` to `skipped_servers` list
-- remove `jedi_language_server` from `skipped_servers` list
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
      return server ~= "pylsp"
    end, lvim.lsp.automatic_configuration.skipped_servers)

require("lvim.lsp.manager").setup("clangd", opts)

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
--
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
lvim.format_on_save = false;

local function check_file_size()
    local file_size = vim.fn.getfsize(vim.fn.expand('%'))
    if file_size > 1024*1024 then
        return false
    else
        return true
    end
end

lvim.plugins = {
    {
        "f-person/git-blame.nvim",
        event = "BufRead",
        config = function()
          vim.cmd "highlight default link gitblame SpecialComment"
          vim.cmd "GitBlameDisable"
        end,
    },
    {
        'nvim-lua/plenary.nvim'
    },
    {
        'filipdutescu/renamer.nvim',
        branch = 'master',
        config = function()
          require('renamer').setup()
        end,
    },
    {
        "rcarriga/nvim-notify",
        config = function()
          require("notify").setup({
              background_colour = "#000000",
              fps = 60,
              render = "minimal",
              timeout = 2500,
          })
        end,
    },
    {
        "MunifTanjim/nui.nvim"
    },
    {
        "folke/noice.nvim",
        config = function()
          require("noice").setup({
              lsp = {
                  -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                  override = {
                      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                      ["vim.lsp.util.stylize_markdown"] = true,
                      ["cmp.entry.get_documentation"] = true,
                  },
              },
              -- you can enable a preset for easier configuration
              presets = {
                  bottom_search = false, -- use a classic bottom cmdline for search
                  command_palette = true, -- position the cmdline and popupmenu together
                  long_message_to_split = true, -- long messages will be sent to a split
                  inc_rename = false, -- enables an input dialog for inc-rename.nvim
                  lsp_doc_border = false, -- add a border to hover docs and signature help
              },
          })
        end,
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
          require("nvim-dap-virtual-text").setup()
        end,
    },
    {
        "zbirenbaum/copilot.lua",
         enabled = check_file_size()
    },
    {
        "zbirenbaum/copilot-cmp",
        event = { "InsertEnter", "LspAttach" },
        config = function()
          vim.defer_fn(function()
            require("copilot").setup() -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
            require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
          end, 0)
        end,
        enabled = check_file_size()
    },
    {
        "ggandor/leap.nvim",
        name = "leap",
        config = function()
          require("leap").add_default_mappings()
        end,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        -- Bracket pair rainbow colorize
        lazy = true,
        event = { "User FileOpened" },
    },
    {
        "kylechui/nvim-surround",
        lazy = true,
        keys = { "cs", "ds", "ys" },
        config = function()
          require("nvim-surround").setup({})
        end,
    },
    {
        'rainbowhxch/accelerated-jk.nvim'
    },
    {
        "ahmedkhalf/lsp-rooter.nvim",
        event = "BufRead",
        config = function()
          require("lsp-rooter").setup()
        end,
    },
    {
        "ethanholz/nvim-lastplace",
        config = function()
          require("nvim-lastplace").setup({
              lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
              lastplace_ignore_filetype = {
                  "gitcommit", "gitrebase", "svn", "hgcommit",
              },
          })
        end,
    },
    {
        "rmagatti/goto-preview",
        config = function()
          require('goto-preview').setup {
              width = 120, -- Width of the floating window
              height = 25, -- Height of the floating window
              default_mappings = false, -- Bind default mappings
              debug = false, -- Print debug information
              opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
              post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
              -- You can use "default_mappings = true" setup option
              -- Or explicitly set keybindings
              vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>"),
              vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>"),
              vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>"),
          }
        end,
    },
    -- {
    --   "karb94/neoscroll.nvim",
    --   event = "WinScrolled",
    --   config = function()
    --   require('neoscroll').setup({
    --         -- All these keys will be mapped to their corresponding default scrolling animation
    --         mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
    --         '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    --         hide_cursor = true,          -- Hide cursor while scrolling
    --         stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    --         use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    --         respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    --         cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    --         easing_function = nil,        -- Default easing function
    --         pre_hook = nil,              -- Function to run before the scrolling animation starts
    --         post_hook = nil,              -- Function to run after the scrolling animation ends
    --         })
    --   end
    -- },
    {
      "glepnir/zephyr-nvim"
    },
    {
      "rebelot/kanagawa.nvim"
    },
    {
      'jacoborus/tender.vim'
    },
    {
      'folke/tokyonight.nvim'
    },
    {
      'navarasu/onedark.nvim'
    },
    {
      "EdenEast/nightfox.nvim"
    },
    {
      "Mofiqul/vscode.nvim"
    },
    {
      "projekt0n/github-nvim-theme"
    },
    {
      "catppuccin/nvim", name = "catppuccin", priority = 1000
    },
    {
      "Mofiqul/dracula.nvim"
    },
    {
      "kepano/flexoki-neovim"
    },
    {
      "oxfist/night-owl.nvim",
    },
    {
      'ramojus/mellifluous.nvim',
    },
    {
      'mhartington/oceanic-next'
    },
    {
      'ku1ik/vim-monokai'
    },
}

lvim.builtin.treesitter.rainbow.enable = true

-- lvim.colorscheme = 'night-owl'
-- lvim.colorscheme = 'mellifluous'
lvim.colorscheme = 'tokyonight'
-- lvim.colorscheme = 'tender'
-- lvim.colorscheme = 'onedark'
-- lvim.colorscheme = 'dracula'
-- lvim.colorscheme = 'kanagawa'
-- lvim.colorscheme = 'vscode'
-- lvim.colorscheme = 'github_dark_default'
-- lvim.colorscheme = 'catppuccin-macchiato'
-- lvim.colorscheme = 'catppuccin-mocha'
-- lvim.colorscheme = 'flexoki-light'
-- lvim.colorscheme = 'nightfox'
-- lvim.colorscheme = 'OceanicNext'
-- lvim.colorscheme = 'monokai'

local dap = require('dap')
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/home/ajh/work/extension/debugAdapters/bin/OpenDebugAD7'
}
require('dap.ext.vscode').load_launchjs(nil, { cppdbg = {'c', 'cpp'} })
require('dap.ext.vscode').type_to_filetypes = {
  gdb = {'rust', 'c', 'cpp'},
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        MiMode = "gdb",
        miDebuggerPath = "/usr/bin/gdb-multiarch",
        miDebuggerServerAddress = "localhost:1234",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = true,
    },
}

vim.g.clipboard = {
      name = 'OSC 52',
      copy = {
        ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
        ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
      },
      paste = {
        ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
        ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
      },
}

dap.configurations.c = dap.configurations.cpp
lvim.builtin.bigfile.config = {
    filesize = 1,
    features = {
      "indent_blankline",
      "illuminate",
      "lsp",
      "treesitter",
      "syntax",
      "matchparen",
      "vimopts",
      "filetype",
      nvim_notify_disable,
    }
}



-- vim.g.copilot_tab_fallback = ""
-- local cmp = require "cmp"

-- lvim.builtin.cmp.mapping["<Tab>"] = function(fallback)
--   if cmp.visible() then
--     cmp.select_next_item()
--   else
--     local copilot_keys = vim.fn["copilot#Accept"]()
--     if copilot_keys ~= "" then
--       vim.api.nvim_feedkeys(copilot_keys, "i", true)
--     else
--       fallback()
--     end
--   end
-- end

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
-- lvim.plugins = {
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

-- lvim.colorscheme = ""
-- vim.cmd("hi SignColumn guibg=none")
