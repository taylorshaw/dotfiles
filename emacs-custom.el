(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-safe-themes
   '("8c5fc7ae7567d9f7ee54c92a7f981f91a3143a1b557978b0638404c7084cf44c" "fbde30dfe4b2f7a7d0bace98f9369ce1d18d61547459ba82962c55af3b4065ef" default))
 '(fci-rule-color "gray20")
 '(fill-column 80)
 '(indicate-buffer-boundaries '((top . left) (bottom . right)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(yasnippet ivy magit-popup magit which-key company counsel doom-modeline spacemacs-theme yasnippet-snippets use-package string-inflection spu neotree flycheck-ycmd flycheck-rust fill-column-indicator clang-format ace-window))
 '(which-func-format
   '("[ "
     (:propertize which-func-current local-map
                  (keymap
                   (header-line keymap
                                (mouse-3 . end-of-defun)
                                (mouse-2 .
                                         #[nil "e\300=\203\11\0\301 \207~\207"
                                               [1 narrow-to-defun]
                                               2 nil nil])
                                (mouse-1 . beginning-of-defun)))
                  face which-func mouse-face mode-line-highlight help-echo "mouse-1: go to beginning\12mouse-2: narrow to func\12mouse-3: go to end")
     " ]")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
