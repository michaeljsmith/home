; Remove ui elements.
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(add-to-list 'load-path "~/.emacs.d/site-lisp")

; Enable vimpulse and surround.
(add-to-list 'load-path "~/.emacs.d/site-lisp/vimpulse")
(add-to-list 'load-path "~/.emacs.d/site-lisp/vimpulse-surround")
(require 'vimpulse)
(require 'vimpulse-surround)
