;; (use-package python
;;   :ensure t
;;   :mode (("\\.py\\'" . python-mode)
;;          ("\\.pyst\\'" . python-mode))
;;   :interpreter ("python" . python-mode)
;;   :config
;;   (setq-default indent-tabs-mode nil)
;;   (setq electric-indent-mode 1)
;;   (setq python-check-command "pyflakes")
;;   (setq whitespace-line-column 120)
;;   (setq default-tab-width 4))

(use-package python
  :ensure t
  :mode (("\\.py\\'" . python-mode)
         ("\\.pyst\\'" . python-mode))
  :config
  (use-package elpy
    :ensure t
    :diminish Elpy
    :commands elpy-enable
    :config
    (setq-default indent-tabs-mode nil)
    (setq electric-indent-mode 1)
    (setq python-check-command "pyflakes")
    (setq default-tab-width 4)
    (progn
      (when (require 'flycheck nil t)
        (remove-hook 'elpy-modules 'elpy-module-flymake)
        (remove-hook 'elpy-modules 'elpy-module-yasnippet)
        (remove-hook 'elpy-mode-hook 'elpy-module-highlight-indentation)
        (add-hook 'elpy-mode-hook 'flycheck-mode))))
   (elpy-enable)
   (pyvenv-activate "~/src/python-env"))

