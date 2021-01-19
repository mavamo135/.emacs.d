;; Disable menu, toolbar and scroll bar mode
;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;; Disable startup screen
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(setq custom-dir
      (expand-file-name "custom" user-emacs-directory))

(add-to-list 'load-path custom-dir)
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/doxymacs")

(require 'setup-general)
(if (version< emacs-version "24.4")
  (require 'setup-ivy-counsel)
  (require 'setup-helm))
(require 'setup-editing)
(require 'setup-cedet)
;;(require 'setup-ede-projects)
(require 'setup-company)
(require 'setup-flycheck)
(require 'setup-c)
(require 'setup-python)
(require 'setup-yasnippet)
(require 'doxymacs)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ns-right-alternate-modifier (quote none))
 '(package-selected-packages
   (quote
    (magit jedi expand-region multiple-cursors ialign command-log-mode buffer-move ace-window dashboard dracula-theme flycheck-pos-tip flycheck-posframe flycheck-popup-tip yasnippet-snippets company-jedi sr-speedbar helm yasnippet-classic-snippets use-package projectile nyan-mode irony-eldoc iedit ggtags flycheck-irony company-irony auto-complete-c-headers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
