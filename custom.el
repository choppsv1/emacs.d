;;
;; February 23 2014, Christian Hopps <chopps@gmail.com>
;;
;; Copyright (c) 2014 by Christian E. Hopps.
;; All rights reserved.
;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "3e82f5d4363ecd52f67615290ec602469d1aa4c5dc016608c2d36249ae42d8fc" default)))
 '(ediff-diff-options "--minimal")
 '(evil-want-fine-undo t)
 '(global-font-lock-mode t nil (font-lock))
 '(gtags-path-style (quote relative))
 '(indent-tabs-mode nil)
 '(jedi:server-args (quote ("--sys-path" "/ws/chopps-sjc/ws/xrut-ats/modules" "--log" "/tmp/jedi-log.txt" "--log-level" "DEBUG")))
 '(mac-command-key-is-meta nil)
 '(make-backup-files nil)
 '(max-specpdl-size 5)
 '(ns-alternate-modifier (quote meta))
 '(ns-command-modifier (quote alt))
 '(org-agenda-files (quote ("~/org-mode/index.org")))
 '(org-taskjuggler-default-global-properties "shift s40 \"Part time shift\" {
  workinghours wed, thu, fri off
}
# Export the scheduled project as Microsoft Project XML format.
export \"MS-Project\" {
  formats mspxml
  loadunit quarters
}
")
 '(org-taskjuggler-valid-resource-attributes (quote (limits vacation shift booking efficiency journalentry rate workinghours flags supplement)))
 '(safe-local-variable-values (quote ((pymacs-auto-reload . t))))
 '(scroll-step 1)
 '(show-trailing-whitespace t)
 '(sml/theme (quote respectful))
 '(temporary-file-directory "/tmp")
 '(vc-follow-symlinks t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :family "Menlo"))))
 '(flycheck-error ((t (:background "Red1" :foreground "Black" :underline (:color "Red1" :style wave)))) t)
 '(flycheck-warning ((t (:background "DarkOrange" :foreground "Black" :underline (:color "DarkOrange" :style wave)))) t)
 '(flymake-warnline ((t (:inherit default :underline (:color "Orange3" :style wave)))))
 '(font-lock-comment-face ((t (:foreground "Red" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(mode-line ((t (:background "navajo white" :foreground "Black"))))
 '(mode-line-buffer-id ((t (:foreground "DarkBlue" :weight bold))))
 '(org-column ((t (:background "grey10" :strike-through nil :underline nil :slant normal :weight normal :height 120 :family "Monaco"))))
 '(trailing-whitespace ((t (:background "#585858")))))
