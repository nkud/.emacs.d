;; C-hをdelにする
(keyboard-translate ?\C-h ?\C-?)

;; C-w, C-u を kill
;; (define-key global-map (kbd "C-w") 'backward-kill-word)
;(define-key global-map (kbd "C-u") 'backward-kill-sentence)

(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; emacsを隠す
(global-set-key (kbd "M-h") 'ns-do-hide-emacs)

;;; セーブ
(global-set-key (kbd "M-s") 'save-buffer)

;;; Help
(global-set-key (kbd "C-?") 'help)


;;; カーソル固定の移動
(global-set-key "\M-n" (lambda () (interactive) (scroll-up 1)))
(global-set-key "\M-p" (lambda () (interactive) (scroll-down 1)))

;;; --------------------------------------------------
;;;
;;; １文字検索
;;;
(defvar last-search-char nil)
(defvar last-search-direction 'forward)

;;; 順方向
(defun search-forward-with-char (char)
  (interactive "cMove to Char: ")
  (if (eq (char-after (point)) char) (forward-char))
  (and (search-forward (char-to-string char) nil t)
       (backward-char))
  (setq last-search-char char
        last-search-direction 'forward))
;;; 逆方向
(defun search-backward-with-char (char)
  (interactive "cMove backward to Char: ")
  (search-backward (char-to-string char) nil t)
  (setq last-search-char char
        last-search-direction 'backward))
;;; 反復
(defun search-repeat-with-char ()
  (interactive)
  (cond
   ((eq nil last-search-char) (message "You haven't searched yet."))
   ((eq last-search-direction 'forward)
    (or (search-forward-with-char last-search-char) (backward-char)))
   ((eq last-search-direction 'backward) (search-backward-with-char last-search-char))))

(global-set-key (kbd "C-S-f") 'search-forward-with-char)
;; (global-set-key (kbd "C-w C-b") 'search-backward-with-char)
;; (global-set-key (kbd "M-r") 'search-repeat-with-char)
;;; --------------------------------------------------

;;; 前方単語削除 <=== なぜかエラーになる
;; (defadvice kill-region (around kill-word-or-kill-region activate)
;;   (if (and (called-interactively-p) transient-mark-mode (not mark-active))
;;       (backward-kill-word 1)
;;     ad-do-it))
;; (define-key minibuffer-local-completion-map (kbd "C-w") 'backward-kill-word)

;;; --------------------------------------------------
;;; 折り返し
(defun toggle-truncate-lines ()
  "折り返し表示をトグル動作します."
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))
;; (global-set-key (kbd "C-c C-t") 'toggle-truncate-lines)
;;; --------------------------------------------------

(defun nu/load-init-file ()
  " 初期化ファイルをロードする "
  (interactive)
  (load-file "~/.emacs.d/init.el"))

;;; --------------------------------------------------
;;; マウスホイールのスクロール量を調整
(setq mouse-scrool-step 2)              ;マウス使用時のスクロール量
(defun scroll-down-with-lines ( num )
  "numだけ下にスクロールする"
  (interactive)
  (scroll-down num))
(defun scroll-up-with-lines ( num )
   "numだけ上にスクロールする"
   (interactive)
   (scroll-up num))
   
;;; キー設定
(global-set-key [wheel-up] (lambda ()
                             (interactive)
                             (scroll-down-with-lines mouse-scrool-step)
                             ))
(global-set-key [wheel-down] (lambda ()
                               (interactive)
                               (scroll-up-with-lines mouse-scrool-step)
                               ))
;;; --------------------------------------------------
