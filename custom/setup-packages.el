;; Install packages
(defvar my-packages
  '(ace-window
    anaconda-mode
    buffer-move
    command-log-mode
    company-anaconda
    company-box
    dashboard
    dracula-theme
    expand-region
    flycheck-popup-tip
    flycheck-posframe
    helm
    ialign
    iedit
    magit
    multiple-cursors
    nyan-mode
    projectile
    sr-speedbar
    use-package
    yasnippet-snippets))

;; Scans the list in my-packages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      my-packages)

(provide 'setup-packages)
