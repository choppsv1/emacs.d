;;
;; March 24 2014, Christian Hopps <chopps@gmail.com>
;;
;; Copyright (c) 2014 by Christian E. Hopps
;; All rights reserved.
;;
;; Requiremens prior to first-load: cask intall
;; See emacs-init.org on how to install cask.
;;
(defun current-time-microseconds ()
 (let* ((nowtime (current-time))
         (now-ms (nth 2 nowtime)))
    (concat (format-time-string "[%Y-%m-%dT%T" nowtime) (format ".%d] " now-ms))))

(defadvice message (before when-was-that activate)
  "Add timestamps to `message' output."
  (ad-set-arg 0 (concat (current-time-microseconds)
                        (ad-get-arg 0)) ))
(setq use-package-verbose t)
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

(message "Requiring ob-tangle")

;; Load the rest of our config from the emacs-init.org file.


;; (setq debug-on-error t)
(message "Loading emacs-init.org")
(if (file-newer-than-file-p "emacs-init.org" "emacs-init.el")
    (progn
      (require 'ob-tangle)
      (org-babel-load-file
       (expand-file-name "emacs-init.org"
			 user-emacs-directory)))
  (load-file "emacs-init.el"))
(ad-disable-advice 'message 'before 'when-was-that)
(ad-update 'message)
