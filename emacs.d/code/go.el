(setenv "GOPATH" "/Users/hdevieux/gocode")
(setenv "GOROOT" "/usr/local/go")
(setq exec-path (append exec-path '("/Users/hdevieux/gocode/bin" "/user/local/go/bin")))
(setenv "PATH" (concat (getenv "PATH") ":/Users/hdevieux/gocode/bin:/usr/local/go/bin"))

(use-package go-mode
  :ensure t
  :mode ("\\.go$" . go-mode)
  :hook ((go-mode . lsp-deferred)
	 (before-save . lsp-format-buffer)
	 (before-save . lsp-organize-imports)))

(provide 'gopls-config)
