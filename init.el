;;
;; March 24 2014, Christian Hopps <chopps@gmail.com>
;;
;; Copyright (c) 2014 by Christian E. Hopps
;; All rights reserved.
;;
;; Requiremens prior to first-load: cask intall
;; See emacs-init.org on how to install cask.
;;
(if (not (file-exists-p "/usr/local/Cellar/cask"))
    (require 'cask "~/.cask/cask.el")
  (require 'cask
           (replace-regexp-in-string "\n$" ""
                                     (shell-command-to-string
                                      "/usr/local/bin/brew list cask | grep cask.el | head -1"))))
(cask-initialize)

;; Load the rest of our config from the emacs-init.org file.
(require 'ob-tangle)
;; (setq debug-on-error t)
(org-babel-load-file
  (expand-file-name "emacs-init.org"
                    user-emacs-directory))
