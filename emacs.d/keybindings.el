(use-package evil
  :ensure t
  :config
  (setq evil-default-cursor t)
  (evil-mode 1))

(use-package evil-escape
  :ensure t
  :diminish evil-escape-mode
  :config
  (evil-escape-mode)
  (setq-default evil-escape-key-sequence "kj")
  (setq-default evil-escape-delay 0.2))

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
     "h" 'windmove-left
     "j" 'windmove-down
     "k" 'windmove-up
     "l" 'windmove-right
     ;; Perspective workspace management
     "TAB" 'persp-next
     "C-n" 'persp-switch
     "C-r" 'persp-rename
     "C-x" 'persp-kill
     ;; Shell manipulation
     "s" 'ansi-term
     ;; NeoTree
     "t" 'neotree-toggle
     ;; Projectile
     "p" 'projectile-find-file-in-directory
     ;; Code management
     "C-c" 'comment-region
     "C-u" 'uncomment-region
     ;; File and Buffer management
     "b" 'ibuffer
     "w" 'save-buffer
     "x" 'delete-window
     "q" 'kill-this-buffer
     "f" 'counsel-find-file
     ;; Misc admin
     "SPC" 'counsel-M-x))

;; Necessary for neotree to work with evil mode
(add-hook 'neotree-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
