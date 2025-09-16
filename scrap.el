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

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

;; packages

(use-package zenburn-theme
  :ensure t
  :init (load-theme 'zenburn t))

(use-package lsp-mode
  :commands lsp
  :ensure t
  :hook ((js2-mode . lsp)
         (typescript-mode . lsp)))

(use-package typescript-mode
  :ensure t)

(use-package js2-mode
  :ensure t)

(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-sideline-enable nil))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
