(add-to-list 'load-path "~/.emacs.d/")
(load "google-c-style.el")
(setq line-number-mode t)
(setq column-number-mode t)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))
(define-key global-map (kbd "M-g") 'goto-line)
(setq cc-other-file-alist
'(("\\.cpp$" (".h" ".hpp"))
  ("\\.h$" (".cpp" ".c" ".mm" ".m"))
  ("\\.mm$" (".h"))
  ("\\.m$" (".h"))
  ("\\.hpp$" (".cpp" ".c"))
))


(add-hook 'c-mode-common-hook (lambda() (local-set-key (kbd "C-c o") 'ff-find-other-file)))
(add-hook 'c-mode-common-hook (lambda() (c-set-offset 'substatement-open 0)))
(add-hook 'c-mode-common-hook 'google-set-c-style)

(setq ff-search-directories '("." "../src" "../include" "~/work/client"))
