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

;; Keep Emacs Custom-settings in a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(require 'setup-packages)
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
