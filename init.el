(add-to-list 'load-path "~/.emacs.d/lisp")
; initialize
(require 'init-mode)
(require 'lazy-load)

; set color-theme
(require 'color-theme-sanityinc-tomorrow)
(load-theme 'sanityinc-tomorrow-night t)

; make emacs transparent in terminal
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))
(add-hook 'window-setup-hook 'on-after-init)

; hide menu bar
(menu-bar-mode 0)

; support for chinese
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8-unix)
(set-clipboard-coding-system 'utf-8-unix)
(set-file-name-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-next-selection-coding-system 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(setq locale-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

; forbit backup files
(setq make-backup-files nil)

; c indent
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
; (setq c-default-style "linux")
(setq c-basic-offset 4)

; pair
(electric-pair-mode 1)
(setq electric-pair-pairs
      '(
        (?\" . ?\")  ;; 添加双引号补齐
        (?\{ . ?\})  ;; 添加大括号补齐
        (?\' . ?\'))) ;; 添加单引号补齐
; comment line
(global-set-key (kbd "C-x C-\\") 'comment-line)
