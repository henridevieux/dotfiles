(use-package go-mode
  :ensure t
  :mode ("\\.go$" . go-mode)
  :config
  (add-hook 'before-save-hook #'gofmt-before-save)
  (setenv "GOPATH" "/Users/hdevieux/gocode")
  (auto-complete-mode t)
  (setq exec-path (append exec-path '("/Users/hdevieux/gocode/bin")))
  (setq exec-path (append exec-path '("/usr/local/go/bin")))
  (setq gofmt-command "goimports")
  (setq whitespace-line-column 120)
  (use-package go-eldoc
    :ensure t
    :init
    (add-hook 'go-mode-hook 'go-eldoc-setup)
    :config
    (setq go-eldoc-gocode "/usr/local/go/bin/go"))
  ;; Delete this line and uncomment below
  )
  ;; (use-package go-autocomplete
  ;;   :ensure t
  ;;   :config
  ;;   (setq ac-go-gocode-bin "/usr/local/go/bin/go")))
