(deftheme taylor_bright
  "Taylor Bright")

(custom-theme-set-variables
 'taylor_bright
 '(ansi-color-faces-vector [default default default italic underline success warning error])
 '(fci-rule-color "gray20")
 '(fill-column 80)
 '(indicate-buffer-boundaries (quote ((top . left) (bottom . right))))
 '(inhibit-startup-screen t))

(custom-theme-set-faces
 'taylor_bright
 '(font-lock-doc-string-face ((t (:foreground "light green"))))
 '(font-lock-type-face ((t (:foreground "magenta"))))
 '(paren-match ((t (:background "hot pink"))))
 '(which-func ((t (:foreground "white" :underline t))))
 '(font-lock-keyword-face ((t (:foreground "red"))))
 '(font-lock-preprocessor-face ((t (:foreground "magenta"))))
 '(font-lock-doc-face ((t (:inherit font-lock-string-face))))
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 105 :width normal :foundry "DAMA" :family "Ubuntu Mono"))))
 '(font-lock-string-face ((t (:foreground "dim gray"))))
 '(font-lock-function-name-face ((t (:foreground "blue2"))))
 '(font-lock-comment-face ((t (:foreground "lime green"))))
 '(font-lock-constant-face ((t (:foreground "dodger blue"))))
 '(font-lock-builtin-face ((t (:foreground "dark blue"))))
 '(font-lock-variable-name-face ((t (:foreground "dark magenta")))))

(provide-theme 'taylor_bright)
