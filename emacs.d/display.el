;; Minimilist UI
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Font
(set-frame-font "Source Code Pro-14" nil t)

;; Make frame bigger upon initial loading
(add-to-list 'default-frame-alist '(height . 65))
(add-to-list 'default-frame-alist '(width . 200))

;; Show Line and column numbers
(global-visual-line-mode 1)
(setq column-number-mode t)

;; Smoother scrolling
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

;; Diminish unecessary modes
(diminish 'visual-line-mode)

;; Spacemacs theme
(use-package spacemacs-theme
  :ensure t
  :defer t
  :init (load-theme 'spacemacs-dark t))

;; Show lines
(use-package nlinum
  :ensure t
  :config (add-hook 'prog-mode-hook '(lambda () (nlinum-mode t))))

;; Perspective for managing workspaces
(use-package perspective
  :ensure t
  :config
  (persp-mode))
