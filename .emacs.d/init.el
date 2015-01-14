(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/python-mode.el-6.1.3/")

;; package
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)


;; Globals
(setq column-number-mode t)
(setq js-indent-level 2)
(setq line-number-mode t)
(setq py-install-directory "~/.emacs.d/python-mode.el-6.1.3/")
(setq sgml-basic-offset 2)
(setq-default indent-tabs-mode nil)
(setq-default show-trailing-whitespace t)


;; C, C++, Objective-C
(add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(define-key global-map (kbd "M-g") 'goto-line)
(setq cc-other-file-alist
'(("\\.cpp$" (".h" ".hpp"))
  ("\\.h$" (".cpp" ".c" ".mm" ".m"))
  ("\\.mm$" (".h"))
  ("\\.m$" (".h"))
  ("\\.hpp$" (".cpp" ".c"))
))
(add-hook 'c-mode-common-hook (lambda() (local-set-key (kbd "C-c o") 'ff-find-other-file)))
(setq ff-search-directories '("." "/usr/include" "/usr/local/include"))
(add-hook 'c-mode-common-hook (lambda() (c-set-offset 'substatement-open 0)))
(add-hook
 'c-mode-common-hook
 '(lambda ()
    (require 'google-c-style)
    (google-set-c-style)

    (require 'flymake-cursor)
    (require 'flymake-google-cpplint)
    (custom-set-variables
     '(flymake-google-cpplint-command "/Users/charlie/bin/.cpplint")
     '(flymake-google-cpplint-root "--root=blocks/blocks/internal/native")
     '(flymake-google-cpplint-filter "--filter=-runtime/references")
     )
    (flymake-google-cpplint-load)

    ))


;; Python
(autoload 'python-mode "python-mode" "Python Mode" t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(with-eval-after-load "python-mode"
 (elpy-enable)
 (require 'flymake-cursor)
 )


;; SQL
(add-to-list 'auto-mode-alist '("\\.sql\\'" . sql-mode))
(with-eval-after-load "sql"
  (load-library "sql-indent")
  )

;; Git
;;(require 'git)  ;; This is too slow, commenting it out for now
(autoload 'git-blame-mode "git-blame"
  "Minor mode for incremental blame for Git." t)
