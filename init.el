(install-packs '(cl-lib
                 dash
                 melpa))

(add-hook 'ielm-mode-hook 'paredit-mode)

;; Load bindings config
(live-load-config-file "bindings.el")
