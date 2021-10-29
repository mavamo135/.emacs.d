(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

(add-hook 'web-mode-hook (lambda ()
                           (setq web-mode-markup-indent-offset 2)
                           (setq web-mode-code-indent-offset 2)
                           (setq web-mode-css-indent-offset 2)
                           (setq web-mode-enable-current-element-highlight t)
                           (set (make-local-variable 'company-backends)
                                '(company-css company-web-html company-yasnippet company-files))))

(require 'emmet-mode)

(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

(require 'rainbow-mode)
(add-hook 'css-mode-hook #'rainbow-mode)

(provide 'setup-web)
