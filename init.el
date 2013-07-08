(install-packs '(cl-lib
                 dash
                 melpa
                 ;; keep the packages locally (offline work)
                 package-store
                 page-break-lines
                 ert
                 ert-expectations
                 el-mock))

(add-hook 'ielm-mode-hook 'paredit-mode)

(require 'page-break-lines)

;; activate the reading of line instead of ^L
(global-page-break-lines-mode t)

;; Load bindings config
(live-load-config-file "bindings.el")
