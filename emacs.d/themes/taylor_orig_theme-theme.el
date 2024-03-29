(deftheme taylor_orig_theme
  "Taylor Theme Orig.")

(custom-theme-set-variables
 'taylor_orig_theme
 '(ansi-color-faces-vector [default default default italic underline success warning error])
 '(fci-rule-color "gray20")
 '(fill-column 80)
 '(indicate-buffer-boundaries (quote ((top . left) (bottom . right))))
 '(package-selected-packages (quote (framemove string-inflection yasnippet flycheck yasnippet-snippets use-package sublimity spu nlinum neotree minimap ivy-hydra flycheck-ycmd flycheck-rust fill-column-indicator counsel clang-format ace-window)))
 '(which-func-format (quote ("[ " (:propertize which-func-current local-map (keymap (header-line keymap (mouse-3 . end-of-defun) (mouse-2 . #[nil "e\300=\203	 \301 \207~\207" [1 narrow-to-defun] 2 nil nil]) (mouse-1 . beginning-of-defun))) face which-func mouse-face mode-line-highlight help-echo "mouse-1: go to beginning
mouse-2: narrow to func
mouse-3: go to end") " ]")))
)

(custom-theme-set-faces
 'taylor_orig_theme
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 108 :width normal :foundry "DAMA" :family "Ubuntu Mono"))))
 '(font-lock-comment-face ((t (:foreground "green3"))))
 '(font-lock-doc-string-face ((t (:foreground "light green"))))
 '(font-lock-function-name-face ((t (:foreground "blue2"))))
 '(font-lock-keyword-face ((t (:foreground "red2"))))
 '(font-lock-preprocessor-face ((t (:foreground "purple3"))))
 '(font-lock-string-face ((t (:foreground "dark gray"))))
 '(font-lock-type-face ((t (:foreground "magenta"))))
 '(font-lock-variable-name-face ((t (:foreground "light blue"))))
 '(paren-match ((t (:background "hot pink"))))
 '(which-func ((t (:foreground "white" :underline t)))))

(provide-theme 'taylor_orig_theme)
