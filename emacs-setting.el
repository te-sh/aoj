;; Copy buffer to submit
(defun d-copy-for-submit ()
  (interactive)
  (let ((old-buf (current-buffer)))
    (with-temp-buffer
      (insert-buffer-substring old-buf)
      (goto-char (point-min))
      (if (re-search-forward "^version(unittest)" nil t)
	  (let ((start (line-beginning-position)))
	    (forward-line)
	    (delete-region start (point))
	    (goto-char (point-min))))
      (while (re-search-forward "^\s*unittest" nil t)
        (backward-word)
        (let* ((indent (current-column))
               (start (line-beginning-position)))
          (if (re-search-forward (format "^\s\\{%s\\}}" indent) nil t)
              (progn
                (forward-line)
                (if (= (point) (line-end-position))
                    (forward-line))
                (delete-region start (point))))))
      (clipboard-kill-ring-save (point-min) (point-max)))))
