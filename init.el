;;;
;;; @author: nkud
;;;

;; 日本語対応
(set-language-environment 'Japanese)

;; Coding System
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;; Package

;; ELPA settings
(eval-when-compile (require 'cl))
(when (require 'package nil t)
	;; パッケージリポジトリに Marmalade ELPA を追加
	;; (add-to-list 'package-archives
	;;             '("ELPA" . "http://tromey.com/elpa/"))
  (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
	;; インストールしたパッケージにロードパスを通して読み込む
	(package-initialize)

  ;; パッケージ情報の更新
  (package-refresh-contents)

  ;; インストールするパッケージ
  (defvar nu/packages
    '(
      ;; init
      init-loader

      ;; python
      jedi

      ;; helm
      helm
      helm-ag
      helm-descbinds
      helm-ls-git
      helm-c-yasnippet

      ;; coding
      web-mode
      scss-mode
      google-c-style
      quickrun
      markdown-mode
      ruby-block
      smart-compile

      ;; org
      org
      org-plus-contrib

      ;; other
      yasnippet
      open-junk-file
      ;; auto-complete
      key-chord
      c-eldoc
      wgrep
      evernote-mode
      paredit
      company
      elscreen
      apel
      smex
      flim
      ))
  ;; インストールしていないパッケージをインストール
  (dolist (package nu/packages)
    (unless (package-installed-p package)
      (package-install package)))
  )

;;;
;;; org mode
;;;
(add-to-list 'load-path (locate-user-emacs-file "public_repos/org-mode"))
(require 'org)

;; remove validate link
(setq org-html-validation-link nil)

;(require 'org-remember)

;; orgディレクトリを設定
;(setq org-directory "~/org/")
(setq org-default-note-file "temp.org")
;; (setq org-agenda-files (list org-directory))
;; (append org-agenda-files (list "D:/Dropbox/org"))

;;
;; Tags
;; inspired by `norang`
;;
(setq org-tag-alist (quote ((:startgroup)
                            ("@errand" . ?e)
                            ("@home" . ?h)
                            ("@lab" . ?l)
                            (:endgroup)
                            ("WAITING" . ?W)
                            ("HOLD" . ?H)
                            ("NOTE" . ?n)
                            ("FLAGGED" . ??))))
;;
;; TODO status
;;
(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(w)" "|" "DONE(d)")
        (sequence "SOMEDAY(s)" "HOLD(h)" "|")))

;; リフィルのターゲット設定
;;
(setq org-refile-targets (quote ((nil :maxlevel . 1)
                                 (org-agenda-files :maxlevel . 1))))

;;; key config
(defun nu/org-agenda-current-week-or-day ()
  "open org agenda current week or day directly"
  (interactive)
  (org-agenda nil "a")
  )

(global-set-key (kbd "C-c C-9") 'nu/org-agenda-current-week-or-day)
(global-set-key (kbd "C-c C-0") 'org-agenda)

;;; 時刻のフォーマット
(setq org-display-custom-times "<%Y-%m-%d %H:%M:S>")
(setq org-time-stamp-custom-formats "<%Y-%m-%d %H:%M:S>")

;; org-modeでの強調表示を可能にする
(add-hook 'org-mode-hook 'turn-on-font-lock)

;;; ファイルを開く状態
(setq org-startup-folded 1) ;; あってる？

;;; --------------------------------------------------
;;; TODOをDONEにした際の処理
;; (require 'org-archive nil 'noerror)
;; (setq org-archive-location "archive.org::")
;; (defun my:org-archive-done-tasks ()
;;   (interactive)
;; ;; ARCHIVE タグを付けるだけなら以下
;; ;;   (org-map-entries 'org-archive-set-tag "/DONE" 'file))
;; ;; org-archive-location に refile したいなら以下
;;   (org-map-entries 'org-archive-subtree "/DONE" 'file))
;; (add-hook 'org-todo-statistics-hook 'my:org-archive-done-tasks)
;; (add-hook 'org-todo-after-statistics-hook 'my:org-archive-done-tasks)
;;; --------------------------------------------------

;;; the following setting hides blank lines between headings which keeps
;;; folded view nice and compact.
(setq org-cycle-separator-lines 0)

;;; the following setting prevents creating blank lines befor headings but
;;; allows list item to adapt to existing black lines around the items.
(setq org-blank-before-new-entry (quote ((heading)
                                         (plain-list-item . auto))))

;;; 上から挿入？？
(setq org-reverse-note-order t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (smex wanderlust elscreen company paredit evernote-mode wgrep c-eldoc key-chord open-junk-file org-plus-contrib smart-compile ruby-block markdown-mode quickrun google-c-style scss-mode web-mode helm-c-yasnippet helm-ls-git helm-descbinds helm-ag helm jedi init-loader))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
