;; add some additional package repositories
;; this is taken from https://blog.aaronbieber.com/2015/05/24/from-vim-to-emacs-in-fourteen-days.html
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa"))
;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)             


;; TODO set up use-package to manage packages
;; TODO set up helm?
;; TODO set up projectile?
;; TODO set up yasnippet?


;; set default window geometry
(setq default-frame-alist '((width . 80) (height . 65) (menu-bar-lines . 1)))
(setq initial-frame-alist '((width . 80) (height . 65) ))

(setq mouse-autoselect-window t)
;;(setq focus-follows-mouse t)

(global-set-key (kbd "M-o") 'ace-window)

;; scons stuff
(setq auto-mode-alist
      (append '(("SConstruct" . python-mode)
                ("SConscript" . python-mode)
                )
              auto-mode-alist))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-matching-paren t)
 '(c-basic-offset 4)
 '(indent-tabs-mode nil)
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (ace-window helm magit org)))
 '(paren-ding-unmatched t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "black" :foreground "white" :weight normal :height 98 :width normal :foundry "1ASC" :family "Liberation Mono" :slant normal))))
 '(font-lock-comment-face ((t (:foreground "green3"))))
 '(font-lock-doc-string-face ((t (:foreground "light green"))) t)
 '(font-lock-function-name-face ((t (:foreground "blue2"))))
 '(font-lock-keyword-face ((t (:foreground "red2"))))
 '(font-lock-preprocessor-face ((t (:foreground "purple3"))))
 '(font-lock-string-face ((t (:foreground "dark gray"))))
 '(font-lock-type-face ((t (:foreground "magenta"))))
 '(font-lock-variable-name-face ((t (:foreground "light blue"))))
 '(paren-match ((t (:background "hot pink"))) t))



