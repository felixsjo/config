(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(require 'use-package)

; Remove the annoying sound
(setq visible-bell t)
(setq ring-bell-function 'ignore)
; Keep cursor at same position when scrolling
(setq scroll-preserve-screen-position 1)
; Dont show startup message
(setq inhibit-startup-message t)
; Always auto install packages
(setq use-package-always-ensure t)

; Scroll window up/down by one line
(global-set-key (kbd "M-n") (kbd "C-u 1 C-v"))
(global-set-key (kbd "M-p") (kbd "C-u 1 M-v"))
; Scroll half page up/down
(autoload 'View-scroll-half-page-forward "view")
(autoload 'View-scroll-half-page-backward "view")
(global-set-key (kbd "C-v") 'View-scroll-half-page-forward)
(global-set-key (kbd "M-v") 'View-scroll-half-page-backward)

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
  (("C-c m" . magit)))

; Python
(elpy-enable)

; Set custom file
(setq custom-file (concat user-emacs-directory "/custom.el"))
; needs to be loaded with '(load-file (concat user-emacs-directory "/custom.el"))'

