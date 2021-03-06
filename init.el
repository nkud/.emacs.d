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
      init-loader                       ; 初期設定ファイルの管理

      ;; helm
      helm
      ;; helm-descbinds
      ;; helm-ls-git
      ;; helm-c-yasnippet
      ;; helm-ag

      ;; for coding
      ;; web-mode
      ;; scss-mode
      ;; google-c-style                    ; color theme
      ;; markdown-mode

      ;; org
      org                               ; org mode
      org-plus-contrib

      ;; other
      ;; yasnippet
      open-junk-file                    ; <F8> で一時ファイルを作成。拡張子を自由に設定できる。
      ;; auto-complete
      ;; wgrep
      ;; company
      apel                              ; for elscreen
      smex                              ; for elscreen
      flim                              ; for elscreen
      elscreen

      persistent-scratch                ; scratch 画面を保存
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
(init-loader-load (locate-user-emacs-file "inits")) ;ディレクトリを設定

;; ;;; org-agendaを起動
;; (org-agenda nil "a")


(persistent-scratch-setup-default)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-command-prefix-key "C-;")
 '(package-selected-packages
   (quote
    (persistent-scratch wgrep web-mode wanderlust smex smart-compile scss-mode ruby-block quickrun paredit org-plus-contrib open-junk-file markdown-mode key-chord jedi init-loader helm-ls-git helm-descbinds helm-c-yasnippet helm-ag google-c-style evernote-mode elscreen company c-eldoc))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
