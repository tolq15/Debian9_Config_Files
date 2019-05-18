;; =============================
;; Backspace ==> Delete Backward
;; =============================
;;(define-key c-mode-map 'DEL' delete-char)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(global-set-key "\C-h" 'delete-backward-char)

;; Make ure "C-h" work in search, too
(setq search-delete-char (string-to-char "\C-h"))

;; ============================
;; AL: Function keys
;; ============================
(global-set-key [f1]  'forward-word)
(global-set-key [f2]  'backward-word)
(global-set-key [f3]  'kill-word)
(global-set-key [f4]  'backward-kill-word)
(global-set-key [f5]  'other-window)
(global-set-key [f6]  'search-forward)
(global-set-key [f7]  'search-backward)
(global-set-key [f8]  'query-replace)
(global-set-key [f9]  'compile)
(global-set-key [f10] 'shell)
(global-set-key [f11] 'switch-to-buffer)
(global-set-key [f12] 'save-buffers-kill-emacs)

;; ============================
;; AL: Shifted Function keys
;; ============================
;;
;; This is an later native to using the command tmm-menubar.
;;
(global-set-key "\C-xl" 'goto-line)

;;
;; Make searches case sensitive
;;
(setq-default case-fold-search nil)

;;
;; Scroll one line at a time
;;
(setq scroll-step 1)

;; Maximum colors
(setq font-lock-maximum-decoration t)
(global-font-lock-mode t)

;;
;; For the interactive shell
;;
(setq exec-path (cons "/bin" exec-path))
(setq shell-file-name "/bin/bash")

;; For subprocesses invoked via the shell (e.g., "shell -c command")
;;(setq shell-file-name explicit-shell-file-name)
(setenv "SHELL" shell-file-name)
(setq explicit-shell-file-name shell-file-name) ; Interactive shell
(setq ediff-shell shell-file-name)      ; Ediff shell
(setq explicit-shell-args '("--login" "-i"))
(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t)

;; highlight region between point and mark
(transient-mark-mode t)
;; highlight during query
(setq query-replace-highlight t)
;; highlight incremental search
(setq search-highlight t)

;; Show matching parenthesis. How can you live without it.
(show-paren-mode t)

;;
;; Current line & column of cursor in the mode line (bar at the bottom)
;;
(line-number-mode 1)
(setq column-number-mode t)

;;Add perl print template
(defun insert-perl-print ()
   "Add perl print template"
   (interactive "*")
   (setq steve-var "print \"\\n\";")
   (insert steve-var)
)

;; Insert spaces instead of tabs
(setq-default indent-tabs-mode nil)

;;
;; autoindenting on
;;
(global-set-key "\r" 'newline-and-indent)

;; Rebind `C-x C-b' for `buffer-menu'
;; Lists the buffers and moves point into that window
(global-set-key "\C-x\C-b" 'buffer-menu)

;; Display time in the mode line
;; Put this line last to prove (by the time in the mode line)
;; that the .emacs loaded without error to this point.
(setq display-time-day-and-date nil )
;;(display-time)

(put 'upcase-region 'disabled nil)

;;
;; for Debian in VM
;; to install Magit (and probably, POSTGRESQL)
;;
;;(require 'package)
;;(add-to-list 'package-archives
;;             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
