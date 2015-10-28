;;; elisp-pack.el --- Emacs-lisp

;;; Commentary:

;;; Code:

(use-package bug-hunter)
(use-package ert)
(use-package ert-expectations)
(use-package el-mock)
(use-package goto-last-change)
(use-package cl-lib)
(use-package dash)
(use-package dash-functional)
(use-package bug-hunter)
(use-package overseer)

(use-package autoinsert
  :config (auto-insert-mode 1))

(use-package aggressive-indent
  :config (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode))

(use-package smartscan)
(use-package overseer)

(use-package lisp-mode
  :config
  (add-hook 'emacs-lisp-mode-hook
            (lambda ()
              (local-set-key (kbd "C-c m s") 'eval-and-replace)
              (local-set-key (kbd "C-c m b") 'eval-buffer)
              (local-set-key (kbd "C-c m e") 'eval-last-sexp)
              (local-set-key (kbd "C-c m i") 'eval-expression)
              (local-set-key (kbd "C-c m d") 'eval-defun)
              (local-set-key (kbd "C-c m n") 'eval-print-last-sexp)
              (local-set-key (kbd "C-c m r") 'eval-region)))
  (add-hook 'emacs-lisp-mode-hook 'smartscan-mode)
  (add-hook 'emacs-lisp-mode-hook 'overseer-mode)
  (define-key lisp-mode-shared-map (kbd "C-c C-z") 'ielm))

(use-package ielm
  :config (add-hook 'ielm-mode-hook 'paredit-mode))

;; to display a beautiful line instead of the ugly ^L
(use-package page-break-lines
  :config
  ;; activate the reading of line instead of ^L
  (global-page-break-lines-mode t))

(use-package files
  :config
  (add-to-list 'auto-mode-alist '("Cask$" . emacs-lisp-mode))
  (add-to-list 'auto-mode-alist '("\\.feature$" . perl-mode)))

;; Try and look for the electric highlight
(defun copy-sexp (&optional arg)
  "Kill the sexp (balanced expression) following point.
With ARG, kill that many sexps after point.
Negative arg -N means kill N sexps before point.
This command assumes point is not in a string or comment."
  (interactive "p")
  (save-excursion
    (let ((opoint (point)))
      (forward-sexp (or arg 1))
      (copy-region-as-kill opoint (point)))))

(use-package emr
  :config
  (autoload 'emr-show-refactor-menu "emr"))

(use-package prog-mode
  :config
  (define-key prog-mode-map (kbd "M-RET") 'emr-show-refactor-menu)
  (add-hook 'prog-mode-hook 'emr-initialize))

(defun trace-functions (fns)
  "Trace functions FNS."
  (mapc 'trace-function fns))

(defun untrace-functions (fns)
  "Trace functions FNS."
  (mapc 'untrace-function fns))

(provide 'elisp-pack)
;;; elisp-pack.el ends here
