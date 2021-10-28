(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))

(defun disable-semantic-idle-summary-mode ()
  "Disable semantic-idle-summary in Python mode.
Useful information can't be properly displayed when this mode is
enabled since the minibuffer is cleared all the time."
  (global-semantic-idle-summary-mode 0))

(add-hook 'python-mode-hook 'disable-semantic-idle-summary-mode t)

(provide 'setup-python)
