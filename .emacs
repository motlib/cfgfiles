;;
;; Config file for emacs
;;
;; Author: Andreas Schroeder <andreas@a-netz.de>
;;

;; General Text Editing Settings
;; =============================

;; configure package manager
(require 'package)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(package-initialize)

;; bind shift-space to mark command additionally to ctrl-space (does
;; not work on android-ssh)
(global-set-key (kbd "S-SPC") 'set-mark-command)

;; enable commands for upper-case and lower-case region
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Extend the load path to user specific scripts.
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Enable line and column number display in the mode line
(line-number-mode t)
(column-number-mode t)

;; highlight matching parentheses
(show-paren-mode t)

;; We want to control emacs by keyboard, so disable menubar, toolbar
;; and scrollbar.
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Save history of input into minibuffer.
(load-library "savehist")
(savehist-mode t)

;; Load library to support yaml mode. 
(load-library "yaml-mode")

;; Filling Settings
;; Load library to show fill collumn indicator
(setq-default fill-column 80)
(load-library "fill-column-indicator")
(add-hook 'text-mode-hook 'fci-mode)
;; Turn on auto-fill mode by default
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'c-mode-hook 'fci-mode)
(add-hook 'python-mode-hook 'fci-mode)


;; Load support for markdown mode
(load-library "markdown-mode")

;; Settings for Software Development
;; =================================

;; Set indentation to 4 spaces, non-indented brackets and automatic 
;; indentation after line-feed
(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)
(setq-default c-default-style "bsd")
(c-set-offset 'arglist-intro '+)
(add-hook 'c-mode-common-hook
	  '(lambda () (define-key c-mode-map "\C-m" 'newline-and-indent)))


;; User Interface Options
;; ======================

;; Set the default font face for Windows Emacs.
(if (string-equal system-type "windows-nt")
    (set-face-attribute 'default nil :font "Source Code Pro-10:bold"))

;; Select a color theme - does not work on raspbian, because emacs
;; version 23 used there.
(if (>= emacs-major-version 24)
    (load-theme 'misterioso t))



;; Backup files config
;; ===================

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

(setq inhibit-startup-screen 1)

;; set up neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme 'ascii)
;; neotree window is not fixed width
(setq neo-window-fixed-size 'nil)

;; Hotkeys to simplify resizing windows
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (yaml-mode markdown-mode php-mode neotree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
