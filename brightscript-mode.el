
(defun brightscript-comment-dwim (arg)
"Comment or uncomment current line or region in a smart way.
For detail, see `comment-dwim'."
   (interactive "*P")
   (require 'newcomment)
   (let ((deactivate-mark nil) (comment-start "'") (comment-end ""))
     (comment-dwim arg)))

(setq kwds 
      '(("StartPosterScreen\\|CreateObject" . font-lock-function-name-face)
        ("as\\|End\\|Function\\|Sub\\|end while\\|while\\|if\\|return\\|exit" . font-lock-keyword-face)
        ("true\\|false\\Object" . font-lock-constant-face)
        )
      )

(define-derived-mode brightscript-mode fundamental-mode
  (setq font-lock-defaults '(kwds))
  (setq mode-name "brightscript")
  ;; modify the keymap
  (define-key brightscript-mode-map [remap comment-dwim] 'brightscript-comment-dwim)

  (modify-syntax-entry ?' "< b" brightscript-mode-syntax-table)
  (modify-syntax-entry ?\n "> b" brightscript-mode-syntax-table)

)
