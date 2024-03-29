;;; emacs.el --- Taylor's personal emacs init.el

;;; Commentary:

;; to get a list of available packages, use M-x package-list-packages
;; i marks package to install, u unmarks, x runs the install
;; to get all key bindings for the mode, do C-h m

;; to enter Emacs customization interface, do M-x customize
;; to read about an Emacs variable do C-h v <variable name>

;; articles ive read about Emacs customization:
;; https://blog.aaronbieber.com/2015/07/05/a-gentle-introduction-to-emacs-configuration.html
;; https://github.com/caiorss/Emacs-Elisp-Programming/blob/master/README.org
;; https://alpha2phi.medium.com/emacs-beginner-configuration-9578dbe71d03

;; places I've copied stuff from:
;; https://blog.aaronbieber.com/2015/05/24/from-vim-to-emacs-in-fourteen-days.html
;; https://emacs-doctor.com/emacs-strip-tease.html
;; https://github.com/ClintLiddick/dotfiles/blob/master/emacs.el (clint from aurora's dotfiles)

;; TODO

;; set up helm ?
;; set up projectile ?
;; set up yasnippet ?  maybe integrate with helm and ido?
;; auto-complete https://github.com/auto-complete/auto-complete
;; https://www.emacswiki.org/emacs/HippieExpand
;; magit
;; rtags/ycmd
;; better clang-format

;; try Emacs prelude, spacemacs etc
;; evil-mode

;; http://pchristensen.com/blog/articles/finding-things-fast-in-emacs/
;; https://github.com/eglaysher/find-things-fast/blob/master/README.md


;; Try using desktop-save-mode to restore buffers and window configuration
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Saving-Emacs-Sessions.html

;; flymake mode


;; also, can switch this file to org mode for built-in documentation



;;; Code:

;; Path to my elisp config files
(add-to-list 'load-path (concat user-emacs-directory "elisp"))

;; Base configuration
(require 'base)

;; Load Theme
(require 'theme)

;; Completion
(require 'completion)

;; Magit
(require 'version_control)

;; Template
(require 'template)


;; ;; do these early to aviod momentary display
;; (if (fboundp 'tool-bar-mode) (tool-bar-mode -1)) ;; no tool bar
;; ;;(if (fboundp 'menu-bar-mode) (menu-bar-mode 0)) ;; no menu bar
;; (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)) ;; no scroll bar
;; (setq inhibit-startup-screen t) ;; no startup screen



;; ;; don't put custom-set-variables in emacs.el
;; ;; maybe move this to emacs.d ? (expand-file-name "custom.el" user-emacs-directory)
;; (setq custom-file "~/.emacs-custom.el")
;; (load custom-file)

;; ;; location for custom themes ive downloaded
;; (add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
;; (add-to-list 'custom-theme-load-path (expand-file-name "~/src/emacs-color-theme-solarized"))

;; ;; put emacs files I download outside of package manager in .emacs.d/lisp
;; (add-to-list 'load-path "~/.emacs.d/lisp")

;; ;; add some additional package repositories
;; ;; this is taken from vim-to-emacs in 14 days
;; (require 'package)
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa"))
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;; (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

;; (setq package-enable-at-startup nil)
;; (package-initialize)


;; ;; manually install use-package package manager
;; ;; https://github.com/jwiegley/use-package
;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

;; ;; configure use-package
;; (setq use-package-always-ensure t) ;; always download and install packages
;; (setq use-package-always-pin "melpa") ;; prefer latest
;; (eval-when-compile
;;   (require 'use-package))
;; (require 'bind-key)
;; ;;(require 'diminish)

;; ;; automatically update packages daily
;; (use-package spu
;;   :defer
;;   :config (spu-package-upgrade-daily))


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

;; ;; fill column indicator
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

;; ;; yasnippet   (setup from https://www.reddit.com/r/emacs/comments/9bvawd/use_yasnippet_via_usepackage/)
;; ;; default is to put personal snippets in emacs.d/snippets
;; (use-package yasnippet
;;   :ensure t
;;   :config
;;   (use-package yasnippet-snippets
;;     :ensure t)
;;   (yas-global-mode t)
;;   (yas-reload-all)
;;   )


;; ;; set up auto-insert-mode to use yasnippet for file templates
;; (defun autoinsert-yas-expand()
;;   "Replace text in yasnippet template."
;;   (yas-expand-snippet (buffer-string) (point-min) (point-max))
;;   ;; (clang-format (point-min) (point-max) "Google") ;; maybe fix this so we dont need it here
;;   )

;; (defun autoinsert-yas-expand-cpp()
;;   "Replace text in yasnippet template."
;;   (yas-expand-snippet (buffer-string) (point-min) (point-max))
;;   (clang-format (point-min) (point-max) "Google") ;; maybe fix this so we dont need it here
;;   )

;; ;; this could probably be done smarter
;; (defun taylor-get-header-file-include-path()
;;   "Helper function for yasnippet include line in c++ template"
;;   (concat (file-name-sans-extension (string-join (nthcdr 4 (split-string (buffer-file-name) "/")) "/")) ".hh")
;;   )

;; (use-package autoinsert
;;   :init
;;   ;; (setq auto-insert-query nil)
;;   (setq auto-insert-directory (locate-user-emacs-file "templates"))
;;   (add-hook 'find-file-hook 'auto-insert)
;;   (auto-insert-mode 1)
;;   :config
;;   ;; C++ program
;;   (define-auto-insert '("\\.\\(C\\|cc\\|cpp\\|cxx\\|c\\+\\+\\)\\'" . "C++")
;;     ["template.cc" autoinsert-yas-expand-cpp])
;;   ;; C++ header
;;   (define-auto-insert '("\\.\\(H\\|hh\\|hpp\\|hxx\\|h\\+\\+\\)\\'" . "C++ Header")
;;     ["template.hh" autoinsert-yas-expand-cpp])
;;   ;; python
;;   (define-auto-insert 'python-mode
;;     ["template.py" autoinsert-yas-expand])
;;   ;; protobuf
;;   (define-auto-insert '("\\.proto\\'" . "Protobuf")
;;     ["template.proto" autoinsert-yas-expand])
;;   ;; Bazel. Note this overrides python-mode
;;   (define-auto-insert '("BUILD$" . "Bazel Build")
;;     ["template.BUILD" autoinsert-yas-expand])
;;   )


;; ;; allow autoselcting window under the pointer
;; (setq mouse-autoselect-window t)
;; ;;(setq focus-follows-mouse t)


;; ;; set default window geometry
;; (setq default-frame-alist '((width . 80) (height . 60) (menu-bar-lines . 1)))
;; (setq initial-frame-alist '((width . 80) (height . 60) ))

;; ;; parens
;; (setq visible-bell nil) ;; no bell. set to t to see visible bell but no beep
;; (setq blink-matching-paren t)
;; (setq paren-ding-unmatched t)

;; (setq indicate-empty-lines t)

;; ;; indentation
;; ;; also look at googles c style guide: https://github.com/google/styleguide/blob/gh-pages/google-c-style.el
;; (setq-default indent-tabs-mode nil) ;; use spaces rather than tabs
;; (setq tab-width 4)
;; (setq c-basic-offset tab-width)
;; ;;(setq c-default-style "linux")
;; (c-add-style "taylor-c-style"
;;              '("linux"
;;                (c-basic-offset . tab-width)
;;                (c-offsets-alist
;;                 (innamespace . 0)
;;                 (access-label . -3)
;;                 )))
;; (setq c-default-style "taylor-c-style")


;; ;;(setq cperl-indent-level tab-width)
;; ;;(setq lua-indent-level 2)

;; ;; show current function in modeline
;; (which-function-mode)
;; (setq which-func-unknown "")
;; (setq-default header-line-format
;;               '((which-func-mode ("" which-func-format " "))))
;; (setq mode-line-misc-info
;;       ;; We remove Which Function Mode from the mode line
;;       (assq-delete-all 'which-func-mode mode-line-misc-info))


;; ;; comment region
;; ;; TODO try to get c comments to be /* */ blocks ?
;; (global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;; ;; goto line just single M-g
;; (global-set-key (kbd "M-g") 'goto-line)

;; ;; compile key
;; (global-set-key [f12] 'compile)

;; ;; scons stuff
;; (setq auto-mode-alist
;;       (append '(("SConstruct" . python-mode)
;;                 ("SConscript" . python-mode)
;;                 )
;;               auto-mode-alist))


;; ;; bazel stuff
;; (add-to-list 'auto-mode-alist '("BUILD" . python-mode))
;; (add-to-list 'auto-mode-alist '("WORKSPACE" . python-mode))



;; ;; store all backup and autosave files in tmp dir to get them out of the way
;; ;; /var/tmp is more persistent than /tmp, which is flushed on boot
;; ;; https://github.com/zpinter/emacs.d/blob/master/pre-cask-config.el#L141-L150

;; ;; if file names end up getting to be too long, should look at:
;; ;; https://emacs.stackexchange.com/questions/35762/keep-auto-save-files-out-of-directory

;; (defconst emacs-tmp-dir (format "/var/tmp/%s-%s/" "emacs-auto-save" (user-uid)))

;; (unless (file-directory-p emacs-tmp-dir)
;;   (make-directory emacs-tmp-dir))

;; (setq backup-directory-alist
;;       `((".*" . ,emacs-tmp-dir)))

;; (setq undo-history-directory-alist
;;       `((".*" . ,emacs-tmp-dir)))

;; (setq auto-save-file-name-transforms
;;       `((".*" ,emacs-tmp-dir t)))

;; (setq auto-save-list-file-prefix
;;       emacs-tmp-dir)

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
;;; init.el ends here
