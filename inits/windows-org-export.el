;;;
;;; Org mode
;;;
;;; quoted from "http://oku.edu.mie-u.ac.jp/~okumura/texwiki/?Emacs%2FOrg%20mode"
;;; quoted from "http://akisute3.hatenablog.com/entry/2013/12/28/144918"

(require 'ox-latex)
(require 'ox-bibtex)

;;; LaTeX 形式のファイル PDF に変換するためのコマンド
(setq org-latex-pdf-process
      '("platex %f"
        "platex %f"
        "bibtex %b"
        "platex %f"
        "platex %f"
        "dvipdfmx %b.dvi"))

;;; \hypersetup{...} を出力しない
(setq org-latex-with-hyperref nil)

(add-to-list 'org-latex-classes
             '("thesis"
               "\\documentclass{jarticle}
                [NO-PACKAGES]
                [NO-DEFAULT-PACKAGES]
                \\usepackage[dvipdfmx]{graphicx}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
             '("elsevier"
               "\\documentclass[a4paper,6pt,oneside,onecolumn,preprint]{jarticle}
                [NO-PACKAGES]
                [NO-DEFAULT-PACKAGES]
                \\usepackage[dvipdfmx]{graphicx}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
