;;;
;;; org capture
;;;

(require 'org)
;; ---------------------------------------------------
;; Org-Capture
;; Key bind
(global-set-key (kbd "C-c c") 'org-capture)

;; Capture Templates
(setq org-capture-templates
      '(
        ("i" "Inbox" entry
         (file+headline "Inbox.org" "Inbox")
         "* %?")
        ("n" "NextAction" entry
         (file+headline "NextAction.org" "NextAction")
         "* TODO %?")
        ("p" "Project" entry
         (file+headline "Project.org" "Project")
         "* TODO %?")
        ("N" "NextAction with Time Stamp" entry
         (file+headline "NextAction.org" "NextAction")
         ;; "\n\n** TODO %?\nSCHEDULED: <%<%Y-%m-%d %a>>"
         "\n\n** TODO %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+1d\"))"
         :empty-line 1)
        ("P" "Project with Time Stamp" entry
         (file+headline "Project.org" "Project")
         "\n\n** TODO %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+1d\"))"
         :empty-line 1)
        ("s" "Someday/Maybe" entry
         (file+headline "Incubate.org" "Someday/Maybe")
         "* SOMEDAY %?")
        ("r" "Reference" entry
         (file+headline "NotActionable.org" "Reference")
         "* %?\n  %U\n")
        ("j" "Journal" entry
         (file+datetree "journal.org")
         "* %?\n%U\n%i\n")
        ))
