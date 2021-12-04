(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(require 'use-package)

; Remove the annoying sound
(setq visible-bell t)
(setq ring-bell-function 'ignore)
;keep cursor at same position when scrolling
(setq scroll-preserve-screen-position 1)

;scroll window up/down by one line
(global-set-key (kbd "M-n") (kbd "C-u 1 C-v"))
(global-set-key (kbd "M-p") (kbd "C-u 1 M-v"))

; Enable window keybinds (shift arrows)
(windmove-default-keybindings)

; Disable stuff
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

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

;;;;;;;;;;;;;;;;;;;;
;;; Do not touch ;;;
;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes '(wheatgrass))
 '(custom-safe-themes
   '("83e0376b5df8d6a3fbdfffb9fb0e8cf41a11799d9471293a810deb7586c131e6" "6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1" default))
 '(package-selected-packages
   '(magit expand-region ivy projectile which-key use-package undo-fu gruvbox-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
