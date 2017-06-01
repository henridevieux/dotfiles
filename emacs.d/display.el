;; Make frame bigger upon initial loading
(add-to-list 'default-frame-alist '(height . 65))
(add-to-list 'default-frame-alist '(width . 200))

;; Spacemacs theme
(use-package spacemacs-theme
  :ensure t
  :init (load-theme 'spacemacs-dark t))

;; Show lines
(use-package nlinum
  :ensure t
  :config (add-hook 'prog-mode-hook '(lambda () (nlinum-mode t))))

;;(add-hook 'shell-mode-hook (lambda ()
 ;;(linum-mode -1)))

;; Perspective for managing workspaces
(use-package perspective
  :ensure t
  :config
  (persp-mode))
