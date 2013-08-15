(install-packs '(cl-lib
                 dash
                 melpa
                 ;; keep the packages locally (offline work)
                 package-store
                 page-break-lines
                 ert
                 ert-expectations
                 el-mock
                 goto-last-change))

(add-hook 'ielm-mode-hook 'paredit-mode)

;; to display a beautiful line instead of the ugly ^L
(require 'page-break-lines)

;; indentation rule they use bother me
(require 'dash)

(put 'if 'lisp-indent-function 0)
(put 'when 'lisp-indent-function 0)
(put '-> 'lisp-indent-function 0)
(put '->> 'lisp-indent-function 0)
(put '-> 'lisp-indent-function 0)
(put '-when-let 'lisp-indent-function 0)
(put '-when-let* 'lisp-indent-function 0)
(put '--when-let 'lisp-indent-function 0)
(put '-if-let 'lisp-indent-function 0)
(put '-if-let* 'lisp-indent-function 0)
(put '--if-let 'lisp-indent-function 0)

;; activate the reading of line instead of ^L
(global-page-break-lines-mode t)

;; Load bindings config
(live-load-config-file "bindings.el")
