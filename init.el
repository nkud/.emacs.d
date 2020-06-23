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

;;; ==============================================
;;; init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init 'error-only)  ;エラー時のみ表示
(init-loader-load (locate-user-emacs-file "inits")) ;ディレクトリを設定j

;; ;;; org-agendaを起動
;; (org-agenda nil "a")