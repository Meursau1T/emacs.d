(add-to-list 'load-path "~/.emacs.d/lisp")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Speed test                                                   ;;
;; (let (                                                          ;;
;;       ;; 加载的时候临时增大`gc-cons-threshold'以加速启动速度。  ;;
;;       (gc-cons-threshold most-positive-fixnum)                  ;;
;;       ;; 清空避免加载远程文件的时候分析文件。                   ;;
;;       (file-name-handler-alist nil))                            ;;
;;   (require 'benchmark-init-modes)                               ;;
;;   (require 'benchmark-init)                                     ;;
;;   (benchmark-init/activate)                                     ;;
;;                                                                 ;;
;;   ;; 下面才写你的其它配置                                       ;;
;;   )                                                             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Initialize
(require 'init-mode)
(require 'lazy-load)


;; Auto complete
(add-hook 'after-init-hook 'global-company-mode)
;; (global-set-key (kbd "C-x c") 'company-mode)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "<tab>") 'company-complete-selection)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

; Set color-theme
(require 'nord-theme)
(load-theme 'nord t)

; Make emacs transparent in terminal
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))
(add-hook 'window-setup-hook 'on-after-init)

; Hide menu bar
(menu-bar-mode 0)

; Support for chinese
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

; Forbit backup files
(setq make-backup-files nil)

; C indent
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)

; Pair
(require 'init-awesome-pair)
(show-paren-mode 1)
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Comment line
(global-set-key (kbd "C-x C-\\") 'comment-line)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
