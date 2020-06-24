
;; タブをスペースにする
(setq-default tab-width 2 indent-tabs-mode nil)

;; バックアップを残さない
;; (setq make-backup-files nil)

;; 矩形選択
;(cua-mode nil)
;(setq cua-enable-cua-keys nil)

;; ツールバー、スクロールバーを非表示
(when window-system
  (tool-bar-mode 0)                     ;tool-bar
  ;; (scroll-bar-mode 0)                   ;scroll-bar
  (menu-bar-mode 0))                    ;menu-bar
;; highlit otherwise paren
(show-paren-mode t)

;; indent when Return
(global-set-key (kbd "C-m") 'newline-and-indent)

(line-number-mode t)
(column-number-mode t)                  ;カラム番号を表示
(size-indication-mode t)                ;ファイルサイズを表示
(setq frame-title-format "%f")


;; display time on mode line
(display-time)
;; display key stroke on echo area soon
(setq echo-keystrokes 0.1)

;; -------------------------
;; カーソルの形状・動作・色
(add-to-list 'default-frame-alist '(cursor-type . box))
(blink-cursor-mode 0)
;; (add-to-list 'default-frame-alist '(blink-cursor-mode . 0))
;; 行番号を表示
;(global-linum-mode nil)

;; highlight cursor line
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     ;; (:background  "#98FB98"))
     (:background  "#ddd"))
    (t
     ()))
  "*Face used by hl-line.")
;; (setq hl-line-face 'hlline-face)
;; (global-hl-line-mode)

;; 現在行をハイライト
;(global-hl-line-mode 0)
;(set-face-background 'hl-line "#98bc98")
;; ------------------
;; 初期フレームサイズ
;; (setq initial-frame-alist (quote ((top . 10)
;;                                   (left . 10)
;;                                   (width . 100)
;;                                   (height . 50))))

;; ウインドウ分割
(defun other-window-or-split-bellow ()
  "ウィンドウを上下に分割"
  (interactive)
  (when (one-window-p)
    (split-window-vertically))
  (other-window 1))
(defun other-window-or-split-right ()
  "ウィンドウを左右に分割"
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))
(global-set-key (kbd "C-t") 'other-window-or-split-bellow)
(global-unset-key (kbd "C-r"))
(global-set-key (kbd "C-r") 'other-window-or-split-right)

;;; ウィンドウ操作
(global-unset-key (kbd "C-w"))
(global-set-key (kbd "C-w C-k") 'delete-window)
(global-set-key (kbd "C-w C-o") 'delete-other-windows)
(global-set-key (kbd "C-w C-w") 'kill-region)

(global-set-key (kbd "C-; C-k") 'kill-this-buffer)
(global-set-key (kbd "C-c C-s") 'save-buffer)

;;; Tab, Whitespace colors
;; (defface my-face-r-1 '((t (:background "#888888"))) nil)
;; (defface my-face-b-1 '((t (:background "#888888"))) nil)
;; (defface my-face-b-2 '((t (:background "#888888"))) nil)
;; (defface my-face-u-1 '((t (:foreground "#242424" :underline t))) nil)
;; (defvar my-face-r-1 'my-face-r-1)
;; (defvar my-face-b-1 'my-face-b-1)
;; (defvar my-face-b-2 'my-face-b-2)
;; (defvar my-face-u-1 'my-face-u-1)
;; (defadvice font-lock-mode (before my-font-lock-mode ())
;;   (font-lock-add-keywords
;;    major-mode
;;    '(("\t" 0 my-face-b-2 append)
;;      ("　" 0 my-face-b-1 append)
;;      ("[ \t]+$" 0 my-face-u-1 append)
;;      ;; ("[\r]*\n" 0 my-face-r-1 append)
;;      )))
;; (ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
;; (ad-activate 'font-lock-mode)

;;; 大文字小文字を区別しない
(setq completion-ignore-case t)

;;; 自動的に編集されたファイルを更新する
(global-auto-revert-mode t)

(require 'uniquify)
(setq uniquify-buffer-name-style
      'post-forward-angle-brackets)

;;; バックアップファイルの設定
(add-to-list 'backup-directory-alist
             (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

;;; 起動画面を消す
(setq inhibit-splash-screen t)

;;; スクロールのステップ
(setq scroll-step 1)

;;; ベルを消す
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; y == yes
(defalias 'yes-or-no-p 'y-or-n-p)

;;; undo
(define-key global-map (kbd "C-z") 'undo)
