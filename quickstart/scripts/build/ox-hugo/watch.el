(condition-case
  err
  (progn
    (require 'package)
    (package-initialize)
    (require 'ox-hugo)
    (require 'filenotify)
    (setq index-file "/app/org/index.org")
    (setq timer nil)

    (defun export-md ()
      (find-file-read-only index-file)
      (org-hugo-export-wim-to-md :all-subtrees nil nil)
      (kill-buffer)
      (setq timer nil))

    (defun file-change-callback (event)
      (when (eq timer nil)
        (setq timer (run-at-time "1 sec" nil 'export-md))))

  (export-md)
  (file-notify-add-watch index-file '(change) 'file-change-callback)
  (while t (read-event)))

(error
  (message "Error: %s" err)
  (kill-emacs 1)))
