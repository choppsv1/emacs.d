;;
;; March 24 2014, Christian Hopps <chopps@gmail.com>
;;
;; Copyright (c) 2014 by Christian E. Hopps
;; All rights reserved.
;;
;; Requiremens prior to first-load: cask intall
;; See emacs-init.org on how to install cask.
;;

;; Disabled
;; (defun current-time-microseconds ()
;;  (let* ((nowtime (current-time))
;;          (now-ms (nth 2 nowtime)))
;;     (concat (format-time-string "[%Y-%m-%dT%T" nowtime) (format ".%d] " now-ms))))
;; (defadvice message (before when-was-that activate)
;;   "Add timestamps to `message' output."
;;   (ad-set-arg 0 (concat (current-time-microseconds)
;;                         (ad-get-arg 0)) ))
;; (setq use-package-verbose t)


;; Old pallet/cask code
;; (setq use-package-debug nil)
;; (ad-disable-advice 'message 'before 'when-was-that)
;; (ad-update 'message)
;; (message "Starting cask")
;; (if (not (file-exists-p "/usr/local/Cellar/cask"))
;;     (require 'cask "~/.cask/cask.el")
;;   (require 'cask
;;           (replace-regexp-in-string "\n$" ""
;;                                     (shell-command-to-string
;;                                      "/usr/local/bin/brew list cask | grep cask.el | head -1"))))
;; (cask-initialize)
;; (message "Requiring pallet")
;; (require 'pallet)
;; (message "Enabling pallet mode")
;; (pallet-mode t)


;; (setq debug-on-error t)
(setq package-user-dir (concat user-emacs-directory "packages/" emacs-version "/elpa"))

;; Load the rest of our config from the emacs-init.org file.
;; (setq dotfiles-dir (file-name-directory (or (buffer-file-name)
;;                                            load-file-name)))
(setq emacs-init-target (concat user-emacs-directory "emacs-init.el"))
(setq emacs-init-source (concat user-emacs-directory "emacs-init.org"))
(if (or (not (file-exists-p emacs-init-target)) (file-newer-than-file-p emacs-init-source emacs-init-target))
    (let* ((org-dir (and (file-exists-p package-user-dir)
                         (expand-file-name (file-name-completion "org-plus-contrib-" package-user-dir) package-user-dir)))
	   (exit-after-write nil))
      (if (and org-dir (file-exists-p org-dir))
	  (let ((load-path (append (list org-dir)
				   (or load-path nil))))
	    (require 'ob-tangle))
	(setq exit-after-write t)
	(require 'ob-tangle))
      (message "Converting emacs-init.org using %s and load path %s" org-dir load-path)
      (message "Saved to %s" (org-babel-tangle-file emacs-init-source emacs-init-target "emacs-lisp"))
      (message "Done converting emacs-init.org")
      (if exit-after-write
	  (kill-emacs))))

(message "Loading up-to-date emacs-init.el")
(load-file emacs-init-target)
;; Disabled
;; (ad-disable-advice 'message 'before 'when-was-that)
;; (ad-update 'message)
