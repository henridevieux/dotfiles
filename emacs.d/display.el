;; Make frame bigger upon initial loading
(add-to-list 'default-frame-alist '(height . 65))
(add-to-list 'default-frame-alist '(width . 200))

;; Spacemacs theme
(use-package spacemacs-theme
  :ensure t
  :init (load-theme 'spacemacs-dark t))

;; Show lines
(global-linum-mode t)
