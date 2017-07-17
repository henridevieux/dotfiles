(use-package auto-complete
  :ensure t
  :init
  (progn
    (auto-complete-mode t))
  :config
  (progn
    (ac-config-default)
    (ac-set-trigger-key "TAB")

    (setq ac-modes '(c-mode c++-mode go-mode python-mode rust-mode))))

(use-package whitespace
  :ensure t
  :init
  (dolist (hook '(prog-mode-hook text-mode-hook))
    (add-hook hook #'whitespace-mode))
  (add-hook 'before-save-hook #'whitespace-cleanup)
  :config
  (setq whitespace-line-column 80)
  (setq whitespace-style '(face tabs trailing lines-tail)))



(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :init
  (global-flycheck-mode)
  :config
  (progn
    (setq-local flycheck-highlighting-mode nil)
    (setq-local flycheck-check-syntax-automatically nil)))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :init
  (progn
    (use-package smartparens-config)
    (smartparens-global-mode 1)))
