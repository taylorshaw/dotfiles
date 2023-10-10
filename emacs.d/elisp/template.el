;;; template.el --- Template stuff
;;; Commentary:

;;; Code:


;; yasnippet   (setup from https://www.reddit.com/r/emacs/comments/9bvawd/use_yasnippet_via_usepackage/)
;; default is to put personal snippets in emacs.d/snippets
(use-package yasnippet
  :ensure t
  :config
  (use-package yasnippet-snippets
    :ensure t)
  (yas-global-mode t)
  (yas-reload-all)
  )


;; set up auto-insert-mode to use yasnippet for file templates
(defun autoinsert-yas-expand()
  "Replace text in yasnippet template."
  (yas-expand-snippet (buffer-string) (point-min) (point-max))
  ;; (clang-format (point-min) (point-max) "Google") ;; maybe fix this so we dont need it here
  )

(defun autoinsert-yas-expand-cpp()
  "Replace text in yasnippet template."
  (yas-expand-snippet (buffer-string) (point-min) (point-max))
  (clang-format (point-min) (point-max) "Google") ;; maybe fix this so we dont need it here
  )

;; this could probably be done smarter
(defun taylor-get-header-file-include-path()
  "Helper function for yasnippet include line in c++ template"
  (concat (file-name-sans-extension (string-join (nthcdr 4 (split-string (buffer-file-name) "/")) "/")) ".hh")
  )

(use-package autoinsert
  :init
  ;; (setq auto-insert-query nil)
  (setq auto-insert-directory (locate-user-emacs-file "templates"))
  (add-hook 'find-file-hook 'auto-insert)
  (auto-insert-mode 1)
  :config
  ;; C++ program
  (define-auto-insert '("\\.\\(C\\|cc\\|cpp\\|cxx\\|c\\+\\+\\)\\'" . "C++")
    ["template.cc" autoinsert-yas-expand-cpp])
  ;; C++ header
  (define-auto-insert '("\\.\\(H\\|hh\\|hpp\\|hxx\\|h\\+\\+\\)\\'" . "C++ Header")
    ["template.hh" autoinsert-yas-expand-cpp])
  ;; python
  (define-auto-insert 'python-mode
    ["template.py" autoinsert-yas-expand])
  ;; protobuf
  (define-auto-insert '("\\.proto\\'" . "Protobuf")
    ["template.proto" autoinsert-yas-expand])
  ;; Bazel. Note this overrides python-mode
  (define-auto-insert '("BUILD$" . "Bazel Build")
    ["template.BUILD" autoinsert-yas-expand])
  )



(provide 'template)
;;; template.el ends here
