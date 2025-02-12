(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)

(g! mapleader " ")
(g! maplocalleader " ")
(g! have_nerd_font true)

(set! number true)
(set! relativenumber true)
(set! mouse "a")
(set! showmode false)
(set! breakindent true)
(set! undofile true)
(set! ignorecase true)
(set! smartcase true)
(set! signcolumn "yes")
(set! updatetime 250)
(set! timeoutlen 300)
(set! splitright true)
(set! splitbelow true)
(set! list false)
(set! inccommand "split")
(set! cursorline true)
(set! cursorlineopt "number")
(set! scrolloff 10)
(set! tabstop 4)
(set! softtabstop 4)
(set! shiftwidth 4)
(set! expandtab true)


(vim.diagnostic.config {:virtual_text false :underline false })

(augroup! :highlight-yank 
          [[TextYankPost :desc "highlights yanked region."]
          *
          #(vim.highlight.on_yank {:timeout 100})])


(vim.schedule (fn [] (set vim.opt.clipboard "unnamedplus")))

; split in pretty files
(require :plugins)
(require :keybindings)

(color! :ayu)
;(color! :ayu-mirage)
