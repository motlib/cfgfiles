

;; Enable line and column numbers
(line-number-mode t)
(column-number-mode t)

;; highlight matching parentheses
(show-paren-mode t)

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

