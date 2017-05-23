(use-package auto-complete
  :ensure t
  :init
  (progn
    (auto-complete-mode t))
  :config
  (progn
    (ac-config-default)

    (ac-set-trigger-key "TAB")

    (setq ac-modes '(go-mode
		     python-mdoe))))


(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  :config
  (progn
    (setq-local flycheck-highlighting-mode nil)
    (setq-local flycheck-check-syntax-automatically nil)))
