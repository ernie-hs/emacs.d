(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(setq visible-bell t)

(column-number-mode)
(global-display-line-numbers-mode t)
(global-hl-line-mode t)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-auto-revert-mode t)

(setq enable-remote-dir-locals t)

(setq confirm-kill-processes nil)

(setq-default indent-tabs-mode nil)

(setq create-lockfiles nil)

;; init package stuff

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(setq package-check-signature nil)

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; packages

(use-package zenburn-theme
  :ensure t
  :init (load-theme 'zenburn t))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 15))

(use-package parinfer-rust-mode
  :ensure t)

(use-package rainbow-delimiters
  :ensure t)

(use-package clojure-mode
  :ensure t
  :init (add-hook 'clojure-mode-hook 'subword-mode)
        (add-hook 'clojure-mode-hook 'parinfer-rust-mode)
        (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
	(add-hook 'cider-repl-mode-hook 'parinfer-rust-mode))

(use-package clojure-mode-extra-font-locking
  :ensure t
  :init (require 'clojure-mode-extra-font-locking))

(use-package cider
  :ensure t)

(use-package ido-completing-read+
  :ensure t
  :init (ido-mode t)
        (ido-ubiquitous-mode t)
        (ido-everywhere t))

(use-package projectile
  :ensure t
  :init (projectile-mode 1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(projectile use-package ido-completing-read+ rainbow-delimiters cider clojure-mode-extra-font-locking clojure-mode parinfer-rust-mode doom-modeline zenburn-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
