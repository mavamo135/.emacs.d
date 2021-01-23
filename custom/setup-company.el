(require 'company)
(require 'company-semantic)

(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-semantic)
(setq company-tooltip-align-annotations t)

(defvar-local company-flycheck-popup-mode-on-p nil)

(defun company-turn-off-flycheck-popup (&rest ignore)
  (when (boundp 'flycheck-popup-tip-mode)
    (setq company-flycheck-popup-mode-on-p flycheck-popup-tip-mode)
    (when flycheck-popup-tip-mode (flycheck-popup-tip-mode -1))
    (when flycheck-mode (flycheck-mode -1))))

(defun company-maybe-turn-on-flycheck-popup (&rest ignore)
  (when company-flycheck-popup-mode-on-p (flycheck-popup-tip-mode 1))
  (when company-flycheck-popup-mode-on-p (flycheck-mode 1)))

(add-hook 'company-completion-started-hook 'company-turn-off-flycheck-popup)
(add-hook 'company-completion-finished-hook 'company-maybe-turn-on-flycheck-popup)
(add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-flycheck-popup)

(require 'company-box)
(add-hook 'company-mode-hook 'company-box-mode)

(provide 'setup-company)
