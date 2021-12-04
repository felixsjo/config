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

; Scroll window up/down by one line
(global-set-key (kbd "M-n") (kbd "C-u 1 C-v"))
(global-set-key (kbd "M-p") (kbd "C-u 1 M-v"))

; Enable window keybinds (shift arrows)
(windmove-default-keybindings)

; Disable stuff
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(global-linum-mode t)
(load-theme 'solarized-dark t)

; Enable better-defaults
(use-package better-defaults)

; Enable which-key
(use-package which-key
  :config
  (which-key-mode))

; Enable projectile
(use-package projectile
  :bind
  (("C-c p" . Projectile-command-map))
  :config
  (projectile-mode 1))

; Enable ivy mode
(use-package ivy
  :config
  (ivy-mode 1))

; Enable expand-region
(use-package expand-region
  :bind
  (("C-." . er/expand-region)))

; Magit keybind
(use-package magit
  :bind
  (("C-c m" . magit)))

; Enable vterm
(use-package vterm
    :ensure t)

; Set custom file
(setq custom-file (concat user-emacs-directory "/custom.el"))
; needs to be loaded with '(load-file (concat user-emacs-directory "/custom.el"))'

