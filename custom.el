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
 '(blink-matching-paren (quote jump))
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "9d7844491c085559f53f741f4539e6e101691ff2f958f7eefe8c5010e0a39723" "a79a76afd58ba775553c82a2ffbe3b9b05d2718e1aac0594c1bbfb5b9c24003d" "e0e9d9f4495b98f9acacf43ea77df1826bef7fb2feaec32f7d449c7cd8c05a53" "025354235e98db5e7fd9c1a74622ff53ad31b7bde537d290ff68d85665213d85" "767c3539b11193191734367c70fba135408f7de351cd315c3a17ea837605770a" "2afe3283c2e4f81474174aa665aa4b43c8a39ba5686500155960facf83cd6edc" "6fe6ab4abe97a4f13533e47ae59fbba7f2919583f9162b440dd06707b01f7794" "3e82f5d4363ecd52f67615290ec602469d1aa4c5dc016608c2d36249ae42d8fc" "7bf10dc9d882eca8cb2893737831589c204fe8b8efbd2140ae39c52e2084afa8" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "ecc9eb9872c62536082498b8126c53ae821a2c7f7e2e120fccf8e4ed60b6187c" default)))
 '(ediff-diff-options "--minimal")
 '(evil-want-fine-undo t)
 '(fci-rule-color "#073642")
 '(flyspell-auto-correct-binding [67108922])
 '(gtags-path-style (quote relative))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(jedi:server-args (quote ("--sys-path" "/ws/chopps-sjc/ws/xrut-ats/modules")))
 '(mac-command-key-is-meta nil)
 '(mac-command-modifier (quote alt))
 '(mac-option-modifier (quote (:ordinary meta :mouse alt)))
 '(magit-use-overlays nil)
 '(make-backup-files nil)
 '(max-specpdl-size 5)
 '(ns-alternate-modifier (quote meta))
 '(ns-command-modifier (quote alt))
 '(org-agenda-files (quote ("~/org-mode/index.org")))
 '(org-modules
   (quote
    (org-bullets org-mac-iCal org-mac-link org-w3m org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-rmail)))
 '(org-protocol-default-template-key "t")
 '(org-taskjuggler-default-global-properties
   "shift s40 \"Part time shift\" {
  workinghours wed, thu, fri off
}
# Export the scheduled project as Microsoft Project XML format.
export \"MS-Project\" {
  formats mspxml
  loadunit quarters
}
")
 '(org-taskjuggler-valid-resource-attributes
   (quote
    (limits vacation shift booking efficiency journalentry rate workinghours flags supplement)))
 '(safe-local-variable-values (quote ((pymacs-auto-reload . t))))
 '(scroll-step 1)
 '(show-trailing-whitespace t)
 '(temporary-file-directory "/tmp")
 '(vc-annotate-background nil)
 '(vc-follow-symlinks t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Menlo"))))
 '(flymake-warnline ((t (:background "color-236"))))
 ;; '(font-lock-comment-delimiter-face ((t (:foreground "red" :inverse-video nil :underline nil :slant italic :weight normal))))
 ;; '(font-lock-comment-face ((t (:foreground "red" :inverse-video nil :underline nil :slant italic :weight normal))))
 ;; '(mode-line ((t (:background "white" :foreground "brightgreen" :inverse-video t :box nil :underline nil :slant normal :weight normal))))
 ;; '(mode-line-inactive ((t (:background "black" :foreground "brightgreen" :inverse-video t :box nil :underline nil :slant normal :weight normal))))
 '(show-paren-match ((t (:foreground "#d33682" :inverse-video t :weight bold)))))

 ;; '(default ((t (:inherit nil :stipple nil :foreground "#c0c0c0" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 1 :width normal :foundry "default" :family "default"))))
