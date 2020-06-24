;;; Author: Naoki Ueda

;; auto-install の設定
(when (require 'auto-install nil t)
  ;; インストールディレクトリを設定
  (setq auto-install-directory (locate-user-emacs-file "elisp/auto-install"))
  ;; elispの名前を取得する
  (auto-install-update-emacswiki-package-name t)
  ;; install-elisp の関数を利用可能にする
  (auto-install-compatibility-setup))
