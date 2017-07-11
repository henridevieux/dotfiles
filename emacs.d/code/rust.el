(use-package rust-mode
  :ensure t
  :mode ("\\.rs" . rust-mode)
  :config
  (setq rust-format-on-save 1)
  (setenv "PATH" (concat (getenv "PATH") ":/Users/hdevieux/.cargo/bin"))
  (setq exec-path (append exec-path '("/Users/hdevieux/.cargo/bin")))
  (defun rust-compile-hook()
    (setq compile-command "cargo run"))
  (use-package flycheck-rust
    :ensure t
    :config
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
  (add-hook 'rust-mode-hook 'rust-compile-hook))
