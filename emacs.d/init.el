(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Disable bell sounds
(setq ring-bell-function 'ignore)


;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; NeoTree
(use-package neotree
  :ensure t
  :commands (neotree-toggle)
  :init
  (progn
    ;; Jump to current file when opening neotree
    (setq-default neo-smart-open t)
    ;; Neotree can't be open by itself
    (setq-default neo-dont-be-alone t))
)

;; Undo-Tree
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :init (global-undo-tree-mode))

;; Projectile
(use-package projectile
  :ensure t
  :diminish projectile-mode
  :commands (projectile-find-file projectile-find-dir)
  :config
  (projectile-mode t)
  (setq projectile-switch-project-action 'neotree-projectile-action))

;; Ivy
(use-package ivy
  :ensure t
  :diminish ivy-mode
  :config
  (progn
    ;; Disable ido, to use ivy instead
    (with-eval-after-load 'ido
      (ido-mode -1)
      (ivy-mode 1)))
)

;; Counsel
(use-package counsel
  :ensure t)

;; Magit
(use-package magit
  :ensure t
  :commands (magit-status))

;; Diminish
(use-package diminish
  :ensure t)

;; Load common files
(load "~/.emacs.d/functions")
(load "~/.emacs.d/display")
(load "~/.emacs.d/keybindings")
(load "~/.emacs.d/shell")


;; Language specific configurations live in this directory
(load-directory "~/.emacs.d/code")

;; Fix backing up of files
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck-rust google-c-style markdown-mode go-autocomplete go-eldoc evil-escape which-key use-package spacemacs-theme general evil avy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
