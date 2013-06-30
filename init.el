;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

(add-hook 'ielm-mode-hook 'paredit-mode)

;; Load bindings config
(live-load-config-file "bindings.el")
