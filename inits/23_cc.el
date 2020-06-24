(require 'c-eldoc)
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
(add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)

;; c/c++ style
(defun nu/c-c++-mode-init()
  ;; ;; 常にインデント
  (setq c-tab-always-indent t)
  ;; ;; 空白を一度に削除
  (setq c-hungry-delete t)
  ;; ;; 自動改行、インデント
  (setq c-auto-newline t)
  ;; ;; 基本オフセット
  (setq c-basic-offset 2)
  ;; ;; タブではなく空白
  (setq indent-tabs-mode nil)
  (require 'google-c-style)
  (google-set-c-style)
  )
;(add-hook 'c-mode-hook 'nu/c-c++-mode-init)
;(add-hook 'c++-mode-hook 'nu/c-c++-mode-init)

;;; Google Code Style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c++-mode-common-hook 'google-set-c-style)
;; (add-hook 'c-mode-common-hook 'linum-mode)
;; (add-hook 'c++-mode-common-hook 'linum-mode)

;; VisualStudio Style
(defconst vs-c-style
  `("bsd"
    (tab-width . 4)
    (c-basic-offset . 4)
    (c-recognize-knr-p . nil)
    (c-enable-xemacs-performance-kludge-p . t) ; speed up indentation in XEmacs
    (c-offsets-alist . ((statement-case-open . +)
                        (case-label . 0)))
    (c-hanging-braces-alist . ((defun-open          before after)
                               (defun-close 	    before after)
                               (class-open  	    before after)
                               (class-close 	    before)
                               (namespace-open      before after)
                               (namespace-close     before after)
                               (inline-open  	    before after)
                               (inline-close 	    before after)
                               (block-open   	    before after)
                               (block-close  	    before after)
                               (statement-case-open after)
                               (substatement-open   before after)
                               ))
    (c-hanging-colons-alist . ((case-label after)
                               (label after)
                               (access-label after)
                               (member-init-intro before)
                               ))
    (c-hanging-semi&comma-criteria . (c-semi&comma-inside-parenlist))
    (c-cleanup-list . (defun-close-semi
                        list-close-comma
                        scope-operator
                        compact-empty-funcall))
    )
  "Visual Studio like style")

(defun vs-set-c-style ()
  "Set the current buffer's c-style to Visual Studio like style. "
  (c-add-style "vs" vs-c-style t))
