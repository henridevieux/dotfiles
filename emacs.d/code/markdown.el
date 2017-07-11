(use-package markdown-mode
  :ensure t
  :mode (("README\\.md$" . gfm-mode)
	 ("\\.md$" . markdown-mode)
	 ("\\.markdown$" . markdown-mode))
  :commands (markdown-mode))
