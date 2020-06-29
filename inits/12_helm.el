;;; helm settings
(require 'helm-source)
(when (require 'helm-config nil t)
  (helm-mode 1)

  ;; プレフィックスキーを変更
  (custom-set-variables '(helm-command-prefix-key "C-;"))

  ;; key bindings
  (define-key helm-command-map (kbd "C-;") 'helm-resume)
  (define-key helm-command-map (kbd "C-b") 'helm-buffers-list)
  (define-key helm-command-map (kbd "C-m") 'helm-M-x)
  (define-key helm-command-map (kbd "C-o") 'helm-occur)
  (define-key helm-command-map (kbd "C-i") 'helm-imenu)
  (define-key helm-command-map (kbd "C-s") 'helm-occur-from-isearch)
  (define-key helm-command-map (kbd "C-f") 'helm-find-files)
  (define-key helm-command-map (kbd "C-d") 'helm-descbinds)
  (define-key helm-command-map (kbd "g") 'helm-do-grep)
  (define-key helm-command-map (kbd "C-g") 'helm-browse-project)
  (define-key helm-command-map (kbd "C-j") 'helm-mini)
  (define-key helm-command-map (kbd "C-r") 'helm-recentf)

  ;; (global-set-key (kbd "C-,") 'helm-ls-git-ls)
  ;; (global-set-key (kbd "C-'") 'helm-M-x)
  ;; (global-set-key (kbd "C-;") 'helm-for-files)
  (global-set-key (kbd "C-,") 'helm-lisp-completion-at-point)

  (global-set-key (kbd "M-y") 'helm-show-kill-ring)

  ;; (global-set-key (kbd "C-c m") 'helm-mini)
  ;; (global-set-key (kbd "C-c f") 'helm-find-files)
  ;; (global-set-key (kbd "C-c x") 'helm-M-x)
  ;; (global-set-key (kbd "C-c i") 'helm-imenu)
  ;; (global-set-key (kbd "C-c o") 'helm-occur)
  ;; (global-set-key (kbd "C-c g") 'helm-browse-project)

  ;; (when (require 'init-key-chord nil t)
  ;;   ;; (space-chord-define-global "," 'helm-mini)
  ;;   (space-chord-define-global "m" 'helm-M-x))
  )

;; (require 'helm-ls-git)
;; (require 'helm-c-yasnippet)

;; (when (require 'helm-gtags nil t)
;;   (add-hook 'c-mode-hook 'helm-gtags-mode)
;;   ;; key bindings
;;   ;; (add-hook 'helm-gtags-mode-hook
;;   ;;           '(lambda ()
;;   ;;              (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
;;   ;;              (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
;;   ;;              (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
;;   ;;              (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)))
;;   )

;; helm-descbinds
;; (when (require 'helm-descbinds nil t)
;;   (helm-descbinds-mode))

;; helm-dash
;(when (require 'helm-dash nil t)
;  (helm-dash))

;;; recentf max saved items
(setq recentf-max-saved-items 200)

;;; 候補を作って描写するまでのタイムラグを設定する。Default: 0.01
(setq helm-idle-delay 0.2)
;;; 文字列を入力してから検索するまでのタイムラグを設定する。Default: 0.01
(setq helm-input-idle-delay 0.1)
(setq helm-buffer-max-length 20)
