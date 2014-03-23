(setq debug-on-error t)
(if (file-exists-p "/usr/local/Cellar/cask/0.6.0/cask.el")
    (require 'cask "/usr/local/Cellar/cask/0.6.0/cask.el")
  (require 'cask "~/.cask/cask.el"))
(cask-initialize)
(require 'pallet)
(require 'req-package)

;; Load the rest of our config from the emacs-init.org file.
(require 'ob-tangle)
(org-babel-load-file
  (expand-file-name "emacs-init.org"
                    user-emacs-directory))
