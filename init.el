(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

; Remove the annoying sound
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;keep cursor at same position when scrolling
(setq scroll-preserve-screen-position 1)
;scroll window up/down by one line
(global-set-key (kbd "M-n") (kbd "C-u 1 C-v"))
(global-set-key (kbd "M-p") (kbd "C-u 1 M-v"))

; Enable which-key
(require 'which-key)
(which-key-mode)

; Enable projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

; Enable ivy mode
(ivy-mode)

; Enable expand-region
(require 'expand-region)
(global-set-key (kbd "C-.") 'er/expand-region)

; Magit keybind
(require 'magit)
(global-set-key (kbd "C-c m") 'magit)

; Enable window keybinds (shift arrows)
(windmove-default-keybindings)

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
 '(custom-enabled-themes '(tango))
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
