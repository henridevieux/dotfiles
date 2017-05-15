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
