;; $Id: .emacs 70 2015-08-10 03:32:11Z andreas $
;;
;; Config file for emacs
;;

;; Enable line and column numbers
(line-number-mode t)
(column-number-mode t)

;; highlight matching parentheses
(show-paren-mode t)

;; Turn on auto-fill mode by default
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; disable menubar, toolbar and scrollbar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))



;; Set indentation to 4 spaces, non-indented brackets and automatic 
;; indentation after line-feed
(setq-default c-basic-offset 4)
(setq-default c-default-style "linux")
(add-hook 'c-mode-common-hook '(lambda () (define-key c-mode-map "\C-m" 'newline-and-indent)))


;; automatic indent new lines
;; DOES NOT WORK
;;(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

;; save minibuffer history
(load-library "savehist")
(savehist-mode t)


;; User Interface Options, look and feel

;; Set the default font face for Windows Emacs.
(set-face-attribute 'default nil :font "Source Code Pro-10")

;; Select a color theme - does not work on raspbian
;; (load-theme 'wheatgrass t)

;; fill column indicator
;; download library from http://www.emacswiki.org/emacs/FillColumnIndicator)
;(load-library "fill-column-indicator")
;(add-hook 'c-mode-hook 'fci-mode)


;; Backup files config

;; Backup files go to the .saves directory inside HOME
(setq backup-directory-alist `(("." . "~/.saves")))

;; Use copying to create backup files (slow, but no issues with linked
;; files, etc.)
(setq backup-by-copying t)

;; detailed config...
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

