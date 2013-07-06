(install-packs '(cl-lib
                 dash
                 melpa
                 ;; keep the packages locally (offline work)
                 package-store
                 page-break-lines))

(add-hook 'ielm-mode-hook 'paredit-mode)

(add-hook 'emacs-lisp-mode-hook 'page-break-lines-mode)

;; Load bindings config
(live-load-config-file "bindings.el")
