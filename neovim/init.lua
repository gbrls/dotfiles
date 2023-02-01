-- Install packer
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

-- vim.api.nvim_exec([[
--   augroup Packer
--     autocmd!
--     autocmd BufWritePost init.lua PackerCompile
--   augroup end
-- ]], false)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'       -- Package manager
  use 'tpope/vim-fugitive'           -- Git commands in nvim
  use 'tpope/vim-rhubarb'            -- Fugitive-companion to interact with github
  use 'tpope/vim-commentary'         -- "gc" to comment visual regions/lines
  use 'tpope/vim-surround'         
  use 'tpope/vim-repeat'
  --
  --use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  -- UI to select things (files, grep results, open buffers...)

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }


  use 'frenzyexists/aquarium-vim'
  use { 'Everblush/everblush.nvim', as = 'everblush' }
  use 'rebelot/kanagawa.nvim'
  use 'kvrohit/rasmus.nvim'

  use 'savq/melange'
  use 'joshdick/onedark.vim'         -- Theme inspired by Atom
  use 'folke/tokyonight.nvim'
  use 'kyazdani42/blue-moon'

  --use 'itchyny/lightline.vim'        -- Fancier statusline
  -- Add indentation guides even on blank lines
  use { 'lukas-reineke/indent-blankline.nvim' }
  -- Add git related info in the signs columns and popups
  use 'neovim/nvim-lspconfig'        -- Collection of configurations for built-in LSP client

  use 'onsails/lspkind-nvim'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-path'


  -- use 'hrsh7th/cmp-vsnip'
  -- use 'hrsh7th/vim-vsnip'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- use 'SirVer/ultisnips'
  -- use 'quangnguyen30192/cmp-nvim-ultisnips'

  -- use 'dcampos/nvim-snippy'
  -- use 'dcampos/cmp-snippy'

  use 'hrsh7th/nvim-cmp'
  use 'folke/which-key.nvim'
  use 'kyazdani42/nvim-web-devicons'
  --use 'kyazdani42/nvim-tree.lua'-- tree lua

  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  --use 'glepnir/dashboard-nvim'
  use {
      'goolord/alpha-nvim',
      config = function ()
          require'alpha'.setup(require'alpha.themes.dashboard'.config)
      end
  }

   use 'simrat39/rust-tools.nvim'
   use {
       'folke/trouble.nvim',
       requires = 'kyazdani42/nvim-web-devicons',
  }
   use 'ARM9/arm-syntax-vim'
   use {
       'nvim-treesitter/nvim-treesitter',
       run = ':TSUpdate'
   }
   use 'nvim-treesitter/nvim-treesitter-context'
   use 'folke/zen-mode.nvim' 

   -- use {
   --     'folke/twilight.nvim',
   --     config = function()
   --         require('twilight').setup { }
   --     end
   -- }

   use {
       'nvim-lualine/lualine.nvim',
       requires = {'kyazdani42/nvim-web-devicons', opt = true}
   }
   use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}

   --use 'ggandor/lightspeed.nvim'
   use 'ggandor/leap.nvim'

   use 'wlangstroth/vim-racket'
   use 'calebsmith/vim-lambdify'
   use 'tikhomirov/vim-glsl'
   use 'sainnhe/gruvbox-material'
   use 'sainnhe/everforest'
   use 'sainnhe/sonokai'
   use 'simrat39/symbols-outline.nvim'


   use 'nvim-lua/plenary.nvim'
   use 'lewis6991/gitsigns.nvim'

   use 'bluz71/vim-nightfly-guicolors'
   use 'shaunsingh/moonlight.nvim'
   use 'mangeshrex/uwu.vim' 
   use 'dracula/vim'
   use 'Julpikar/night-owl.nvim'

   -- use 'glepnir/lspsaga.nvim'
   
   -- @TODO: Not really working well with figwheel
   --use 'Olical/conjure'
   --use 'guns/vim-sexp'
   --use 'tpope/vim-sexp-mappings-for-regular-people'

   --use 'PaterJason/cmp-conjure'

   --use 'luochen1990/rainbow'
   use 'p00f/nvim-ts-rainbow'


   use 'weilbith/nvim-code-action-menu'
   use 'yonlu/omni.vim'
   use 'navarasu/onedark.nvim'
   use 'tiagovla/tokyodark.nvim'
   use 'DingDean/wgsl.vim'
   use 'terrortylor/nvim-comment'


   use 'catppuccin/nvim'
   use 'joom/latex-unicoder.vim'
   use {"akinsho/toggleterm.nvim"}
   use 'mickael-menu/zk-nvim'
   use {
       "prncss-xyz/neo-tree-zk.nvim",
       requires = {
           "nvim-neo-tree/neo-tree.nvim",
           "mickael-menu/zk-nvim"
       },
   }
   use {
       "nvim-neo-tree/neo-tree.nvim",
       branch = "v2.x",
       requires = { 
           "nvim-lua/plenary.nvim",
           "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
           "MunifTanjim/nui.nvim",
       }
   }
   use({
       "Pocco81/true-zen.nvim",
       config = function()
           require("true-zen").setup {
               -- your config goes here
               -- or just leave it empty :)
           }
       end,
   })
   use { "ellisonleao/glow.nvim" }
   use 'norcalli/nvim-colorizer.lua'
   use 'xiyaowong/nvim-transparent'
   use { "williamboman/mason.nvim" }
   use({
       'rose-pine/neovim',
       as = 'rose-pine',
       config = function()
           vim.cmd('colorscheme rose-pine')
       end
   })

    use({ "mhanberg/elixir.nvim", requires = { "nvim-lua/plenary.nvim" }})

end)

require'treesitter-context'.setup{
    mode = 'topline',
}

local rust_cfg = {
    inlay_hints = { only_current_line = true }
}


require('rust-tools').setup(rust_cfg)

-- Mine

vim.cmd[[au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7]]
-- vim.cmd[[set guifont=Cascadia\ Code\ PL:h11]]
vim.cmd[[set guifont=Jetbrains\ Mono:h12]]
vim.cmd[[set clipboard+=unnamedplus]]
vim.cmd[[set nu! rnu!]]

vim.o.scrolloff = 3             -- keep 3 lines when scrolling
vim.o.ai = true                 -- set auto-indenting for programming

vim.o.tabstop = 4               -- number of visual spaces per TAB
vim.o.softtabstop = 4			-- number of spaces in tab when editing
vim.o.shiftwidth = 4			-- number of spaces to use for autoindent
vim.o.expandtab = true			-- tabs are spaces
-- End of mine

--Incremental live completion
vim.o.inccommand = "nosplit"

--Set highlight on search
vim.o.hlsearch = false
vim.o.incsearch = true

--Make line numbers default
vim.wo.number = true

--Do not save when switching buffers
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = "a"

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.cmd[[set undofile]]

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn="yes"

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.g.gruvbox_material_background = 'hard'
--vim.g.gruvbox_material_transparent_background = 1


--local catppuccin = require("catppuccin")
--catppuccin.setup({
--    styles = {
--        comments = "NONE",
--        functions = "NONE",
--        keywords = "NONE",
--        variables = "NONE",
--    },
--    integrations = {
--        treesitter = true,
--        native_lsp = {
--            enabled = true,
--            virtual_text = {
--                errors = "NONE",
--                hints = "NONE",
--                warnings = "NONE",
--                information = "NONE",
--            },
--            underlines = {
--                errors = "underline",
--                hints = "underline",
--                warnings = "underline",
--                information = "underline",
--            },
--        }
--
--    }
--})



-- vim.cmd[[let g:sonokai_style = 'shusia']]
-- vim.cmd[[colorscheme sonokai]]

--vim.cmd[[colorscheme melange]]
--local everblush = require('everblush')
--everblush.setup({ nvim_tree = { contrast = true } }) -- or use contrast = false to not apply contrast


--require("tokyonight").setup({
--  style = "storm",
--  -- disable italic for functions
--  styles = {
--    comments = {},
--    keywords = {},
--    functions = {},
--    variables = {},
--  },
--})

--vim.cmd[[colorscheme tokyonight]]
vim.cmd[[colorscheme catppuccin]]
require('rose-pine').setup({
	--- @usage 'main' | 'moon'
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = true,
})
--vim.cmd[[colorscheme rose-pine]]

--require('onedark').setup()

require'lualine'.setup {
    --options = { theme = 'catppuccin' },
    --options = { theme = 'everblush' },
    extensions = {'fugitive', 'nvim-tree'},
}

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent=true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap=true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", {noremap= true, expr = true, silent = true})

--Remap escape to leave terminal mode
vim.api.nvim_set_keymap('t', '<Esc>', [[<c-\><c-n>]], {noremap = true})

--Add map to enter paste mode
vim.o.pastetoggle="<F3>"

--Map blankline
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile'}
vim.g.indent_blankline_char_highlight = 'LineNr'

-- Toggle to disable mouse mode and indentlines for easier paste
ToggleMouse = function()
  if vim.o.mouse == 'a' then
    vim.cmd[[IndentBlanklineDisable]]
    vim.wo.signcolumn='no'
    vim.o.mouse = 'v'
    vim.wo.number = false
    print("Mouse disabled")
  else
    vim.cmd[[IndentBlanklineEnable]]
    vim.wo.signcolumn='yes'
    vim.o.mouse = 'a'
    vim.wo.number = true
    print("Mouse enabled")
  end
end

vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua ToggleMouse()<cr>', { noremap = true })

-- Telescope
local trouble = require('trouble.providers.telescope')
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
        ["<C-t>"] = trouble.open_with_trouble,
      },
      n = {
        ["<C-t>"] = trouble.open_with_trouble,
      },
    },
    -- generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
    -- file_sorter =  require'telescope.sorters'.get_fzy_sorter,
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('zk')

-- Trouble commands
-- nnoremap <leader>xx <cmd>TroubleToggle<cr>
-- nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
-- nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
-- nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
-- nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
-- nnoremap gR <cmd>TroubleToggle lsp_references<cr>

local wk = require("which-key")
--Add leader shortcuts
wk.register({
    f = {
        name = "file",
        f = {[[<cmd>lua require('telescope.builtin').find_files()<cr>]], "Find File", noremap = true, silent = true},
        h = {'<cmd>Telescope oldfiles<cr>', "Oldfiles", noremap = true, silent = true},
        s = {[[<cmd>Telescope live_grep<cr>]], "Search in Files", noremap = true, silent = true},
        t = {[[<cmd>lua require('telescope.builtin').tags()<cr>]], "Tags", noremap = true, silent = true},
    },
    g = {
        name = "git",
        c = {[[<cmd>lua require('telescope.builtin').git_commits()<cr>]],  'Commits',  noremap = true, silent = true},
        b = {[[<cmd>lua require('telescope.builtin').git_branches()<cr>]], 'Branches', noremap = true, silent = true},
        s = {[[<cmd>lua require('telescope.builtin').git_status()<cr>]],   'Status',   noremap = true, silent = true},
    },
    l = {
        name = "lsp",
        --a = {[[<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>]],  'Actions',  noremap = true, silent = true},
        a = {[[<cmd>CodeActionMenu<cr>]],  'Actions',  noremap = true, silent = true},
        f = {[[<cmd>Format<cr>]],  'Format',  noremap = true, silent = true},
        t = {[[<cmd>TroubleToggle<cr>]],  'Trouble Toggle',  noremap = true, silent = true},
        R = {[[<cmd>TroubleToggle lsp_references<cr>]],  'References',  noremap = true, silent = true},
    },
    c = {
        name = "Commands",
        h = {[[<cmd>lua require('telescope.builtin').command_history()<cr>]],  'History',  noremap = true, silent = true},
        c = {[[<cmd>lua require('telescope.builtin').colorscheme()<cr>]],  'History',  noremap = true, silent = true},
    },

    r = {vim.lsp.codelens.run, 'Codelens run', noremap = true, silent = true},

    --r = {
    --    name = "run",
    --    --r = {[[<cmd>lua require('rust-tools.runnables').runnables()<cr>]],  'Rust Runnables',  noremap = true, silent = true},
    --    r = {[[<cmd>TermExec cmd="cargo run"<cr>]],  'Cargo Run',  noremap = true, silent = true},
    --    t = {[[<cmd>TermExec cmd="cargo test"<cr>]],  'Cargo Test',  noremap = true, silent = true},
    --    m = {[[<cmd>TermExec cmd="make"<cr>]],  'Make',  noremap = true, silent = true},
    --    
    --},
    b = {[[<cmd>lua require('telescope.builtin').buffers()<cr>]], 'Buffers', noremap = true, silent = true},

    o = {
        name = "open",
        t = {[[<cmd>ToggleTerm<cr>]], "Terminal", noremap = true, silent = true},
    },
    n = {
        name = "notes",
        c = {[[<cmd>ZkCd<cr>]], 'cd Notes dir', noremap = true, silent = true},
        f = {[[<cmd>Telescope zk notes<cr>]], 'Find notes', noremap = true, silent = true},
        g = {[[<cmd>Glow<cr>]], 'show preview with glow', noremap = true, silent = true},
    },

    -- @TODO: Write here multiple pickers, similar to Jetbrains's Shift-Shift
    ['<leader>'] = {[[<cmd>lua require('telescope.builtin').commands()<cr>]],  'All commands',  noremap = true, silent = true},
}, { prefix = '<leader>' })

-- vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], { noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<leader>l', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>t', [[<cmd>lua require('telescope.builtin').tags()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>o', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gp', [[<cmd>lua require('telescope.builtin').git_bcommits()<cr>]], { noremap = true, silent = true})

-- Change preview window location
vim.g.splitbelow = true

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)

-- Y yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true})
--
-- LSP settings
local nvim_lsp = require('lspconfig')
local on_attach = function(_client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', [[<Cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]], opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)

  --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', [[<Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

  -- @TODO: Add these keymaps to which-key
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end


local opts = { noremap=true, silent=true }

vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
vim.api.nvim_set_keymap('n', 'gh', [[<Cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]], opts)
vim.api.nvim_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)


--local path_to_elixirls = vim.fn.expand("/opt/homebrew/bin/elixir-ls")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Enable the following language servers
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'hls', 'clojure_lsp', 'gopls' }
--local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'elixirls', 'hls', 'clojure_lsp', 'gopls' }

-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup { on_attach = on_attach }
-- end

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--nvim_lsp['elixirls'].setup({
--  cmd = {path_to_elixirls},
--  capabilities = capabilities,
--  on_attach = on_attach,
--  settings = {
--    elixirLS = {
--      -- I choose to disable dialyzer for personal reasons, but
--      -- I would suggest you also disable it unless you are well
--      -- aquainted with dialzyer and know how to use it.
--      dialyzerEnabled = false,
--      -- I also choose to turn off the auto dep fetching feature.
--      -- It often get's into a weird state that requires deleting
--      -- the .elixir_ls directory and restarting your editor.
--      fetchDeps = false
--    }
--  }
--})

 --require('lspconfig').rust_analyzer.setup {
 --    settings = {
 --        ['rust-analyzer'] = {
 --            checkOnSave = {
 --                allFeatures = true,
 --                overrideCommand = {
 --                    'cargo', 'clippy', '--workspace', '--message-format=json',
 --                    '--all-targets', '--all-features'
 --                }
 --            }
 --        }
 --    }
 --}
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Map :Format to vim.lsp.buf.formatting()
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format {async = true}' ]])


vim.api.nvim_set_keymap("i", "<F5>", "<cmd>lua run_cmd('./build.sh 0')<cr>", {expr = true})
vim.api.nvim_set_keymap("n", "<F5>", "<cmd>lua run_cmd('./build.sh 0')<cr>", {expr = false})

require'nvim-treesitter.configs'.setup {
  --ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  --ignore_install = { "javascript" }, -- List of parsers to ignore installing
  auto_install = true,
  highlight = {

    enable = true,
    --disable = {},
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {"#aaaaaa", "#eeeeee", "#eeaaaa"}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
}

-- It doesn't work well with nvim-qt on windows 
-- require'bufferline'.setup{ }

run_cmd = function(arg)
    print('Running')
    print(arg)
    local handle = io.popen(arg)
    local result = handle:read("*a")
    handle:close()
    --print(result)
end


vim.cmd[[let g:neovide_cursor_animation_length=0.05]]
vim.g.symbols_outline = {
    highlight_hovered_item = false
}

-- Avoid showing message extra message when using completion
-- vim.cmd[[set shortmess+=c]]

-- vim.cmd[[au ColorScheme * hi Normal ctermbg=none guibg=none]]

      
local cmp = require'cmp'
local lspkind = require('lspkind')
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")

vim.cmd[[set completeopt=menu,menuone,noselect]]

cmp.setup({
    snippet = {
        expand = function(args)
            --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
        end,
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'conjure' },
        { name = 'path' },

        { name = 'luasnip' },
        -- { name = 'vsnip' },
        -- { name = 'ultisnips' },

        { name = 'buffer' },
    },
    
    formatting = {
        format = lspkind.cmp_format({with_text = true, maxwidth = 50})
    },
    
    experimental = {
        ghost_text = true,
    },
})

--require'nvim-tree'.setup {
--    --disable_netrw = false,
--    --auto_close = true,
--    --hijack_newtr = false,
--}

require('gitsigns').setup()
require('nvim_comment').setup()
require("toggleterm").setup{
    direction = 'vertical',
    open_mapping = [[<c-t>]],
    size = 60,
}

require('zk').setup({
  -- can be "telescope", "fzf" or "select" (`vim.ui.select`)
  -- it's recommended to use "telescope" or "fzf"
  picker = 'telescope',

  lsp = {
    -- `config` is passed to `vim.lsp.start_client(config)`
    config = {
      cmd = { 'zk', 'lsp' },
      name = 'zk',
      -- on_attach = ...
      -- etc, see `:h vim.lsp.start_client()`
    },

    -- automatically attach buffers in a zk notebook that match the given filetypes
    auto_attach = {
      enabled = true,
      filetypes = { 'markdown' },
    },
  },
})

--require('neoscroll').setup()
require("neo-tree").setup {
    sources = {
        -- default sources
        "filesystem",
        "buffers",
        "git_status",
        -- user sources goes here
        "zk",
    },
    -- ...
    zk = {
        follow_current_file = true,
        window = {
            mappings = {
                ["n"] = "change_query",
            },
        },
    }
}


require'colorizer'.setup()
require("mason").setup()
require('leap').add_default_mappings()
require("elixir").setup()
