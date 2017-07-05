(use-package auto-complete
  :ensure t
  :init
  (progn
    (auto-complete-mode t))
  :config
  (progn
    (ac-config-default)

    (ac-set-trigger-key "TAB")

    (setq ac-modes '(go-mode python-mode c++-mode c-mode))))


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
  :diminish smartparens-global-mode
  :init
  (progn
    (use-package smartparens-config)
    (smartparens-global-mode 1)))
