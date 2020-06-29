;; -----------
;; transparent
;; (set-frame-parameter nil 'alpha '(100 100))
;; -------------
;;; フォント設定
;; TODO : M+があるかどうかの分岐が必要
(set-face-attribute 'default nil
                    :family "Migu 2M"
                    ;; :width 'normal
                    ;; :weight 'light
                    :height 100)
;; 日本語フォントの設定
(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "Migu 1M"))

;; 半角と全角を１：２にする。XXX: できてない。
;; (setq face-font-rescale-alist
;;           '((".*Migu_1M.*" . 1.2)))
;; ￥を＼に
(define-key global-map [?¥] [?\\])
;;; カーソル下のフォントを取得
(defun describe-face-at-point ()
  (interactive)
  (message "%s" (get-char-property (point) 'face)))
;; ----------------
;; タブ文字の表示幅
(setq-default tab-width 2 indent-tabs-mode nil)

;;; 最大化時
;; (custom-set-variables
;;  '(initial-frame-alist (quote ((fullscreen . maximized)))))
(menu-bar-mode -1)
(tool-bar-mode -1)
;; (scroll-bar-mode -1)

;;; 初期フレームサイズ
(setq initial-frame-alist (quote ((top . 20)
                                  (left . 20)
                                  (width . 100)
                                  (height . 40))))

;;; orgディレクトリを設定
;; (setq org-directory "D:/Dropbox/org")
;; (setq org-agenda-files (list org-directory "D:/Dropbox/org/"))
