(use-package company
  :ensure t
  :defer t
  :init (global-company-mode)
  :config
  (progn
    (setq company-tooltip-align-annotations t
          company-show-numbers t)
    (setq company-dabbrev-downcase nil))
  :diminish company-mode)

(use-package yasnippet
  :ensure t
  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
  (yas-global-mode 1))

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

;; (use-package flycheck
  ;; :ensure t
  ;; :diminish flycheck-mode
  ;; :init
  ;; (global-flycheck-mode)
  ;; :config
  ;; (progn
    ;; (setq-local flycheck-highlighting-mode nil)
    ;; (setq-default flycheck-flake8-maximum-line-length 120)
    ;; (setq-local flycheck-check-syntax-automatically nil)))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :init
  (progn
    (use-package smartparens-config)
    (smartparens-global-mode 1)))

(use-package lsp-mode
  :ensure t
  :init
  ;; (setq lsp-keymap-prefix "C-c l")
  :hook (go-mode . lsp-deferred)
  :commands (lsp lsp-deferred))
