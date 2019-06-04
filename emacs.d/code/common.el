;; (use-package auto-complete
;;   :ensure t
;;   :init
;;   (progn
;;     (ac-config-default)
;;     (auto-complete-mode t))
;;   :config
;;   (progn
;;     (ac-set-trigger-key "TAB")
;;     (setq ac-modes '(c-mode c++-mode python-mode rust-mode))))
(use-package auto-complete
  :ensure t
  :diminish auto-complete-mode
  :init
    (ac-config-default))

(use-package whitespace
  :ensure t
  :diminish whitespace-mode
  :init
  (dolist (hook '(prog-mode-hook text-mode-hook))
    (add-hook hook #'whitespace-mode))
  (add-hook 'before-save-hook #'whitespace-cleanup)
  :config
    (setq whitespace-line-column 100)
  (setq whitespace-style '(face tabs trailing lines-tail)))

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :init
  (global-flycheck-mode)
  :config
  (progn
    (setq-local flycheck-highlighting-mode nil)
    (setq-default flycheck-flake8-maximum-line-length 120)
    (setq-local flycheck-check-syntax-automatically nil)))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :init
  (progn
    (use-package smartparens-config)
    (smartparens-global-mode 1)))
