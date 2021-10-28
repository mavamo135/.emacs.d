;; Install packages
(defvar my-packages
  '(ace-window
    anaconda-mode
    buffer-move
    command-log-mode
    company-anaconda
    company-box
    dashboard
    diff-hl
    dracula-theme
    emmet-mode
    expand-region
    flycheck-popup-tip
    flycheck-posframe
    helm
    ialign
    iedit
    magit
    mood-line
    multiple-cursors
    projectile
    rainbow-mode
    smartparens
    sr-speedbar
    tree-sitter
    tree-sitter-langs
    use-package
    visual-regexp
    web-mode
    ws-butler
    yasnippet-snippets))

;; Scans the list in my-packages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      my-packages)

(provide 'setup-packages)
