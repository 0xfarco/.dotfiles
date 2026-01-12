(setq custom-file "~/.emacs.d/.emacs.custom.el")

;; Only show errors (suppress warnings/info)
(setq warning-minimum-level :error)

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lang/")

(load "~/.emacs.d/misc/emacs-rc.el")
(load "~/.emacs.d/misc/org-mode-rc.el")

;;; Appearance
(defun rc/get-default-font ()
  (cond
   ((eq system-type 'windows-nt) "Consolas-13")
   ((eq system-type 'gnu/linux) "Iosevka-12")))

(add-to-list 'default-frame-alist `(font . ,(rc/get-default-font)))

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
(global-display-line-numbers-mode 1)
(electric-pair-mode 1)

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

(global-set-key (kbd "s-<left>")  #'shrink-window-horizontally)
(global-set-key (kbd "s-<right>") #'enlarge-window-horizontally)
(global-set-key (kbd "s-<down>")  #'shrink-window)
(global-set-key (kbd "s-<up>")    #'enlarge-window)

(setq display-line-numbers-type 'relative)

(setq-default inhibit-splash-screen t
			make-backup-files nil
			tab-width 4
			indent-tabs-mode nil
			compilation-scroll-output t)

(rc/require-theme 'gruber-darker)
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (load-theme 'doom-ayu-dark t)

;; which key
(rc/require 'which-key)
(which-key-mode 1)

;;; ido
;; (rc/require 'smex 'ido-completing-read+)

;; (require 'ido-completing-read+)

;; (ido-mode 1)
;; (ido-everywhere 1)
;; (ido-ubiquitous-mode 1)

;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;; helm
;; (rc/require 'helm 'helm-ls-git)

;; (setq helm-ff-transformer-show-only-basename nil)

;; (global-set-key (kbd "C-c h l") 'helm-ls-git)
;; (global-set-key (kbd "C-c h f") 'helm-find)
;; (global-set-key (kbd "C-c h r") 'helm-recentf)

;;; counsel
(rc/require 'counsel)

(counsel-mode 1)
(setq ivy-initial-inputs-alist nil) ;; removes starting ^ regex in M-x

;;; ivy
(rc/require 'ivy)

(ivy-mode 1)
(setopt ivy-use-virtual-buffers t)
(setopt enable-recursive-minibuffers t)
(setq ivy-count-format "(%d/%d) ")
;; Enable this if you want `swiper' to use it:
;; (setopt search-default-mode #'char-fold-to-regexp)
(keymap-global-set "C-s" #'swiper-isearch)
(keymap-global-set "C-c C-r" #'ivy-resume)
(keymap-global-set "<f6>" #'ivy-resume)
(keymap-global-set "M-x" #'counsel-M-x)
(keymap-global-set "C-x C-f" #'counsel-find-file)
(keymap-global-set "<f1> f" #'counsel-describe-function)
(keymap-global-set "<f1> v" #'counsel-describe-variable)
(keymap-global-set "<f1> o" #'counsel-describe-symbol)
(keymap-global-set "<f1> l" #'counsel-find-library)
(keymap-global-set "<f2> i" #'counsel-info-lookup-symbol)
(keymap-global-set "<f2> u" #'counsel-unicode-char)
(keymap-global-set "C-c g" #'counsel-git)
(keymap-global-set "C-c j" #'counsel-git-grep)
(keymap-global-set "C-c k" #'counsel-ag)
(keymap-global-set "C-x l" #'counsel-locate)
(keymap-set minibuffer-local-map "C-r" #'counsel-minibuffer-history)

;;; c-mode
(setq-default c-basic-offset 4
              c-default-style '((java-mode . "java")
                                (awk-mode . "awk")
                                (other . "bsd")))

(add-hook 'c-mode-hook (lambda ()
                         (interactive)
                         (c-toggle-comment-style -1)))

;;; Emacs lisp
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c C-j")
                            (quote eval-print-last-sexp))))
(add-to-list 'auto-mode-alist '("Cask" . emacs-lisp-mode))

(require 'basm-mode)

(require 'fasm-mode)
(add-to-list 'auto-mode-alist '("\\.asm\\'" . fasm-mode))

(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(require 'c3-mode)

;;; Whitespace mode
(defun rc/set-up-whitespace-handling ()
  (interactive)
  (whitespace-mode 1)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace))

(add-hook 'c++-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'c-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'simpc-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'emacs-lisp-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'java-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'lua-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'rust-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'markdown-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'python-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'asm-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'fasm-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'go-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'yaml-mode-hook 'rc/set-up-whitespace-handling)

;; Define the whitespace style.
(setq-default whitespace-style
              '(face tabs spaces trailing space-before-tab newline indentation empty space-after-tab space-mark tab-mark))

;;;magit
(rc/require 'dash)
(rc/require 'transient)
(rc/require 'magit)

(setq magit-auto-revert-mode nil)

(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)

;;; multiple cursors
(rc/require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;;;vterm
(rc/require 'vterm)

;;; Dired
(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq-default dired-dwim-target t)
(setq dired-listing-switches "-alh")
(setq dired-mouse-drag-files t)

;;; yasnippet
(rc/require 'yasnippet)

(require 'yasnippet)

(setq yas-triggers-in-field nil)
(setq yas-snippet-dirs '("~/.emacs.d/snippets/"))

(yas-global-mode 1)

;;; tramp
;;; http://stackoverflow.com/questions/13794433/how-to-disable-autosave-for-tramp-buffers-in-emacs
(setq tramp-auto-save-directory "/tmp")

;;; powershell
(rc/require 'powershell)
(add-to-list 'auto-mode-alist '("\\.ps1\\'" . powershell-mode))
(add-to-list 'auto-mode-alist '("\\.psm1\\'" . powershell-mode))

;;; eldoc mode
(defun rc/turn-on-eldoc-mode ()
  (interactive)
  (eldoc-mode 1))

(add-hook 'emacs-lisp-mode-hook 'rc/turn-on-eldoc-mode)

;;; Company
(rc/require 'company)
(require 'company)

(global-company-mode)

;;; Typescript
(rc/require 'typescript-mode)
(add-to-list 'auto-mode-alist '("\\.mts\\'" . typescript-mode))

;;; Tide
(rc/require 'tide)

(defun rc/turn-on-tide-and-flycheck ()  ;Flycheck is a dependency of tide
  (interactive)
  (tide-setup)
  (flycheck-mode 1))

(add-hook 'typescript-mode-hook 'rc/turn-on-tide-and-flycheck)

;;; LSP - eglot
(require 'eglot)
(rc/require 'eldoc-box)

;; Auto-start LSP for these modes
(add-hook 'simpc-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'rust-mode-hook 'eglot-ensure)
(add-hook 'python-mode-hook 'eglot-ensure)

(add-to-list 'eglot-server-programs '((simpc-mode c++-mode c-mode) "clangd"))
(add-to-list 'eglot-server-programs '((rust-mode) "rust-analyzer"))
(add-to-list 'eglot-server-programs '((python-mode) "pylsp"))

;;; Move Text
(rc/require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

;;; Packages that don't require configuration
(rc/require
  'go-mode
  'rust-mode
  'php-mode
  'markdown-mode
  'elpy
  'lua-mode
  'js2-mode
  'rjsx-mode
  'dockerfile-mode
  'graphql-mode
  )

;; astyle buffer
(defun astyle-buffer (&optional justify)
  (interactive)
  (let ((saved-line (line-number-at-pos)))
    (shell-command-on-region (point-min) (point-max) "astyle --style=kr" nil t)
    (goto-char (point-min))
    (forward-line (1- saved-line))))

(add-hook 'simpc-mode-hook
          (lambda ()
            (interactive)
            (setq-local fill-paragraph-function 'astyle-buffer)))

(require 'compile)

compilation-error-regexp-alist-alist

(add-to-list 'compilation-error-regexp-alist
            '("\\([a-zA-Z0-9\\.]+\\)(\\([0-9]+\\)\\(,\\([0-9]+\\)\\)?) \\(Warning:\\)?"
              1 2 (4) (5)))

(load-file custom-file)
