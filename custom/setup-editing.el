;; GROUP: Editing -> Editing Basics
(setq mode-require-final-newline t      ; add a newline to end of file
      tab-width 4                       ; default to 4 visible spaces to display a tabs
      )

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(setq-default indent-tabs-mode nil)     ; make indentation commands use space only
(delete-selection-mode)
(global-set-key (kbd "RET") 'newline-and-indent)

;; Show whitespace in diff-mode
(add-hook 'diff-mode-hook (lambda ()
                            (setq-local whitespace-style
                                        '(facetabs
                                          tab-mark
                                          spaces
                                          space-mark
                                          trailing
                                          indentation::space
                                          indentation::tab
                                          newline
                                          newline-mark))
                            (whitespace-mode 1)))

;; PACKAGE: iedit
(use-package iedit
  :bind (("C-;" . iedit-mode))
  :init
  (setq iedit-toggle-key-default nil))

;; Show a ruler in the 80th column
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; Enable display of line numbers in all programming modes
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(set-face-attribute 'line-number-current-line nil :foreground "#f8f8f2")
(set-face-attribute 'line-number-current-line nil :background "#44475a")
(add-hook 'prog-mode-hook #'hl-line-mode)

(defun smart-open-line ()
  "Insert an empty line after the current line.
   Position the cursor at its beginning, according to the current mode."
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(defun smart-open-line-above ()
  "Insert an empty line above the current line.
   Position the cursor at its beginning. according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(shift return)] 'smart-open-line)
(global-set-key [(control shift return)] 'smart-open-line-above)

(require 'ialign)
(global-set-key (kbd "C-x a") #'ialign)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C->") 'mc/unmark-previous-like-this)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(provide 'setup-editing)
