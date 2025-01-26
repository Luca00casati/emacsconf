;; Don't show the splash screen
(setq inhibit-startup-message t)
;;(menu-bar-mode 0)
;;(tool-bar-mode 0)
(scroll-bar-mode 0)
(tab-bar-mode 1)
(setq ring-bell-function 'ignore)

;;set scroll
(setq redisplay-dont-pause t
  scroll-margin 10
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; Disable line numbers for some modes
  (dolist (mode '(org-mode-hook
                  term-mode-hook
                  shell-mode-hook
                  eshell-mode-hook
                  vterm-mode-hook
                  compilation-mode-hook))
    (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)
(set-fringe-mode 10)
(desktop-save-mode 1)
;;use trash need adjustment for mac
(setq delete-by-moving-to-trash t)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;font
(set-face-attribute 'default nil :height 125)
(setq font-use-system-font t)

;;stop creating files
(setq make-backup-files nil)
(setq auto-save-default nil)

;;ido
(ido-mode t)

;;pair
(electric-pair-mode 1)

;;pdf
;;(setq pdf-view-use-scaling nil)
(setq doc-view-resolution 300)

;;full screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(recentf-mode 1)
(setq history-length 25)
(savehist-mode 1)
(save-place-mode 1)
(setq use-dialog-box nil)
(global-auto-revert-mode 1)
(setq gloabal-auto-revert-non-file-buffers t)

;;startup screen
;;(when (get-buffer "*scratch*")
;;  (recentf-open-files))

;;dired config
(setq dired-listing-switches "-alh --group-directories-first")

;;(setq ls-lisp-ignore-case t)
(setq dired-kill-when-opening-new-dired-buffer t)

(setq package-archives '(
("melpa" . "https://melpa.org/packages/") 
("org" . "https://orgmode.org/elpa/") 
))

(package-initialize)
(unless package-archive-contents (package-refresh-contents))

(setq use-package-always-ensure t)

(use-package gruber-darker-theme)

;;(use-package pdf-tools)

(use-package evil)
  ;;:init (evil-mode 1))
(when (not evil-mode) (cua-mode t))

(use-package doom-themes)

(use-package doom-modeline
  :config (doom-modeline-mode 1))

(use-package org)

(use-package eglot)

(use-package magit)
(use-package git-gutter
  :init (global-git-gutter-mode +1))

;;smex
(use-package smex
:config (global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

(use-package company
:init (company-mode)
:config (add-hook 'after-init-hook 'global-company-mode))

(use-package which-key
:init (which-key-mode) 
:diminish which-key-mode 
:config (setq which-key-idle-delay 0.3))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '(
     default))
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
