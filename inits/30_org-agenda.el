;;
;; focus.el - Org Settings for GTD.
;;

(require 'org)

;; org mode setting
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;;; デフォルトで１日のビュー
(setq org-agenda-span 'day)

;;; --------------------------------------------------
;; customize TODO keywords colors
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "red" :weight bold)
              ("PROJ" :foreground "magenta" :weight bold)
              ("SCHED" :foreground "orange" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("HOLD" :foreground "orange" :weight bold))))

;;; --------------------------------------------------
;; insert DONE time
(setq org-log-done 'nil)

;;; --------------------------------------------------
;;; initialize agenda files
;; (setq org-agenda-files (list ;(concat org-directory "Actionable.org")
;;                          ;(concat org-directory "NotActionable.org")
;;                          ;; (concat org-directory "normal.org")
;;                          ;; (concat org-directory "school.org")
;;                          ;; (concat org-directory "work.org")
;;                          ;; (concat org-directory "pastime.org")
;;                          ;; (concat org-directory "club.org")
;;                          (concat org-directory "Inbox.org")
;;                          (concat org-directory "Incubate.org")
;;                          (concat org-directory "Project.org")
;;                          (concat org-directory "NextAction.org")))

;;; orgディレクトリを設定
;(setq org-agenda-files (list org-directory "D:/Dropbox/org/"))

;; Agenda customize
;; Indent ??
(defun nu/org-agenda-command-customize ()
  " customize agenda view commands "
  (interactive)
  ;; Agenda view commands
  (setq org-agenda-custom-commands
        '(("r" "Weekly Review"
           ((agenda "")
            (tags-todo "CATEGORY={PROJECT}"
                       ((org-agenda-overriding-header "\n[ PERSPECTIVE ]")))
            (tags-todo "CATEGORY={NEXT}"
                       ((org-agenda-overriding-header "[ NEXT ACTION ]")
                        ;; 期限を警告する期間
                        (org-deadline-warning-days 2)))
            )
           nil
           (concat org-directory "views/Review.ps"))
          ("n" "Next Actions" tags-todo "CATEGORY={NEXT}"
           ((org-agenda-overriding-header "Next Actions")))
          ("p" "Projects" tags-todo "CATEGORY={PROJECT}+Projects_1000"
           ((org-agenda-overriding-header "Projects")))
          ("P" "Perspectives" tags-todo "CATEGORY={PROJECT}"
           ((org-agenda-overriding-header "Perspectives")))
          ("i" "Incubate" tags "+LEVEL>=2+CATEGORY={INCUBATE}"
           ((org-agenda-overriding-header "SOMEDAY/MAYBE")
            (org-tags-match-list-sublevels t)))
          ("c" "Clarify" tags "+LEVEL>=2"
           ((org-agenda-skip-function
             '(org-agenda-skip-subtree-if 'todo '("TODO" "DONE" "SOMEDAY" "SCHED")))
            (org-agenda-overriding-header "[ Clarify ]")))
          ("o" "Organize" tags "+LEVEL>=2-CATEGORY={INBOX}"
           ((org-agenda-skip-function '(org-agenda-skip-subtree-if 'regexp ":*:"))
            (org-agenda-overriding-header "[ Organize ]")))
          )))
(defun nu/org-agenda-view-customize ()
  "customize org mode, agenda view"
  (interactive)
  (nu/org-agenda-command-customize)     ; command customize
  ;; Speeding up agendas
  ;; Do not dim blocked tasks
  (setq org-agenda-dim-blocked-tasks nil)
  ;; Compact the block agenda view
  (setq org-agenda-compact-blocks t)
  ;; Inhibit the agenda files startup options
  (setq org-agenda-inhibit-startup nil)
  ;; Deadline warning
  (setq org-deadline-warning-days 1)
  )

;; Custom agenda views
(nu/org-agenda-view-customize)

(setq org-startup-indented t)

(setq org-agenda-time-grid
     '((daily today require-timed)
       "----------------"
       (900 1000 1100 1200 1300 1400 1500 1600 1700)))

;; customize Stuck Projects
;(setq org-stuck-projects
;           ("+LEVEL=2/-DONE" ("TODO" "NEXT" "SCHED" "DONE") nil ""))

;; Number of empty lines needed to keep an empty line between collapsed trees
;; = 0
(setq org-cycle-separator-lines 0)
;; Searching And Showing Results
(setq org-show-following-heading '((default)))
(setq org-show-hierarchy-above ' ((default . t)))
(setq org-show-siblings (quote ((default))))
;; Adding New Tasks Quickly Without Disturbing The Current Task Content
;(setq org-insert-heading-respect-content nil)

;; Exporting Agenda Views
(setq org-agenda-exporter-settings
      '((ps-number-of-columns 2)
        (ps-landscape-mode t)
        (org-agenda-add-entry-text-maxlines 5)
        (htmlize-output-type 'css)))
(setq ps-multibyte-buffer 'non-latin-printer)
(setq ps-paper-type 'a4)
(setq ps-right-header
      '("/pagenumberstring load" ps-time-stamp-yyyy-mm-dd ps-time-stamp-hh:mm:ss))
;; ------------------------------------------------------------------------------
;; Custom Key Bindings
(global-set-key (kbd "<f12>") 'org-agenda)

(global-set-key (kbd "C-<f9>") 'previous-buffer)
(global-set-key (kbd "C-<f10>") 'next-buffer)
;(define-key Org-map (kbd "<f11>") 'org-todo)

;; global set key
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;; focus.el ends here
