(use-package python
  :ensure t
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :config
  (setq-default indent-tabs-mode nil)
  (setq electric-indent-mode 1)
  (setq python-check-command "pyflakes")
  (setq default-tab-width 4))
