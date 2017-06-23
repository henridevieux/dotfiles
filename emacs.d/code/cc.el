(use-package cc-mode
  :ensure t
  :mode (("\\.cc$" . c++-mode)
	 ("\\.c$" . c-mode)
	 ("\\.h$" . c-mode))
  :config
  (use-package google-c-style
    :ensure t
    :init
    (progn
      (add-hook 'c-mode-common-hook 'google-set-c-style)
      (add-hook 'c-mode-common-hook 'google-make-newline-indent))
    :config
    (c-set-offset 'statement-case-open 0)))
