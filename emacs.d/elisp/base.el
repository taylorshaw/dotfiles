;;; base.el --- Base emacs configuration
;;; Commentary:

;;; Code:

;; do these early to aviod momentary display
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1)) ;; no tool bar
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode 0)) ;; no menu bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)) ;; no scroll bar
(setq inhibit-startup-screen t) ;; no startup screen



;; don't put custom-set-variables in emacs.el
;; maybe move this to emacs.d ? (expand-file-name "custom.el" user-emacs-directory)
(setq custom-file "~/.emacs-custom.el")
(if (file-exists-p custom-file)
    (load custom-file))

;; put emacs files I download outside of package manager in .emacs.d/third_party
(add-to-list 'load-path (concat user-emacs-directory "third_party"))

;; add some additional package repositories
;; this is taken from vim-to-emacs in 14 days
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/"))

;; (setq package-enable-at-startup nil)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; location for custom themes ive downloaded
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
(add-to-list 'custom-theme-load-path (expand-file-name "~/src/emacs-color-theme-solarized"))


;; manually install use-package package manager
;; https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; configure use-package
(setq use-package-always-ensure t) ;; always download and install packages
(setq use-package-always-pin "melpa") ;; prefer latest
(eval-when-compile
  (require 'use-package))

;; automatically update packages daily
(use-package spu
  :defer
  :config (spu-package-upgrade-daily))

;; enable the bind-key function
(require 'bind-key)

;; diminish enables removing mode names from modeline
;; (require 'diminish)

;; set default window geometry
(setq default-frame-alist '((width . 80) (height . 60) (menu-bar-lines . 1)))
(setq initial-frame-alist '((width . 80) (height . 60) ))

;; allow autoselcting window under the pointer
(setq mouse-autoselect-window t)
;;(setq focus-follows-mouse t)

;; Auto-revert any buffer when the file changes on disk
(global-auto-revert-mode t)

;; No Bell!
(setq visible-bell nil) ;; no bell. set to t to see visible bell but no beep

;; parens
;; (setq blink-matching-paren t)  ;; i had this on before I tried show-paren-mode. maybe switch back?
(setq paren-ding-unmatched t)
(show-paren-mode 1) ;; Highlight matching parenthesis

(setq indicate-empty-lines t)


;; keybindings.. TODO maybe use bind-key here?

;; comment region
;; TODO try to get c comments to be /* */ blocks ?
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;; goto line just single M-g
(global-set-key (kbd "M-g") 'goto-line)

;; compile key
(global-set-key [f12] 'compile)


;; store all backup and autosave files in tmp dir to get them out of the way
;; /var/tmp is more persistent than /tmp, which is flushed on boot
;; https://github.com/zpinter/emacs.d/blob/master/pre-cask-config.el#L141-L150

;; if file names end up getting to be too long, should look at:
;; https://emacs.stackexchange.com/questions/35762/keep-auto-save-files-out-of-directory

(defconst emacs-tmp-dir (format "/var/tmp/%s-%s/" "emacs-auto-save" (user-uid)))

(unless (file-directory-p emacs-tmp-dir)
  (make-directory emacs-tmp-dir))

(setq backup-directory-alist
      `((".*" . ,emacs-tmp-dir)))

(setq undo-history-directory-alist
      `((".*" . ,emacs-tmp-dir)))

(setq auto-save-file-name-transforms
      `((".*" ,emacs-tmp-dir t)))

(setq auto-save-list-file-prefix
      emacs-tmp-dir)


;; Set up C-c C-c to evaluate the current buffer when in elisp mode
;; From: https://www.masteringemacs.org/article/evaluating-elisp-emacs
(defun mp-elisp-mode-eval-buffer ()
  (interactive)
  (message "Evaluated buffer")
  (eval-buffer))

(define-key emacs-lisp-mode-map (kbd "C-c C-c") #'mp-elisp-mode-eval-buffer)
(define-key lisp-interaction-mode-map (kbd "C-c C-c") #'mp-elisp-mode-eval-buffer)

;; Delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; ;; flycheck syntax checking
;; ;; this is taken from clint's dotfiles
;; ;;
;; ;; Python - flake8
;; ;; C++ - clang/gcc/cppcheck
;; ;; Rust - cargo
;; ;; Javascript - eslint
;; ;; LaTeX - chktex
;; ;; SQL - sqlint
;; (use-package flycheck
;;   :config
;;   (global-flycheck-mode)
;;   ;; (use-package flycheck-irony)
;;   ;; (add-hook 'flycheck-mode-hook 'flycheck-irony-setup)
;;   (add-hook 'c++-mode-hook
;;             (lambda()
;;               (setq flycheck-gcc-language-standard "c++14")
;;               (setq flycheck-clang-language-standard "c++14")))
;;   (add-hook 'c-mode-hook
;;             (lambda()
;;               (setq flycheck-gcc-language-standard "c11")
;;               (setq flycheck-clang-language-standard "c11")))
;;   (use-package flycheck-ycmd
;;     :config
;;     (flycheck-ycmd-setup))
;;     (use-package flycheck-rust)
;; )

;; ;; C++ auto-formatting  XXX TODO
;; ;; XXX should set up the keybindings only for certain modes (c++-mode, c-mode, glsl-mode)
;; (use-package clang-format
;;   :config
;;   (global-set-key (kbd "M-f") 'clang-format-region) ;; XXX this replaces 'forward-word'
;;   (global-set-key (kbd "M-F") 'clang-format-buffer)
;; ;;  (add-hook 'c-mode-common-hook
;; ;;	    (function (lambda ()
;; ;;			(add-hook 'before-save-hook
;;   ;;				  'clang-format-buffer))))
;;   )

;; fill column indicator
;; (use-package fill-column-indicator
;;   :config
;;   (setq fci-rule-use-dashes t)
;;   (setq fci-dash-pattern 0.25)
;;   (setq fci-rule-color "dim gray")
;;   )
;; (setq fill-column 80)

;; ;; ace-window
;; (use-package ace-window
;;   :config
;;   (global-set-key (kbd "M-o") 'ace-window)
;;   )


;; ;; ivy general completion
;; ;; (use-package ivy
;; ;;   :diminish (ivy-mode . "")
;; ;;   :init
;; ;;   (setq ivy-use-virtual-buffers t)
;; ;;   (setq ivy-count-format "(%d/%d) ")
;; ;;   :config
;; ;;   (ivy-mode 1))
;; ;; (use-package swiper)
;; ;; (use-package ivy-hydra)
;; ;; (use-package counsel
;; ;;   :init
;; ;;   :bind (("M-x" . counsel-M-x)
;; ;;          ("C-x C-f" . counsel-find-file)
;; ;;          ("C-c /" . counsel-rg)
;; ;;          ("C-c l" . counsel-locate)))

;; ;; projectile integration
;; ;;(use-package projectile
;; ;;  :config
;; ;;  (projectile-global-mode))

;; (use-package neotree
;;   :config
;;   (require 'neotree)
;;   (setq neo-smart-open t)
;;   (global-set-key [f8] 'neotree-toggle)
;;   )


;; ;; minimap seems to work better than sublimity for minimap, but still doesnt
;; ;; work great. I think maybe try to turn on/off when scrolling?
;; ;;(use-package minimap
;; ;;  :config (minimap-mode 1))

;; ;;(use-package sublimity
;; ;;  :config (require 'sublimity)
;;   ;;(require 'sublimity-scroll)
;;   ;;(require 'sublimity-map)
;;   ;;(require 'sublimity-attractive)
;;   ;;(sublimity-mode 1)
;;   ;;(sublimity-map-set-delay 3)
;;   ;;(setq sublimity-map-size 20)
;;   ;;(setq sublimity-map-fraction 0.3)
;;   ;;(setq sublimity-map-text-scale -7)
;; ;(add-hook 'sublimity-map-setup-hook
;; ;          (lambda ()
;; ;            (setq buffer-face-mode-face '(:family "Monospace"))
;; ;            (buffer-face-mode)))
;;   ;;(sublimity-map-set-delay 5)
;; ;;  )

;; (use-package string-inflection
;;   )



;; Language style things

;; indentation
;; also look at googles c style guide: https://github.com/google/styleguide/blob/gh-pages/google-c-style.el
(setq-default indent-tabs-mode nil) ;; use spaces rather than tabs
(setq tab-width 4)
(setq c-basic-offset tab-width)
;;(setq c-default-style "linux")
(c-add-style "taylor-c-style"
             '("linux"
               (c-basic-offset . tab-width)
               (c-offsets-alist
                (innamespace . 0)
                (access-label . -3)
                )))
(setq c-default-style "taylor-c-style")


;;(setq cperl-indent-level tab-width)
;;(setq lua-indent-level 2)

;; show current function in modeline
(which-function-mode)
(setq which-func-unknown "")
(setq-default header-line-format
              '((which-func-mode ("" which-func-format " "))))
(setq mode-line-misc-info
      ;; We remove Which Function Mode from the mode line
      (assq-delete-all 'which-func-mode mode-line-misc-info))



;; scons stuff
(setq auto-mode-alist
      (append '(("SConstruct" . python-mode)
                ("SConscript" . python-mode)
                )
              auto-mode-alist))


;; bazel stuff
(add-to-list 'auto-mode-alist '("BUILD" . python-mode))
(add-to-list 'auto-mode-alist '("WORKSPACE" . python-mode))




;; ;; disable .#foo style symlinks
;; ;; (setq create-lockfiles nil)


;; ;; framemove for moving between frames
;; ;; downloaded from https://www.emacswiki.org/emacs/FrameMove
;; (require 'framemove)
;; (global-set-key (kbd "C-M-<left>") 'windmove-left)
;; (global-set-key (kbd "C-M-<right>") 'windmove-right)
;; (global-set-key (kbd "C-M-<up>") 'windmove-up)
;; (global-set-key (kbd "C-M-<down>") 'windmove-down)
;; (setq framemove-hook-into-windmove t)

;; (use-package cl-lib) ;; needed by framemove (was cl prior to emacs 27)

;; ;; keyboard macro for splitting window in thirds
;; ;; (fset 'ts-split-window
;; ;;   (kmacro-lambda-form [?\C-x ?1 ?\C-x ?3 ?\C-x ?3 ?\C-x ?+ (select-window (#<window 203>)) (select-window (#<window 204 on init.el>))] 0 "%d"))


;; ;; desktop save mode for restoring workspaces
;; ;; (desktop-save-mode 1)

(provide 'base)
;;; base.el ends here
