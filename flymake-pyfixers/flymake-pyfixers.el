;;
;; March 4 2014, Christian Hopps <chopps@gmail.com>
;;
;; Copyright (c) 2014 by Christian E. Hopps.
;; All rights reserved.
;;
(require 'flymake)

;; See if we can load pymacs fixer functions fail silently if we cannot.
(with-demoted-errors
  (require 'pymacs)
  (message "add-directory: %s" (file-name-directory load-file-name))
  (add-to-list 'pymacs-load-path (file-name-directory load-file-name))
  (pymacs-load "flymake-pyfixers" "pyfixer:")
  )

(defvar pyfixer:flymake-fixers
  '(
    ("W291" . 'pyfixer:fixer-remove-trailing-ws)
    ("E203" . 'pyfixer:space-before-colon)
    ("E221" . 'pyfixer:space-around-op)
    ("E222" . 'pyfixer:space-around-op)
    ("E225" . 'pyfixer:space-around-op)
    ("E226" . 'pyfixer:space-around-op)
    ("E225" . 'pyfixer:space-around-op)
    ("E226" . 'pyfixer:space-around-op)
    ("E227" . 'pyfixer:space-around-op)
    ("E228" . 'pyfixer:space-around-op)
    ("E231" . 'pyfixer:comma-space)
    ("E251" . 'pyfixer:remove-space-around-equals)
    ("E301" . 'pyfixer:add-blank-line)
    ("E302" . 'pyfixer:add-blank-line)
    ("E303" . 'pyfixer:remove-blank-lines)
    ("E401" . 'pyfixer:multiple-imports-one-line)
    ("E711" . 'pyfixer:equals-none)
    ("E712" . 'pyfixer:equals-false)
    )
  "Associative array to locate fixers for pyflake errros, the
      values functions are quoted to allow pre-referencing")

;; Elisp version of fixers

(defun pyfixer:add-blank-line (errno errinfo)
  "Add blank line above current line"
  (save-excursion
    (let ((lines 0))
      (if (string-match "expected \\([0-9]+\\) blank lines?, found \\([0-9]+\\)" errinfo)
          (setq lines (- (string-to-number (match-string 1 errinfo))
                         (string-to-number (match-string 2 errinfo)))))
      (beginning-of-line)
      (previous-line)
      (while (not (line-no-commentp))
        (previous-line))
      (next-line)
      (newline lines))))

(defun pyfixer:fix-block-comment (errno errinfo)
  "Fix space after comment start"
  (let ((end (line-end-position)))
    (save-excursion
      (beginning-of-line)
      (while (re-search-forward "#\\([^ ]\\)" end t)
        (replace-match "# \\1")
        (setq end (line-end-position)))
      (beginning-of-line)
      (while (re-search-forward "#[\t ][\t ]+" end t)
        (replace-match "# ")
        (setq end (line-end-position))))))

(defun pyfixer:space-around-op (errno errinfo)
  "Fix space around equals warning"
  (let ((end (line-end-position)))
    (save-excursion
      (beginning-of-line)
      (while (re-search-forward
              " *\\(!=\\|==?\\|\\*=?\\|\\+=?\\|\\-=?\\|/=?\\|\\^=?\\||=?\\|&=?\\|<<=?\\|>>=?\\|%=?\\) *" end t)
        (replace-match " \\1 ")
        (setq end (line-end-position))))))

(defun pyfixer:remove-space-around-equals (errno errinfo)
  "Fix space around equals warning"
  (let ((end (line-end-position)))
    (save-excursion
      (beginning-of-line)
      (while (re-search-forward " *= *" end t)
        (replace-match "=")
        (setq end (line-end-position))))))

(defun pyfixer:space-before-colon (errno errinfo)
  "Fix space around equals warning"
  (let ((end (line-end-position)))
    (save-excursion
      (beginning-of-line)
      (while (re-search-forward " *:" end t)
        (replace-match ":")
        (setq end (line-end-position))))))

(defun pyfixer:comma-space (errno errinfo)
  "Fix space around comma warning"
  (let ((end (line-end-position))
        newtext)
    (save-excursion
      (beginning-of-line)
      (while (re-search-forward " *, *" end t)
        (setq newtext (concat (match-string 1) " = " (match-string 2)))
        (replace-match ", " t)
        (setq end (line-end-position))))))

(defun pyfixer:equals-none (errno errinfo)
  "Fix space around equals warning"
  (let ((end (line-end-position)))
    (save-excursion
      (beginning-of-line)
      (while (re-search-forward "== *None" end t)
        (replace-match "is None")
        (setq end (line-end-position)))
      (while (re-search-forward "!= *None" end t)
        (replace-match "is not None")
        (setq end (line-end-position))))))

(defun pyfixer:equals-false (errno errinfo)
  "Fix space around equals warning"
  (let ((end (line-end-position)))
    (save-excursion
      (beginning-of-line)
      (while (re-search-forward "== *False" end t)
        (replace-match "is False")
        (setq end (line-end-position)))
      (while (re-search-forward "!= *False" end t)
        (replace-match "is not False")
        (setq end (line-end-position))))))

(defun pyfixer:multiple-imports-one-line (errno errinfo)
  "transform a single line multiple import statement into single import statements, sorted"
  (let ((begin (line-beginning-position))
        (end (line-end-position))
        impend modlist bigstr)
    (save-excursion
      (beginning-of-line)
      (save-match-data
        (when (re-search-forward "^import \\([[:alnum:]_,\\. ]+\\)$" end t)
          (setq impend (match-end 0))
          (setq modlist (append modlist (mapcar 's-trim (s-split "," (match-string 1)))))
          (setq modlist (sort modlist 's-less?))
          (setq modlist (mapcar (lambda (x) (concat "import " x)) modlist))
          (setq bigstr (s-join "\n" modlist))
          (save-restriction
            (narrow-to-region begin impend)
            (delete-region begin impend)
            (goto-char begin)
            (insert bigstr)))))))

;; (let ((beg (point)))
;;   (save-excursion
;;     ;; move N-1 lines forward
;;     (beginning-of-line 0)
;;     (forward-line 1)
;;     (forward-char -1)
;;     (delete-region beg (point)))))

(defun pyfixer:remove-blank-lines (errno errinfo)
  "Remove blank line above current line"
  (let ((beg (point)))
    (save-excursion
      ;; move N-1 lines forward
      (beginning-of-line 0)
      (forward-line 1)
      (forward-char -1)
      (delete-region beg (point)))))

(defun line-no-commentp ()
  (save-match-data
    (let* ((start (line-beginning-position))
           (end (line-end-position))
           (line (buffer-substring-no-properties start end)))
      (not (string-match "[:space:]*#.*" line)))))


(defun pyfixer:add-blank-line (errno errinfo)
  "Add blank line above current line"
  (save-excursion
    (let ((lines 0))
      (if (string-match "expected \\([0-9]+\\) blank lines?, found \\([0-9]+\\)" errinfo)
          (setq lines (- (string-to-number (match-string 1 errinfo))
                         (string-to-number (match-string 2 errinfo)))))
      (beginning-of-line)
      (previous-line)
      (while (not (line-no-commentp))
        (previous-line))
      (next-line)
      (newline lines))))

(defun pyfixer:fix-error (errdata)
  "Fix the given errdata"
  (if errdata
      (let (errno fixer)
        ;; Handle flake8 or pylint messages
        (if (string-match "\\(^\\([EWRC][0-9]+\\) \\|\\[\\([EWRC][0-9]+\\)]\\).*" errdata)
            (progn
              (if (not (setq errno (match-string 2 errdata)))
                  (setq errno (match-string 3 errdata)))
              (setq fixer (caddr (assoc errno pyfixer:flymake-fixers)))
              ;; If we don't have and elisp fixer check pymacs fixers
              (if (and (not fixer) (functionp 'pyfixers-get-fixer-func))
                  (setq fixer (pyfixers-get-fixer-func errno)))
              (if fixer
                  (funcall fixer errno errdata)
                (message "No pyfixer function for: %s" errno)))))))

(defun pyfixer:get-errlist-given-line (line-no)
  "Get a list of error messages from either flymake or flycheck"
  (progn
    (let* ((line-err-info-list  (nth 0 (flymake-find-err-info flymake-err-info line-no)))
           (menu-data           (flymake-make-err-menu-data line-no line-err-info-list))
           (errlist (caadr menu-data)))
      (message "Menu-data: %s" (car errlist))
      errlist)))

(defun pyfixer:get-errlist ()
  "Get a list of error messages from either flymake or flycheck"
  (pyfixer:get-errlist-given-line (flymake-current-line-no)))

(defun pyfixer:fix-line-in-list (err-list last-line-no)
  "Recursively fix lines in list"
  (progn
    (let ((line-no (caar err-list))
          (new-list (cdr err-list)))
      (if new-list
          (pyfixer:fix-line-in-list new-list line-no))
      (if (not (eq last-line-no line-no))
          (progn
            (goto-line line-no)
            (pyfixer:fix-current-line))))))

(defun pyfixer:fix-all-errors ()
  "Get all errors"
  (interactive)
  (save-excursion
    (pyfixer:fix-line-in-list flymake-err-info -1))
  (flymake-start-syntax-check))

;;(bind-key "C-x C-q" 'pyfixer:fix-all-errors)

;; (defun pyfixer:get-errlist ()
;;   "Get a list of error messages from either flymake or flycheck"
;;   (if (member 'flycheck-mode minor-mode-list)
;;       (-keep 'flycheck-error-message (flycheck-overlay-errors-at (point)))
;;     (let* ((line-no             (flymake-current-line-no))
;;            (line-err-info-list  (nth 0 (flymake-find-err-info flymake-err-info line-no)))
;;            (menu-data           (flymake-make-err-menu-data line-no line-err-info-list))
;;            caadr menu-data))))

(defun pyfixer:print-errlist ()
  (interactive)
  (message "%s" (pyfixer:get-errlist)))

(defun pyfixer:fix-current-line ()
  "Display a fix for the current line"
  (interactive)
  (let* ((errlist (pyfixer:get-errlist)))
    (message "Errlist: %s" errlist)
    (mapcar 'pyfixer:fix-error errlist)
    (flymake-start-syntax-check)))

(defun pyfixer:ignore-error (errdata)
  "Ignore the given errdata pylint error"
  (if errdata
      (let (errno fixer)
        ;; Handle pylint messages
        ;; (if (string-match "\\[\\([EW][0-9]+\\)\\(-.*\\)\\?*\\].*" errdata)
        (if (string-match "\\[\\([CERW][0-9]+\\)\\].*" errdata)
            (progn
              (setq errno (match-string 1 errdata))
              (end-of-line)
              (insert (format "  # pylint: disable=%s" errno)))))))

(defun pyfixer:ignore-current-line ()
  "Display a fix for the current line"
  (interactive)
  (let* ((errlist (pyfixer:get-errlist)))
    (message "Errlist: %s" errlist)
    (mapcar 'pyfixer:ignore-error errlist)
    (flymake-start-syntax-check)))


(provide 'flymake-pyfixers)
