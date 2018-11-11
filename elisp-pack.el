;;; elisp-pack.el --- Emacs-lisp

;;; Commentary:

;;; Code:

;; internal libs
(require 'lisp-mode)
(require 'cl-lib)
(require 'autoinsert)
(require 'ielm)
(require 'files)

;; external libs
(require 'bug-hunter)
(require 'el-mock)
(require 'goto-last-change)
(require 'dash-functional)
(require 'aggressive-indent)
(require 'overseer)
(require 'page-break-lines)
(require 'emr)

(auto-insert-mode 1)

(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c m b") 'eval-buffer)
	    (local-set-key (kbd "C-c m e") 'eval-last-sexp)
	    (local-set-key (kbd "C-c m i") 'eval-expression)
	    (local-set-key (kbd "C-c m d") 'eval-defun)
	    (local-set-key (kbd "C-c m n") 'eval-print-last-sexp)))
(add-hook 'emacs-lisp-mode-hook 'overseer-mode)
(add-hook 'ielm-mode-hook 'paredit-mode)

;; to display beautiful lines instead of ugly ^L
(global-page-break-lines-mode t)

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

(autoload 'emr-show-refactor-menu "emr")
(add-hook 'emacs-lisp-mode-hook 'emr-initialize)

(define-key emacs-lisp-mode-map (kbd "M-RET") 'emr-show-refactor-menu)
(define-key emacs-lisp-mode-map (kbd "C-c C-z") 'ielm)

(defun trace-functions (fns)
  "Trace functions FNS."
  (mapc 'trace-function fns))

(defun untrace-functions (fns)
  "Trace functions FNS."
  (mapc 'untrace-function fns))

(provide 'elisp-pack)
;;; elisp-pack.el ends here
