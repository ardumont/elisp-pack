;;; elisp-pack.el --- Emacs-lisp

;;; Commentary:

;;; Code:

(require 'bug-hunter)
(require 'el-mock)
(require 'goto-last-change)
(require 'cl-lib)
(require 'dash)
(require 'dash-functional)

(require 'autoinsert)
(auto-insert-mode 1)

(require 'aggressive-indent)
(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)

(require 'overseer)

(require 'lisp-mode)
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c m b") 'eval-buffer)
	    (local-set-key (kbd "C-c m e") 'eval-last-sexp)
	    (local-set-key (kbd "C-c m i") 'eval-expression)
	    (local-set-key (kbd "C-c m d") 'eval-defun)
	    (local-set-key (kbd "C-c m n") 'eval-print-last-sexp)))

(add-hook 'emacs-lisp-mode-hook 'overseer-mode)
(define-key lisp-mode-shared-map (kbd "C-c C-z") 'ielm)

(require 'ielm)
(add-hook 'ielm-mode-hook 'paredit-mode)

;; to display a beautiful line instead of the ugly ^L
(require 'page-break-lines)
;; activate the reading of line instead of ^L
(global-page-break-lines-mode t)

(require 'files)
(add-to-list 'auto-mode-alist '("Cask$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.feature$" . perl-mode))

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

(require 'emr)
(autoload 'emr-show-refactor-menu "emr")

(require 'prog-mode)
(define-key prog-mode-map (kbd "M-RET") 'emr-show-refactor-menu)
(add-hook 'prog-mode-hook 'emr-initialize)

(defun trace-functions (fns)
  "Trace functions FNS."
  (mapc 'trace-function fns))

(defun untrace-functions (fns)
  "Trace functions FNS."
  (mapc 'untrace-function fns))

(provide 'elisp-pack)
;;; elisp-pack.el ends here
