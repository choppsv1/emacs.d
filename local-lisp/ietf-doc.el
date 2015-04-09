;;
;; March 21 2015, Christian Hopps <chopps@gmail.com>
;;
;; Copyright (c) 2015 by Christian E. Hopps
;; All rights reserved.
;;
;;; Commentary:
;;
;; These are function useful for interacting with the IETF (primarily in docs).
;;
;;; Code:

;; (defgroup  'ietf-doc (())
;;   "Customizable variables for ietf-doc functions")

;; (defcustom ietf-doc-directory "~/Dropbox/IETF/doc-cache/"
;;   "Local directory to store downloaded IETF documents created if necessary"
;;   :type filename
;;   :group ietf-doc)

(defvar ietf-doc-cache-directory "~/Dropbox/IETF/doc-cache/")

(defvar ietf-doc-draft-url-directory "http://www.ietf.org/id/")

(defvar ietf-doc-rfc-url-directory "http://www.ietf.org/rfc/")

(defun ietf-doc-at-point ()
  (interactive)
  (concat (file-name-sans-extension (file-name-base (thing-at-point 'filename))) ".txt"))

(defun ietf-doc-normalize-filename (filename)
  (concat (file-name-sans-extension filename) ".txt"))

(defun ietf-doc-fetch-to-cache (filename &optional reload)
  (let* ((pathname (concat ietf-doc-cache-directory filename))
         url)
    (downcase filename)
    (if (and (file-exists-p pathname) (not reload))
        (message "Cached path %s" pathname)
      (setq filename (downcase filename))
      (make-directory ietf-doc-cache-directory t)
      (if (string/starts-with filename "rfc")
          (setq url (concat ietf-doc-rfc-url-directory filename))
        (setq url (concat ietf-doc-draft-url-directory filename)))
      (message url)
      (url-copy-file url pathname t)
      (message "Downloading %s to %s" url pathname)
      pathname)
    pathname))

(defun ietf-doc-at-point-fetch-to-cache (&optional reload)
  (interactive "p")
  (ietf-doc-fetch-to-cache (ietf-doc-at-point) reload))

(defun ietf-doc-open-at-point (&optional reload)
  (interactive "p")
  (let ((pathname (ietf-doc-at-point-fetch-to-cache reload)))
    (find-file pathname)))

(define-key global-map (kbd "C-c i o") 'ietf-doc-open-at-point)

(provide 'ietf-doc)
;;; ietf-lisp.el ends here
