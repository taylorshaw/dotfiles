;;; emacs.el-- - Taylor's personal emacs init.el

;;;Commentary:

;; to get a list of available packages, use M-x package-list-packages
;; i marks package to install, u unmarks, x runs the install
;; to get all key bindings for the mode, do C-h m

;; to enter emacs customization interface, do M-x customize
;; to read about an emacs variable do C-h v <variable name>

;; articles ive read about emacs customization:
;; https://blog.aaronbieber.com/2015/07/05/a-gentle-introduction-to-emacs-configuration.html
;; https://github.com/caiorss/Emacs-Elisp-Programming/blob/master/README.org

;; places I've copied stuff from:
;; https://blog.aaronbieber.com/2015/05/24/from-vim-to-emacs-in-fourteen-days.html
;; https://emacs-doctor.com/emacs-strip-tease.html
;; https://github.com/ClintLiddick/dotfiles/blob/master/emacs.el (clint from aurora's dotfiles)

;; TODO set up helm ?
;; TODO set up projectile ?
;; TODO set up yasnippet ?

;;; Code:

;; do these early to aviod momentary display
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1)) ;; no tool bar
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode 0)) ;; no menu bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)) ;; no scroll bar
(setq inhibit-startup-screen t) ;; no startup screen



;; don't put custom-set-variables in emacs.el
;; maybe move this to emacs.d ? (expand-file-name "custom.el" user-emacs-directory)
(setq custom-file "~/.emacs-custom.el")
(load custom-file)

;; add some additional package repositories
;; this is taken from vim-to-emacs in 14 days
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)


;; manually install use-package package manager
;; https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; configure use-package
(setq use-package-always-ensure t) ;; always download and install packages
(setq use-package-always-pin "melpa") ;; prefer latest
(eval-when-compile
  (require 'use-package))
(require 'bind-key)
;;(require 'diminish)

;; automatically update packages daily
(use-package spu
  :defer
  :config (spu-package-upgrade-daily))


;; flycheck syntax checking
;; this is taken from clint's dotfiles
;;
;; Python - flake8
;; C++ - clang/gcc/cppcheck
;; Rust - cargo
;; Javascript - eslint
;; LaTeX - chktex
;; SQL - sqlint
(use-package flycheck
  :config
  (global-flycheck-mode)
  ;; (use-package flycheck-irony)
  ;; (add-hook 'flycheck-mode-hook 'flycheck-irony-setup)
  (add-hook 'c++-mode-hook
            (lambda()
              (setq flycheck-gcc-language-standard "c++14")
              (setq flycheck-clang-language-standard "c++14")))
  (add-hook 'c-mode-hook
            (lambda()
              (setq flycheck-gcc-language-standard "c11")
              (setq flycheck-clang-language-standard "c11")))
  (use-package flycheck-ycmd
    :config
    (flycheck-ycmd-setup))
    (use-package flycheck-rust)
)

;; C++ auto-formatting
;; XXX should set up the keybindings only for certain modes (c++-mode, c-mode, glsl-mode)
(use-package clang-format
  :config
  (global-set-key (kbd "M-f") 'clang-format-region) ;; XXX this replaces 'forward-word'
  (global-set-key (kbd "M-F") 'clang-format-buffer)
;;  (add-hook 'c-mode-common-hook
;;	    (function (lambda ()
;;			(add-hook 'before-save-hook
;;				  'clang-format-buffer))))
  )


;; ace-window
(use-package ace-window
  :config
  (global-set-key (kbd "M-o") 'ace-window)
  )
		  

;; ivy general completion
;; (use-package ivy
;;   :diminish (ivy-mode . "")
;;   :init
;;   (setq ivy-use-virtual-buffers t)
;;   (setq ivy-count-format "(%d/%d) ")
;;   :config
;;   (ivy-mode 1))
;; (use-package swiper)
;; (use-package ivy-hydra)
;; (use-package counsel
;;   :init
;;   :bind (("M-x" . counsel-M-x)
;;          ("C-x C-f" . counsel-find-file)
;;          ("C-c /" . counsel-rg)
;;          ("C-c l" . counsel-locate)))

;; projectile integration
;;(use-package projectile
;;  :config
;;  (projectile-global-mode))

(use-package neotree
  :config
  (require 'neotree)
  (setq neo-smart-open t)
  (global-set-key [f8] 'neotree-toggle)
  )
  

;; minimap seems to work better than sublimity for minimap, but still doesnt
;; work great. I think maybe try to turn on/off when scrolling?
;;(use-package minimap
;;  :config (minimap-mode 1))

;;(use-package sublimity
;;  :config (require 'sublimity)
  ;;(require 'sublimity-scroll)
  ;;(require 'sublimity-map)
  ;;(require 'sublimity-attractive)
  ;;(sublimity-mode 1)
  ;;(sublimity-map-set-delay 3)
  ;;(setq sublimity-map-size 20)
  ;;(setq sublimity-map-fraction 0.3)
  ;;(setq sublimity-map-text-scale -7)
;(add-hook 'sublimity-map-setup-hook
;          (lambda ()
;            (setq buffer-face-mode-face '(:family "Monospace"))
;            (buffer-face-mode)))
  ;;(sublimity-map-set-delay 5)
;;  )


;; yasnippet   (setup from https://www.reddit.com/r/emacs/comments/9bvawd/use_yasnippet_via_usepackage/)
(use-package yasnippet
  :ensure t
  :config
  (use-package yasnippet-snippets
    :ensure t)
  (yas-global-mode t)
  (yas-reload-all)
  )


;; allow autoselcting window under the pointer
(setq mouse-autoselect-window t)
;;(setq focus-follows-mouse t)


;; set default window geometry
(setq default-frame-alist '((width . 80) (height . 60) (menu-bar-lines . 1)))
(setq initial-frame-alist '((width . 80) (height . 60) ))

;; parens
(setq visible-bell t) ;; no bell
(setq blink-matching-paren t)
(setq paren-ding-unmatched t)

(setq indicate-empty-lines t)

;; indentation
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq c-basic-offset tab-width)
(setq c-default-style "linux")
;;(setq cperl-indent-level tab-width)
;;(setq lua-indent-level 2)

;; show current functon in modeline
(which-function-mode)
(setq which-func-unknown "")
(setq-default header-line-format
              '((which-func-mode ("" which-func-format " "))))
(setq mode-line-misc-info
      ;; We remove Which Function Mode from the mode line
      (assq-delete-all 'which-func-mode mode-line-misc-info))


;; comment region
;; TODO try to get c comments to be /* */ blocks ?
(global-set-key (kbd "C-;") 'comment-or-uncomment-region) 


;; compile key
(global-set-key [f12] 'compile)

;; scons stuff
(setq auto-mode-alist
      (append '(("SConstruct" . python-mode)
                ("SConscript" . python-mode)
                )
              auto-mode-alist))


;; bazel stuff
(setq auto-mode-alist
      (append '(("BUILD" . python-mode))
              auto-mode-alist))



;;; init.el ends here
