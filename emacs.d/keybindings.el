(use-package evil
  :ensure t
  :config
  (setq evil-default-cursor t)
  (evil-mode 1))

(use-package evil-escape
  :ensure t
  :config
  (evil-escape-mode)
  (setq-default evil-escape-key-sequence "kj"))

;; Modes that need to work with Evil
(setq evil-emacs-state-modes
      (delq 'ibuffer-mode evil-emacs-state-modes))

(use-package general
  :ensure t
  :config
  (general-evil-setup t)
  (nvmap
     :prefix "SPC"
     ;; Moving around
     "C-f" 'toggle-fullscreen
     "." 'split-window-vertically
     "/" 'split-window-horizontally
     "C-h" 'windmove-left
     "C-j" 'windmove-down
     "C-k" 'windmove-up
     "C-l" 'windmove-right
     "TAB" 'next-buffer
     ;; NeoTree
     "t" 'neotree-toggle
     ;; Projectile
     "p" 'projectile-find-file
     ;; Dired
     "f" 'dired
     ;; File and Buffer management
     "b" 'ibuffer
     "w" 'save-buffer
     "x" 'delete-window
     "q" 'kill-this-buffer
     ;; Misc admin
     "SPC" 'counsel-M-x))
    
