;; Configuration of irony mode for C/C++
(require 'flycheck)

(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)

(add-hook 'c-mode-hook
          (lambda ()
            (setq flycheck-clang-language-standard "c11")))

(require 'flycheck-popup-tip)
(add-hook 'flycheck-mode-hook #'flycheck-popup-tip-mode)

(provide 'setup-flycheck)
