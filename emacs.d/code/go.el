(use-package go-mode
  :ensure t
  :mode ("\\.go$" . go-mode)
  :config
  (auto-complete-mode 1)
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setenv "GOPATH" "/Users/hdevieux/gocode")
  (setenv "PATH" (concat (getenv "PATH") ":/Users/hdevieux/gocode/bin"))
  (setq exec-path (append exec-path '("/Users/hdevieux/gocode/bin")))
  (setq gofmt-command "goimports")
  (use-package go-eldoc
    :ensure t
    :init
    (add-hook 'go-mode-hook 'go-eldoc-setup))
  (use-package go-autocomplete
    :ensure t))
