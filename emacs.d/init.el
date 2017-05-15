(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

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
;; Necessary for neotree to work with evil mode  
(add-hook 'neotree-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;; Projectile
(use-package projectile
  :ensure t
  :commands (projectile-find-file projectile-find-dir)
  :config
  (projectile-global-mode t)
  (setq projectile-switch-project-action 'neotree-projectile-action))

;; Ivy
(use-package ivy
  :ensure t
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

;; Load common files
(load "~/.emacs.d/functions")
(load "~/.emacs.d/display")
(load "~/.emacs.d/keybindings")

;; Language specific configurations live in this directory
(load-directory "~/.emacs.d/code")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (go-eldoc evil-escape which-key use-package spacemacs-theme general evil avy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
