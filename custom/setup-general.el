(setq backup-dir
      (expand-file-name "backups/" user-emacs-directory))

(setq temp-dir
      (expand-file-name "temp/" user-emacs-directory))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,backup-dir)))

;; Write all autosave files in the tmp dir
(setq auto-save-file-name-transforms
      `((".*" ,temp-dir t)))
(setq auto-save-list-file-prefix temp-dir)

;; Don't write lock-files, I'm the only one here
(setq create-lockfiles nil)

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t
 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t)

;; Use right Alt for special keyboard characters
(setq ns-right-alternate-modifier 'none)

(nano-modeline-mode)

;; PACKAGE: sr-speedbar
(require 'sr-speedbar)
(with-eval-after-load "speedbar"
  (autoload 'sr-speedbar-toggle "sr-speedbar" nil t)
  (global-set-key (kbd "s-s") 'sr-speedbar-toggle))

;; Set enabled color theme
(load-theme 'nano-light t)
(enable-theme 'nano-light)

;; PACKAGE: projectile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Enable CUA mode for rectangles and disable any other CUA bindings
(setq cua-delete-selection nil)
(setq cua-enable-cua-keys nil)
(cua-mode 1)

;; Configure key bindings to shrink or enlarge window
(global-set-key (kbd "S-C-<left>")  'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>")  'shrink-window)
(global-set-key (kbd "S-C-<up>")    'enlarge-window)

;; PACKAGE: buffer-move
;; Configure key bindings to move buffers between windows
(require 'buffer-move)
(global-set-key (kbd "<M-S-up>")     'buf-move-up)
(global-set-key (kbd "<M-S-down>")   'buf-move-down)
(global-set-key (kbd "<M-S-left>")   'buf-move-left)
(global-set-key (kbd "<M-S-right>")  'buf-move-right)

;; PACKAGE: ace-window
;; ace-window is used to select other window, similar to C-x o
;; but ace-window displays a number above the available windows
;; and windows are selected using the numbers
(global-set-key (kbd "M-o") 'ace-window)

;; Configure font size
(set-frame-font "RobotoMono Nerd Font 16" nil t)

;; PACKAGE: dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-startup-banner 'logo)
(setq dashboard-items '((projects . 5)
                        (recents . 5)))
(setq dashboard-set-init-info t)
(setq dashboard-set-footer nil)
(setq dashboard-projects-backend 'projectile)

(require 'tree-sitter)
(require 'tree-sitter-langs)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(provide 'setup-general)
