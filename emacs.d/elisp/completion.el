;;; completion.el --- Setup completion things
;;; Commentary: Mostly taken from https://alpha2phi.medium.com/emacs-beginner-configuration-9578dbe71d03

;;; Code:

;; helm vs ivy vs ido?

;; ivy general completion
(use-package ivy
  :bind
  ("C-x s" . swiper)
  ("C-x C-r" . ivy-resume)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers nil)
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
  )

(use-package counsel
  :bind
  ("M-x" . counsel-M-x)
  ("C-x C-m" . counsel-M-x)
;;  ("C-x C-f" . counsel-find-file) ; learn to use this better!
  ("C-c /" . counsel-rg)
  ("C-c l" . counsel-locate)
  ("C-x c k" . counsel-yank-pop)
  )

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))


(provide 'completion)
;;; completion.el ends here
