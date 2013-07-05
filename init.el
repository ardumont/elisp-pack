(install-packs '(cl-lib
                 dash
                 melpa
                 ;; keep the packages locally (offline work)
                 package-store))

(add-hook 'ielm-mode-hook 'paredit-mode)

;; Load bindings config
(live-load-config-file "bindings.el")
