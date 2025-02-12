(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)


(local toggleterm (require :toggleterm))
(local snacks (require :snacks))

(map! [n] :<leader>ot `(toggleterm.toggle 0) "toggle term")
(map! [n] :<leader>os :<cmd>ObsidianSearch<CR> "obsidian search")

(local tb (require :telescope.builtin))



(map! [n] :<leader>z `(snacks.picker.zoxide) "zoxide")
(map! [n] :<leader>u `(snacks.picker.undo) "undo")
(map! [n] :<leader>x `(snacks.picker.spelling) "spelling")
(map! [n] :<leader>h `(snacks.picker.search_history) "search history")
(map! [n] :<leader>n `(snacks.picker.todo_comments) "all commands")
(map! [n] :<leader>m `(snacks.picker.marks) "marks")
(map! [n] :<leader>j `(snacks.picker.jumps) "jumps")
(map! [n] :<leader>. `(snacks.picker.resume) "resume search")
(map! [n] :<leader><leader> `(snacks.picker.commands) "all commands")


(map! [n] :<leader>sm `(snacks.picker.man) "man")
(map! [n] :<leader>sh `(snacks.picker.help) "search help")
(map! [n] :<leader>sk tb.keymaps "search keymaps")
(map! [n] :<leader>ss `(snacks.picker.pick) "search select telescope")
(map! [n] :<leader>sw tb.grep_string "search current word")
(map! [n] :<leader>sd `(snacks.picker.diagnostics) "search diagnostics")
(map! [n] :<leader>sc `(snacks.picker.command_history) "search command history")
(map! [n] :<leader>sn `(snacks.picker.notifications) "all commands")


(map! [n] :<leader>fa `(snacks.picker.smart) "find smart")
(map! [n] :<leader>ff `(snacks.picker.files) "find files")
(map! [n] :<leader>fd `(snacks.picker.explorer) "find directory")
(map! [n] :<leader>fs `(snacks.picker.grep) "find search")
(map! [n] :<leader>fh `(snacks.picker.recent) "find history")
(map! [n] :<leader>fb `(snacks.picker.buffers) "find buffers")

(map! [n] :<leader>gd `(snacks.picker.git_diff) "git diff")
(map! [n] :<leader>gl `(snacks.picker.git_log) "git log")
(map! [n] :<leader>gs `(snacks.picker.git_status) "git status")

(map! [n] :<leader>ld `(snacks.picker.lsp_definition) "lsp declarations")
(map! [n] :<leader>lad `(snacks.picker.lsp_definitions) "lsp definitions")
(map! [n] :<leader>li `(snacks.picker.lsp_implementations) "lsp implementations")
(map! [n] :<leader>lr `(snacks.picker.lsp_references) "lsp references")
(map! [n] :<leader>ls `(snacks.picker.lsp_symbols) "lsp symbols")
(map! [n] :<leader>lt `(snacks.picker.lsp_symbols) "lsp type definitions")
(map! [n] :<leader>lw `(snacks.picker.lsp_workspace_symbols) "lsp workspace symbols")
(map! [n] :gd `(snacks.picker.lsp_definitions) "goto definition")
(map! [n] :gr `(snacks.picker.lsp_references) "[G]oto [R]eferences")
;(map! [n] :gI builtin.lsp_implementations "[G]oto [I]mplementation")
;(map! [n] :<leader>D builtin.lsp_type_definitions "Type [D]efinition")
;(map! [n] :<leader>ds builtin.lsp_document_symbols "[D]ocument [S]ymbols")
;(map! [n] :<leader>ws builtin.lsp_dynamic_workspace_symbols "[W]orkspace [S]ymbols")
;(map! [n] :<leader>rn vim.lsp.buf.rename "[R]e[n]ame")
;(map! [n] :<leader>ca vim.lsp.buf.code_action "[C]ode [A]ction")
;(map! [n] :gD vim.lsp.buf.declaration "[G]oto [D]eclaration")

(map! [n] :<leader>ii `(vim.cmd "DiagnosticsToggleVirtualText") "toggle virtual text")
