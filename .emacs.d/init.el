(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(setq custom-file "~/.emacs.d/.emacs.custom.el")
;;(setq custom-file "C://Users//0xfarco//.emacs.d//.emacs.custom.el")

(add-to-list 'load-path "~/.emacs.d/lang/")

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
(global-display-line-numbers-mode 1)
(electric-pair-mode 1)
(whitespace-mode 1)

(setq display-line-numbers-type 'relative)

(setq-default inhibit-splash-screen t
			make-backup-files nil
			tab-width 4
			indent-tabs-mode nil
			compilation-scroll-output t)

(add-to-list 'default-frame-alist `(font . "JetBrainsMono Nerd Font-12"))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'gruber-darker t)

(use-package which-key
	:ensure t
	:config
	(which-key-mode))

;;; ido
(use-package smex
	:ensure t)

(use-package ido-completing-read+
	:ensure t)

(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

(global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(use-package projectile
    :ensure t
    :init
    (projectile-mode +1)
    :bind (:map projectile-mode-map
                  ("C-c p" . projectile-command-map)))

;;; c-mode
;; (setq-default c-basic-offset 4
;;              c-default-style "linux")

(setq-default c-basic-offset 4
              c-default-style '((java-mode . "java")
                                (awk-mode . "awk")
                                (other . "bsd")))

(add-hook 'c-mode-hook (lambda ()
                         (interactive)
                         (c-toggle-comment-style -1)))

;; if you want to change prefix for lsp-mode keybindings.
(setq lsp-keymap-prefix "s-l")

(use-package eldoc
  :ensure t)
(setq lsp-eldoc-render-all t)

;; eglot 
(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs '((c-mode c++-mode) "clangd"))
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure))

;; Company (completion frontend)
(use-package company
  :ensure t
  :bind (:map company-mode-map
              ("M-/" . company-complete-common-or-cycle)) ;; override conflict
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-show-numbers t
        company-minimum-prefix-length 1
        company-idle-delay 0.5))

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

;; Flycheck (on-the-fly linting)
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (setq flycheck-display-errors-function
        #'flycheck-display-error-messages-unless-error-list
        flycheck-indication-mode nil))

(use-package flycheck-pos-tip
  :ensure t
  :after flycheck
  :config
  (flycheck-pos-tip-mode))

(require 'basm-mode)

(require 'fasm-mode)
(add-to-list 'auto-mode-alist '("\\.asm\\'" . fasm-mode))

(require 'porth-mode)

(require 'noq-mode)

(require 'jai-mode)

(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(require 'c3-mode)

;;; Whitespace mode
(defun rc/set-up-whitespace-handling ()
  (interactive)
  (whitespace-mode 1)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace))

(add-hook 'tuareg-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'c++-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'c-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'simpc-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'emacs-lisp-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'java-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'lua-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'rust-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'scala-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'markdown-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'haskell-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'python-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'erlang-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'asm-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'fasm-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'go-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'nim-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'yaml-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'porth-mode-hook 'rc/set-up-whitespace-handling)

;; Define the whitespace style.
(setq-default whitespace-style
              '(face tabs spaces trailing space-before-tab newline indentation empty space-after-tab space-mark tab-mark))

;;;magit
(use-package dash
	:ensure t)
(use-package transient
	:ensure t)
(use-package magit
	:ensure t)

(setq magit-auto-revert-mode nil)

(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)

;;;vterm
(use-package vterm
	:ensure t)

;;; Dired
;;(use-package dired
;;	:ensure t)

(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq-default dired-dwim-target t)
(setq dired-listing-switches "-alh")
(setq dired-mouse-drag-files t)

;;; helm
(use-package helm
	:ensure t)
(use-package helm-ls-git
	:ensure t)

(setq helm-ff-transformer-show-only-basename nil)

(global-set-key (kbd "C-c h l") 'helm-ls-git-ls)
(global-set-key (kbd "C-c h f") 'helm-find)
(global-set-key (kbd "C-c h r") 'helm-recentf)

;;; yasnippet
(use-package yasnippet
	:ensure t)

(setq yas/triggers-in-field nil)
(setq yas-snippet-dirs '("~/.emacs.d/snippets/"))

(yas-global-mode 1)

;;; tramp
;;; http://stackoverflow.com/questions/13794433/how-to-disable-autosave-for-tramp-buffers-in-emacs
(setq tramp-auto-save-directory "/tmp")

;;; powershell
(use-package powershell
	:ensure t)
(add-to-list 'auto-mode-alist '("\\.ps1\\'" . powershell-mode))
(add-to-list 'auto-mode-alist '("\\.psm1\\'" . powershell-mode))

;;; company
(use-package company
	:ensure t)
(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'tuareg-mode-hook
          (lambda ()
            (interactive)
            (company-mode 0)))

;;; Move Text
(use-package move-text
	:ensure t)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

(use-package go-mode
	:ensure t)
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(use-package rust-mode
	:ensure t)

(use-package php-mode
 	:ensure t)

(use-package markdown-mode
	:ensure t)

(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(use-package nim-mode
	:ensure t)

(use-package typescript-mode
	:ensure t)

(use-package lua-mode
	:ensure t)

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(use-package tuareg
  :ensure t)

(use-package eglot
  :ensure t)

(use-package highlight-indentation
  :ensure t)

;; (use-package js2-mode
;; 	:ensure t)

;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; (add-to-list 'interpreter-mode-alist '("node" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
;; (add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

(use-package js2-mode
  :ensure t
  :mode ("\\.js\\'" . js2-mode)
  :interpreter ("node" . js2-mode))

;; For JSX support, use rjsx-mode instead of js2-jsx-mode (recommended)
(use-package rjsx-mode
  :ensure t
  :mode ("\\.jsx?\\'" . rjsx-mode)
  :interpreter ("node" . rjsx-mode))

(use-package dockerfile-mode
 	:ensure t)

(setq dockerfile-mode-command "docker")

(defun astyle-buffer (&optional justify)
  (interactive)
  (let ((saved-line-number (line-number-at-pos)))
    (shell-command-on-region
     (point-min)
     (point-max)
     "astyle --style=kr"
     nil
     t)
    (goto-line saved-line-number)))

(add-hook 'simpc-mode-hook
          (lambda ()
            (interactive)
            (setq-local fill-paragraph-function 'astyle-buffer)))

(defun rc/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (line-beginning-position)))
        (line (let ((s (thing-at-point 'line t)))
                (if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

(global-set-key (kbd "C-,") 'rc/duplicate-line)

(defun rc/insert-timestamp ()
  (interactive)
  (insert (format-time-string "(%Y-%m-%d %H:%M:%S)")))

(global-set-key (kbd "C-x p d") 'rc/insert-timestamp)

(defun rc/rgrep-selected (beg end)
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end))
                 (list (point-min) (point-min))))
  (rgrep (buffer-substring-no-properties beg end) "*" (pwd)))

(global-set-key (kbd "C-x p s") 'rc/rgrep-selected)

compilation-error-regexp-alist-alist

(add-to-list 'compilation-error-regexp-alist
            '("\\([a-zA-Z0-9\\.]+\\)(\\([0-9]+\\)\\(,\\([0-9]+\\)\\)?) \\(Warning:\\)?"
              1 2 (4) (5)))

(setq warning-minimum-level :error)

(load-file custom-file)
