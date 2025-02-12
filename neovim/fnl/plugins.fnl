(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)

(local lazy (require :lazy))


(lazy.setup
  [;; NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
   ;;"tpope/vim-sleuth"  ; Detect tabstop and shiftwidth automatically

   :sindrets/diffview.nvim
   :kepano/flexoki-neovim
   :udayvir-singh/tangerine.nvim
   :udayvir-singh/hibiscus.nvim

   ;; {:dir "/home/gbrls/Documents/00-projects/pwn-nvim" :opts {} :dependencies [:m00qek/baleia.nvim]}
   ;; {:lukas-reineke/indent-blankline.nvim :main :ibl :opts {}}

   {1 :folke/snacks.nvim
    :priority 1000
    :lazy false
    :opts {:bigfile {:enabled true}
           :dashboard {:enabled true 
                       :sections {
                            :cmd "chafa ~/Pictures/wallpaper/gnat.jpg --format symbols --symbols vhalf --stretch; sleep .1"
                            :height 50
                            :width 80
                            :padding 1
                            :section :terminal
                       }}
           :indent {:enabled false}
           :input {:enabled true}
           :notifier {:enabled true}
           :quickfile {:enabled true}
           :scroll {:enabled true}
           :statuscolumn {:enabled true}
           :words {:enabled true}
           :git {:enabled true}
           :gitbrowse {:enabled true}
           :zen {:enabled true}
           :picker {:enabled true}
           :animate {:easing :expo}}}

   {1 :onsails/lspkind.nvim :opts {:mode :symbol}}

   ;; {:utilyre/barbecue.nvim
   ;;  :name :barbecue
   ;;  :version "*"
   ;;  :dependencies [:SmiteshP/nvim-navic
   ;;                 :nvim-tree/nvim-web-devicons]
   ;;  :opts {}}

   {1 :folke/noice.nvim
    :event :VeryLazy
    :opts {:lsp {:override {:vim.lsp.util.convert_input_to_markdown_lines true
                            :vim.lsp.util.stylize_markdown true
                            :cmp.entry.get_documentation true}}
           :popupmenu {:enabled true :backend :nui}
           :presets {:bottom_search false
                     :command_palette true
                     :long_message_to_split true
                     :inc_rename false
                     :lsp_doc_border true}}
    :dependencies [:MunifTanjim/nui.nvim
                   :rcarriga/nvim-notify]}

   {1 :uga-rosa/ccc.nvim
    :config (fn []
              ((. (require :ccc) :setup)
               {:highlighter {:auto_enable true :lsp true}}))}

   :lewis6991/gitsigns.nvim

   {1 :folke/which-key.nvim
    :event :VimEnter
    :config (fn []
              (let [wk (require :which-key)]
                (wk.setup)
                (wk.add {:<leader>c {:group "[C]ode"}
                         :<leader>d {:group "[D]ocument"}
                         :<leader>r {:group "[R]ename"}
                         :<leader>s {:group "[S]earch"}
                         :<leader>w {:group "[W]orkspace"}
                         :<leader>t {:group "[T]oggle"}
                         :<leader>h {:group "Git [H]unk" :mode [:n :v]}})))}

   {1 :nvim-telescope/telescope.nvim
    :event :VimEnter
    :branch "0.1.x"
    :dependencies [:nvim-lua/plenary.nvim
                   {1 :nvim-telescope/telescope-fzf-native.nvim
                    :build :make
                    :cond (fn []
                            (= (vim.fn.executable :make) 1))}
                   :nvim-telescope/telescope-ui-select.nvim
                   {1 :nvim-tree/nvim-web-devicons :enabled vim.g.have_nerd_font}]
    :config (fn []
              (let [telescope (require :telescope)
                    builtin (require :telescope.builtin)
                    telescope_themes (require :telescope.themes)]
                (telescope.setup
                  {:defaults {:file_ignore_patterns [:.dump]}
                   :extensions {:ui-select [(telescope_themes.get_dropdown)]}})
                (pcall telescope.load_extension :fzf)
                (pcall telescope.load_extension :ui-select)))}

   {1 :folke/lazydev.nvim
    :ft :lua
    :opts {:library [{:path :luvit-meta/library :words ["vim%.uv"]}]}}
   {1 :Bilal2453/luvit-meta :lazy true}

   {1 :neovim/nvim-lspconfig
    :dependencies [:williamboman/mason.nvim
                   :williamboman/mason-lspconfig.nvim
                   :WhoIsSethDaniel/mason-tool-installer.nvim
                   {1 :j-hui/fidget.nvim :opts {}}
                   :hrsh7th/cmp-nvim-lsp]
    :config (fn []
              ;(print "hellloooooo!")
              ;(augroup
              ;(vim.api.nvim_create_autocmd
              ;  :LspAttach
              ;  {:group (vim.api.nvim_create_augroup :kickstart-lsp-attach {:clear true})
              ;   :callback (fn [event]
              ;               (let [builtin (require :telescope.builtin)
              ;                     map (fn [keys func desc]
              ;                           (vim.keymap.set
              ;                             :n keys func
              ;                             {:buffer event.buf :desc (.. "LSP: " desc)}))
              ;                     builtin (require :telescope.builtin)]
              ;                 (map! [n] :gd builtin.lsp_definitions "[G]oto [D]efinition")
              ;                 (map! [n] :gr builtin.lsp_references "[G]oto [R]eferences")
              ;                 (map! [n] :gI builtin.lsp_implementations "[G]oto [I]mplementation")
              ;                 (map! [n] :<leader>D builtin.lsp_type_definitions "Type [D]efinition")
              ;                 (map! [n] :<leader>ds builtin.lsp_document_symbols "[D]ocument [S]ymbols")
              ;                 (map! [n] :<leader>ws builtin.lsp_dynamic_workspace_symbols "[W]orkspace [S]ymbols")
              ;                 (map! [n] :<leader>rn vim.lsp.buf.rename "[R]e[n]ame")
              ;                 (map! [n] :<leader>ca vim.lsp.buf.code_action "[C]ode [A]ction")
              ;                 (map! [n] :gD vim.lsp.buf.declaration "[G]oto [D]eclaration")
              ;                 (let [client (vim.lsp.get_client_by_id event.data.client_id)]
              ;                   (when (and client (client.supports_method vim.lsp.protocol.Methods.textDocument_documentHighlight))
              ;                     (let [augroup (vim.api.nvim_create_augroup :kickstart-lsp-highlight {:clear false})]
              ;                       (vim.api.nvim_create_autocmd [:CursorHold :CursorHoldI]
              ;                         {:buffer event.buf
              ;                          :group augroup
              ;                          :callback vim.lsp.buf.document_highlight})
              ;                       (vim.api.nvim_create_autocmd [:CursorMoved :CursorMovedI]
              ;                         {:buffer event.buf
              ;                          :group augroup
              ;                          :callback vim.lsp.buf.clear_references})
              ;                       (vim.api.nvim_create_autocmd :LspDetach
              ;                         {:group (vim.api.nvim_create_augroup :kickstart-lsp-detach {:clear true})
              ;                          :callback (fn [event2]
              ;                                      (vim.lsp.buf.clear_references)
              ;                                      (vim.api.nvim_clear_autocmds
              ;                                        {:group :kickstart-lsp-highlight
              ;                                         :buffer event2.buf}))})))
              ;                   (when (and client (client.supports_method vim.lsp.protocol.Methods.textDocument_inlayHint))
              ;                     (map :<leader>th
              ;                          (fn []
              ;                            (vim.lsp.inlay_hint.enable
              ;                              (not (vim.lsp.inlay_hint.is_enabled {:bufnr event.buf}))))
              ;                          "[T]oggle Inlay [H]ints")))))})
              (let [
                    capabilities (vim.tbl_deep_extend :force (vim.lsp.protocol.make_client_capabilities) ((. (require :cmp_nvim_lsp) :default_capabilities)))
                    mason (require :mason)
                    mason_installer (require :mason-tool-installer)
                    mason_lsp (require :mason-lspconfig)
                    lspconfig (require :lspconfig)
                    ;servers {:pyright {} :lua_ls {:settings {:Lua {:completion {:callSnippet :Replace}}}}}
                    ]
                (print "body")
                (mason.setup [])
                (mason_installer.setup [])
                (mason_lsp.setup [])
                (lspconfig.pyright.setup [])
                (lspconfig.clangd.setup [])
                (lspconfig.lua_ls.setup [])
                )
              ;  ((require :mason) :setup)
              ;  (((require :mason-tool-installer) :setup)
              ;   {:ensure_installed (vim.tbl_keys servers)})
                ;(((require :mason-lspconfig) :setup)
                ; {:handlers [(fn [server_name]
                ;               (let [server (. servers server_name)]
                ;                 (set server.capabilities
                ;                      (vim.tbl_deep_extend :force {} capabilities (or server.capabilities {})))
                ;                 (((require :lspconfig) server_name) :setup server)))])
                )}

   {1 :hrsh7th/nvim-cmp
    :event :InsertEnter
    :dependencies [{1 :L3MON4D3/LuaSnip
                    :build (if (or (= (vim.fn.has :win32) 1)
                                   (= (vim.fn.executable :make) 0))
                             nil
                             :make_install_jsregexp)}
                   :saadparwaiz1/cmp_luasnip
                   :hrsh7th/cmp-nvim-lsp
                   :hrsh7th/cmp-path]
    :config (fn []
              (let [cmp (require :cmp)
                    luasnip (require :luasnip)
                    lspkind (require :lspkind)]
                (luasnip.config.setup {})
                (cmp.setup
                  {:snippet {:expand (fn [args] (luasnip.lsp_expand args.body))}
                   :window {:documentation (cmp.config.window.bordered)
                            :completion (cmp.config.window.bordered)}
                   :mapping (cmp.mapping.preset.insert
                              {:<Tab> (cmp.mapping.select_next_item)
                               :<S-Tab> (cmp.mapping.select_prev_item)
                               :<C-b> (cmp.mapping.scroll_docs (- 4))
                               :<C-f> (cmp.mapping.scroll_docs 4)
                               :<CR> (cmp.mapping.confirm {:select true})
                               :<C-Space> (cmp.mapping.complete {})
                               :<C-l> (fn []
                                        (when (luasnip.expand_or_locally_jumpable)
                                          (luasnip.expand_or_jump)))
                               :<C-h> (fn []
                                        (when (luasnip.locally_jumpable (- 1))
                                          (luasnip.jump (- 1))))})
                   :sources [{:name :lazydev :group_index 0}
                             {:name :nvim_lsp}
                             {:name :luasnip}
                             {:name :path}]
                   :formatting {:format (lspkind.cmp_format
                                          {:mode :symbol
                                           :maxwidth {:menu 50 :abbr 50}
                                           :ellipsis_char "..."
                                           :show_labelDetails true})}})))}

   {1 :rose-pine/neovim
    :name :rose-pine
    :config (fn []
              ((. (require :rose-pine) :setup) {:styles {:italic false}}))}

   {1 :Shatur/neovim-ayu
    :config (fn []
              ((. (require :ayu) :setup) {} ))}
   :tiagovla/tokyodark.nvim

   {1 :folke/tokyonight.nvim :opts {:comments {:italic false} :keywords {:italic false}} :priority 1000}
   {1 :folke/todo-comments.nvim :event :VimEnter :dependencies [:nvim-lua/plenary.nvim] :opts {:signs false}}
   :folke/trouble.nvim

   {1 :echasnovski/mini.nvim
    :config (fn []
              (let [mini_ai (require :mini.ai)
                    mini_surround (require :mini.surround)]
                (mini_ai.setup {:n_lines 500})
                (mini_surround.setup)
                (let [statusline (require :mini.statusline)]
                  (statusline.setup {:use_icons vim.g.have_nerd_font})
                  (tset statusline :section_location (fn [] "%2l:%-2v")))))}

   {1 :nvim-treesitter/nvim-treesitter
    :build ":TSUpdate"
    :opts {:ensure_installed [:bash :c :diff :go :html :lua :luadoc :markdown
                              :markdown_inline :python :query :rust :vim :vimdoc :gleam]
           :auto_install true
           :highlight {:enable true
                       :additional_vim_regex_highlighting [:ruby]}
           :indent {:enable true :disable [:ruby]}}
    :config (fn [_ opts]
              ((. (require :nvim-treesitter.configs) :setup) opts))}

   :nvim-treesitter/nvim-treesitter-context
   {1 :akinsho/toggleterm.nvim :version "*" :opts {:direction :vertical :size 60}}
   {1 :stevearc/oil.nvim :opts {} :dependencies [:echasnovski/mini.icons]}
   {1 :epwalsh/obsidian.nvim
    :version "*"
    :lazy false
    :ft :markdown
    :opts {:ui {:enable false}
           :workspaces [{:name :personal :path "/home/gbrls/Documents/obsidian/pkms"}]}}
   {1 :MeanderingProgrammer/render-markdown.nvim
    :opts {}
    :dependencies [:nvim-treesitter/nvim-treesitter :echasnovski/mini.nvim]}]

  ; TODO: test
 {:ui {:icons (if vim.g.have_nerd_font
                {}
                {:cmd "⌘"
                 :config "🛠"
                 :event "📅"
                 :ft "📂"
                 :init "⚙"
                 :keys "🗝"
                 :plugin "🔌"
                 :runtime "💻"
                 :require "🌙"
                 :source "📄"
                 :start "🚀"
                 :task "📌"
                 :lazy "💤 "})}})

