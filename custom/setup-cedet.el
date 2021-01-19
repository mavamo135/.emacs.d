(require 'cc-mode)
(require 'cedet)

;; Enables global support for Semanticdb
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
;; Enables automatic bookmarking of tags that you edited, so you can return to
;; them later with the semantic-mrub-switch-tags command
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
;; Activates CEDET's context menu that is bound to right mouse button
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
;; Activates mode when name of current tag will be shown in top line of buffer
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
;; Activates use of separate styles for tags decoration (depending on tag's class)
(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
;; Activates highlighting of local names that are the same as name of tag under cursor
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
;; Activates automatic parsing of source code in the idle time
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
;; Activates displaying of possible name completions in the idle time
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)
;; Activates displaying of information about current tag in the idle time
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)

(semantic-mode 1)

(require 'semantic)
(require 'semantic/bovine/c)
(require 'semantic/bovine/gcc)
(require 'semantic/db)
(require 'semantic/ia)

(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)

(setq-mode-local c-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))

(defun my-cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))

(add-hook 'c-mode-common-hook 'my-cedet-hook)
(add-hook 'c-mode-hook 'my-cedet-hook)
(add-hook 'c++-mode-hook 'my-cedet-hook)

(require 'srecode)
(global-srecode-minor-mode 1)

(require 'ede)
(global-ede-mode 1)
(ede-enable-generic-projects)

(require 'etags)
(unless (fboundp 'push-tag-mark)
  (defun push-tag-mark ()
    "Push the current position to the ring of markers so that
     \\[pop-tag-mark] can be used to come back to current position."
    (interactive)
    (ring-insert find-tag-marker-ring (point-marker))))

(provide 'setup-cedet)
