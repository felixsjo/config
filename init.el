(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Bootstrap 'use-package'
(eval-after-load 'gnutls
  '(add-to-list 'gnutls-trustfiles "/etc/ssl/cert.pem"))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(setq use-package-always-ensure t)

;----------------------------------------------------------

; Remove the annoying sound
(setq visible-bell t)
(setq ring-bell-function 'ignore)
; Keep cursor at same position when scrolling
(setq scroll-preserve-screen-position 1)
; Dont show startup message
(setq inhibit-startup-message t)
; Always auto install packages
(setq use-package-always-ensure t)
; Replace selection when typing
(delete-selection-mode 1)


(global-set-key (kbd "M-n") (kbd "C-u 1 C-v"))
(global-set-key (kbd "M-p") (kbd "C-u 1 M-v"))

; Scroll window up/down by one line
(defun window-half-height ()
  (max 1 (/ (1- (window-height (selected-window))) 2)))

(defun scroll-up-half ()
  (interactive)
  (scroll-up (window-half-height)))

(defun scroll-down-half ()         
  (interactive)                    
  (scroll-down (window-half-height)))

(global-set-key (kbd "C-v") 'scroll-up-half)
(global-set-key (kbd "M-v") 'scroll-down-half)

; Enable window keybinds (shift arrows)
(windmove-default-keybindings)

; Disable stuff
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(global-linum-mode t)

; Theme
(use-package modus-themes
  :ensure
  :init
  ;; Add all your customizations prior to loading the themes
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs nil
        modus-themes-region '(bg-only no-extend))

  ;; Load the theme files before enabling a theme
  (modus-themes-load-themes)
  :config
  ;; Load the theme of your choice:
  (modus-themes-load-vivendi)  ;;(modus-themes-load-operandi)
  :bind ("<f5>" . modus-themes-toggle))

; Enable which-key
(use-package which-key
  :config
  (which-key-mode))

; Enable projectile
(use-package projectile
  :bind
  (("C-c p" . projectile-command-map))
  :config
  (projectile-mode 1))

; Enable ivy mode
(use-package ivy
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  (global-set-key "\C-s" 'swiper)
  (global-set-key "\C-r" 'swiper-backward))

; Enable expand-region
(use-package expand-region
  :bind
  (("C-." . er/expand-region)))

; Magit keybind
(use-package magit
  :bind
  (("C-c m" . magit))
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "/usr/bin/pandoc"))

; Python
(elpy-enable)

; Set custom file
(setq custom-file (concat user-emacs-directory "/custom.el"))
; needs to be loaded with '(load-file (concat user-emacs-directory "/custom.el"))'

