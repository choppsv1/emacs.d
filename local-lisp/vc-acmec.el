;;
;; * registered (file)
;;
;;   Return non-nil if FILE is registered in this backend.
;;
(defun vc-acmec-registered (file)
  "Check if FILE is ACME cache registered.
Side effects: sets 'vc-checkout-time and 'vc-workfile-version."
  (let ((dirname (or (file-name-directory file) ""))
	(basename (file-name-nondirectory file))
        ;; make sure that the file name is searched case-sensitively
        (case-fold-search nil))
    (if (not (file-directory-p (expand-file-name
                           (concat ".CC/cache/" basename "@@")
                           dirname)))
        (progn (vc-file-setprop file 'vc-checkout-time 0)
               (vc-file-setprop file 'vc-workfile-version "main!0"))
      (let ((entry (vc-acmec-get-entry file)))
        (if (not entry)
            (progn (vc-file-setprop file 'vc-checkout-time 0)
                   (vc-file-setprop file 'vc-workfile-version "main!0"))
          (vc-file-setprop file 'vc-checkout-time
                           (vc-acmec-entry-timestamp entry))
          (vc-file-setprop file 'vc-workfile-version
                           (vc-acmec-entry-revision entry)))))))

;;
;; * state (file)
;;
;;   Return the current version control state of FILE.  For a list of
;;   possible values, see `vc-state'.  This function should do a full and
;;   reliable state computation; it is usually called immediately after
;;   C-x v v.  If you want to use a faster heuristic when visiting a
;;   file, put that into `state-heuristic' below.
;;
;; basicallyi return 'up-to-date or 'edited
;;
;; there are also USER (locked by other USER), 'needs-patch, 'needs-merge,
;; 'unlocked-changes, none of which can be figured out with the cache
;;
(defun vc-acmec-state (file)
  "ACME cache version of 'vc-state."
  (let ((entry (vc-acmec-get-entry file))
        (mtime (nth 5 (file-attributes file))))
    (when entry
      (vc-file-setprop
       file 'vc-state
       (cond
        ((not (equal mtime (vc-acmec-entry-timestamp entry))) 'edited)
        ;; we really should check the md5 here too.
        (t 'up-to-date))))))

;; - state-heuristic (file)
;;
;;   If provided, this function is used to estimate the version control
;;   state of FILE at visiting time.  It should be considerably faster
;;   than the implementation of `state'.  For a list of possible values,
;;   see the doc string of `vc-state'.
;;
;; - dir-state (dir)
;;
;;   If provided, this function is used to find the version control state
;;   of all files in DIR in a fast way.  The function should not return
;;   anything, but rather store the files' states into the corresponding
;;   `vc-state' properties.
;;
;; * workfile-version (file)
;;
;;   Return the current workfile version of FILE.

(defun vc-acmec-workfile-version (file)
  "ACME cache version of vc-workfile-version."
  ;; we set this propery when checking for registered.
  (vc-acmec-registered file)
  (vc-file-getprop file 'vc-workfile-version))

;;
;; - latest-on-branch-p (file)
;;
;;   Return non-nil if the current workfile version of FILE is the latest
;;   on its branch.  The default implementation always returns t, which
;;   means that working with non-current versions is not supported by
;;   default.
;;
;; * checkout-model (file)
;;
;;   Indicate whether FILE needs to be "checked out" before it can be
;;   edited.  See `vc-checkout-model' for a list of possible values.

(defun vc-acmec-checkout-model (file)
  'implicit)

;;
;; - workfile-unchanged-p (file)
;;
;;   Return non-nil if FILE is unchanged from its current workfile
;;   version.  This function should do a brief comparison of FILE's
;;   contents with those of the master version.  If the backend does not
;;   have such a brief-comparison feature, the default implementation of
;;   this function can be used, which delegates to a full
;;   vc-BACKEND-diff.  (Note that vc-BACKEND-diff must not run
;;   asynchronously in this case, see variable `vc-disable-async-diff'.)
;;
;; - mode-line-string (file)
;;
;;   If provided, this function should return the VC-specific mode line
;;   string for FILE.  The default implementation deals well with all
;;   states that `vc-state' can return.
;;
;; - dired-state-info (file)
;;
;;   Translate the `vc-state' property of FILE into a string that can be
;;   used in a vc-dired buffer.  The default implementation deals well
;;   with all states that `vc-state' can return.
;;
;; STATE-CHANGING FUNCTIONS
;;
;; * register (file &optional rev comment)
;;
;;   Register FILE in this backend.  Optionally, an initial revision REV
;;   and an initial description of the file, COMMENT, may be specified.
;;   The implementation should pass the value of vc-register-switches
;;   to the backend command.

;; XXX we can't do this for the cache
 
;;
;; - init-version (file)
;;
;;   The initial version to use when registering FILE if one is not
;;   specified by the user.  If not provided, the variable
;;   vc-default-init-version is used instead.
;;
;; - responsible-p (file)
;;
;;   Return non-nil if this backend considers itself "responsible" for
;;   FILE, which can also be a directory.  This function is used to find
;;   out what backend to use for registration of new files and for things
;;   like change log generation.  The default implementation always
;;   returns nil.
;;
;; - could-register (file)
;;
;;   Return non-nil if FILE could be registered under this backend.  The
;;   default implementation always returns t.
;;
;; - receive-file (file rev)
;;
;;   Let this backend "receive" a file that is already registered under
;;   another backend.  The default implementation simply calls `register'
;;   for FILE, but it can be overridden to do something more specific,
;;   e.g. keep revision numbers consistent or choose editing modes for
;;   FILE that resemble those of the other backend.
;;
;; - unregister (file)
;;
;;   Unregister FILE from this backend.  This is only needed if this
;;   backend may be used as a "more local" backend for temporary editing.
;;
;; * checkin (file rev comment)
;;
;;   Commit changes in FILE to this backend.  If REV is non-nil, that
;;   should become the new revision number.  COMMENT is used as a
;;   check-in comment.  The implementation should pass the value of
;;   vc-checkin-switches to the backend command.

;; XX we can't do this for the cache

;;
;; * find-version (file rev buffer)
;;
;;   Fetch revision REV of file FILE and put it into BUFFER.
;;   If REV is the empty string, fetch the head of the trunk.
;;   The implementation should pass the value of vc-checkout-switches
;;   to the backend command.

;; We need to load the cached version of the file into a buffer

(defun vc-acmec-find-version (file rev buffer)
  (let ((dirname (or (file-name-directory file) ""))
        (basename (file-name-nondirectory file))
        (revname (concat ".CC/cache/" (file-name-nondirectory file) "@@"
                             (vc-acmec-rev-to-file rev))))
    (when (file-exists-p (expand-file-name revname dirname))
      (set-buffer buffer)
      (vc-insert-file (expand-file-name revname dirname))
      (vc-switches 'ACMEC 'checkout))))

;;      (vc-switches 'ACMEC 'checkout))))

;;
;; * checkout (file &optional editable rev)
;;
;;   Check out revision REV of FILE into the working area.  If EDITABLE
;;   is non-nil, FILE should be writable by the user and if locking is
;;   used for FILE, a lock should also be set.  If REV is non-nil, that
;;   is the revision to check out (default is current workfile version).
;;   If REV is t, that means to check out the head of the current branch;
;;   if it is the empty string, check out the head of the trunk.
;;   The implementation should pass the value of vc-checkout-switches
;;   to the backend command.

(defun vc-acmec-checkout (file &optional editable rev workfile)
  "Retrieve a revision of FILE into a WORKFILE.
EDITABLE non-nil means that the file should be writable.
REV is the revisions to check out into WORKFILE."
  (let ((filename (or workfile file))
	(file-buffer (get-file-buffer file))
	switches)
    (when (not workfile)
      (throw "no-workfile" nil))
    (message "Checking out %s..." filename)
    (save-excursion
      ;; Change buffers to get local value of vc-checkout-switches.
      (if file-buffer (set-buffer file-buffer))
      (setq switches (vc-switches 'ACMEC 'checkout))
      ;; Save this buffer's default-directory
      ;; and use save-excursion to make sure it is restored
      ;; in the same buffer it was saved in.
      (let ((default-directory default-directory))
	(save-excursion
	  ;; Adjust the default-directory so that the check-out creates
	  ;; the file in the right place.
	  (setq default-directory (file-name-directory filename))
	  (if workfile
	      (let ((failed t)
                    (backup-name (if (string= file workfile)
                                     (car (find-backup-file-name filename)))))
                (when backup-name
                  (copy-file filename backup-name
                             'ok-if-already-exists 'keep-date)
                  ;; make the file writeable
                  (unless (file-writable-p filename)
                    (set-file-modes filename
                                    (logior (file-modes filename) 128))))
		(unwind-protect
		    (progn
                      (let ((coding-system-for-read 'no-conversion)
                            (coding-system-for-write 'no-conversion)
                            (revname
                             (concat ".CC/cache/"
                                     (file-name-nondirectory file)
                                     "@@" (vc-acmec-rev-to-file rev))))
                        (with-temp-file filename
                          (vc-insert-file revname)
                          (setq failed nil))))
		  (if failed
                      (if backup-name
                          (rename-file backup-name filename
                                       'ok-if-already-exists)
                        (if (file-exists-p filename)
                            (delete-file filename)))
                    (and backup-name
                         (not vc-make-backup-files)
                         (delete-file backup-name)))))))
	(vc-mode-line file)
	(message "Checking out %s...done" filename)))))


;;
;; * revert (file &optional contents-done)
;;
;;   Revert FILE back to the current workfile version.  If optional
;;   arg CONTENTS-DONE is non-nil, then the contents of FILE have
;;   already been reverted from a version backup, and this function
;;   only needs to update the status of FILE within the backend.

;;
;; XXX simple enough to write 

;;
;; - cancel-version (file editable)
;;
;;   Cancel the current workfile version of FILE, i.e. remove it from the
;;   master.  EDITABLE non-nil means that FILE should be writable
;;   afterwards, and if locking is used for FILE, then a lock should also
;;   be set.  If this function is not provided, trying to cancel a
;;   version is caught as an error.
;;
;; - merge (file rev1 rev2)
;;
;;   Merge the changes between REV1 and REV2 into the current working file.
;;
;; - merge-news (file)
;;
;;   Merge recent changes from the current branch into FILE.
;;
;; - steal-lock (file &optional version)
;;
;;   Steal any lock on the current workfile version of FILE, or on
;;   VERSION if that is provided.  This function is only needed if
;;   locking is used for files under this backend, and if files can
;;   indeed be locked by other users.
;;
;; HISTORY FUNCTIONS
;;
;; * print-log (file &optional buffer)
;;
;;   Insert the revision log of FILE into BUFFER, or the *vc* buffer
;;   if BUFFER is nil.

;; XXX can't do this with the cache

;;
;; - show-log-entry (version)
;;
;;   If provided, search the log entry for VERSION in the current buffer,
;;   and make sure it is displayed in the buffer's window.  The default
;;   implementation of this function works for RCS-style logs.
;;
;; - wash-log (file)
;;
;;   Remove all non-comment information from the output of print-log.  The
;;   default implementation of this function works for RCS-style logs.
;;
;; - logentry-check ()
;;
;;   If defined, this function is run to find out whether the user
;;   entered a valid log entry for check-in.  The log entry is in the
;;   current buffer, and if it is not a valid one, the function should
;;   throw an error.
;;
;; - comment-history (file)
;;
;;   Return a string containing all log entries that were made for FILE.
;;   This is used for transferring a file from one backend to another,
;;   retaining comment information.  The default implementation of this
;;   function does this by calling print-log and then wash-log, and
;;   returning the resulting buffer contents as a string.
;;
;; - update-changelog (files)
;;
;;   Using recent log entries, create ChangeLog entries for FILES, or for
;;   all files at or below the default-directory if FILES is nil.  The
;;   default implementation runs rcs2log, which handles RCS- and
;;   CVS-style logs.
;;
;; * diff (file &optional rev1 rev2 buffer)
;;
;;   Insert the diff for FILE into BUFFER, or the *vc-diff* buffer if
;;   BUFFER is nil.  If REV1 and REV2 are non-nil, report differences
;;   from REV1 to REV2.  If REV1 is nil, use the current workfile
;;   version (as found in the repository) as the older version; if
;;   REV2 is nil, use the current workfile contents as the newer
;;   version.  This function should pass the value of (vc-switches
;;   BACKEND 'diff) to the backend command.  It should return a status
;;   of either 0 (no differences found), or 1 (either non-empty diff
;;   or the diff is run asynchronously).
;;
;; - diff-tree (dir &optional rev1 rev2)
;;
;;   Insert the diff for all files at and below DIR into the *vc-diff*
;;   buffer.  The meaning of REV1 and REV2 is the same as for
;;   vc-BACKEND-diff.  The default implementation does an explicit tree
;;   walk, calling vc-BACKEND-diff for each individual file.
;;
;; - annotate-command (file buf &optional rev)
;;
;;   If this function is provided, it should produce an annotated display
;;   of FILE in BUF, relative to version REV.  Annotation means each line
;;   of FILE displayed is prefixed with version information associated with
;;   its addition (deleted lines leave no history) and that the text of the
;;   file is fontified according to age.
;;
;; - annotate-time ()
;;
;;   Only required if `annotate-command' is defined for the backend.
;;   Return the time of the next line of annotation at or after point,
;;   as a floating point fractional number of days.  The helper
;;   function `vc-annotate-convert-time' may be useful for converting
;;   multi-part times as returned by `current-time' and `encode-time'
;;   to this format.  Return nil if no more lines of annotation appear
;;   in the buffer.  You can safely assume that point is placed at the
;;   beginning of each line, starting at `point-min'.  The buffer that
;;   point is placed in is the Annotate output, as defined by the
;;   relevant backend.  This function also affects how much of the line
;;   is fontified; where it leaves point is where fontification begins.
;;
;; - annotate-current-time ()
;;
;;   Only required if `annotate-command' is defined for the backend,
;;   AND you'd like the current time considered to be anything besides
;;   (vs-annotate-convert-time (current-time)) -- i.e. the current
;;   time with hours, minutes, and seconds included.  Probably safe to
;;   ignore.  Return the current-time, in units of fractional days.
;;
;; - annotate-extract-revision-at-line ()
;;
;;   Only required if `annotate-command' is defined for the backend.
;;   Invoked from a buffer in vc-annotate-mode, return the revision
;;   corresponding to the current line, or nil if there is no revision
;;   corresponding to the current line.
;;

(defun vc-acmec-time-from-seconds (sec)
  "Convert a decimal seconds since epoch to emacs (hi low) format
 (There must be a better way than shell commands!)"
  (list (string-to-number
      (shell-command-to-string (concat "expr " sec " / 65536")))
        (string-to-number
         (shell-command-to-string (concat "expr " sec " % 65536")))))

(defun vc-acmec-entry-filename (entry)
  (nth 0 entry))
(defun vc-acmec-entry-revision (entry)
  (nth 1 entry))
(defun vc-acmec-entry-timestamp (entry)
  (nth 2 entry))
(defun vc-acmec-entry-checksum (entry)
  (nth 3 entry))

(defun vc-acmec-rev-to-file (rev)
  "Convert a revision of the form main!branch!digits to /main/branch/digits."
  (replace-regexp-in-string ":" "/" rev))
(defun vc-acmec-file-to-rev (rev)
  "Convert a revision of the form main/branch/digits to main!branch!digits."
  (replace-regexp-in-string "/" ":" rev))


(defun vc-acmec-get-entry (file)
  "Lookup an entry for file in the .CC/original.status file result returned
in a list (filename revision timestamp md5checksum)."
  (with-temp-buffer
    (let ((dirname (or (file-name-directory file) ""))
          (basename (file-name-nondirectory file))
          entry-string
          (case-fold-search nil))
      (vc-insert-file (expand-file-name ".CC/original.status" dirname))
      (goto-char (point-min))
      (if (re-search-forward
           (concat "^original"
                   ;; timestamp checksum revision
                   " \\([0-9]+\\) MD5:[0-9]+:\\([0-9a-zA-Z]+\\) \\([^ \t\n]+\\)"
                   ;; filename
                   " \\(" (regexp-quote basename) "\\)[ ]*$") nil t)
          (list (match-string 4)
                (vc-acmec-file-to-rev (match-string 3))
                (vc-acmec-time-from-seconds (match-string 1))
                (match-string 2))
        nil))))

(provide 'vc-acmec)
