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
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(blink-matching-paren (quote jump))
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "9d7844491c085559f53f741f4539e6e101691ff2f958f7eefe8c5010e0a39723" "a79a76afd58ba775553c82a2ffbe3b9b05d2718e1aac0594c1bbfb5b9c24003d" "e0e9d9f4495b98f9acacf43ea77df1826bef7fb2feaec32f7d449c7cd8c05a53" "025354235e98db5e7fd9c1a74622ff53ad31b7bde537d290ff68d85665213d85" "767c3539b11193191734367c70fba135408f7de351cd315c3a17ea837605770a" "2afe3283c2e4f81474174aa665aa4b43c8a39ba5686500155960facf83cd6edc" "6fe6ab4abe97a4f13533e47ae59fbba7f2919583f9162b440dd06707b01f7794" "3e82f5d4363ecd52f67615290ec602469d1aa4c5dc016608c2d36249ae42d8fc" "7bf10dc9d882eca8cb2893737831589c204fe8b8efbd2140ae39c52e2084afa8" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "ecc9eb9872c62536082498b8126c53ae821a2c7f7e2e120fccf8e4ed60b6187c" default)))
 '(ediff-diff-options "--minimal")
 '(evil-want-fine-undo t)
 '(fci-rule-color "#073642")
 '(gtags-path-style (quote relative))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
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
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(temporary-file-directory "/tmp")
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c37300")
     (60 . "#b97d00")
     (80 . "#b58900")
     (100 . "#a18700")
     (120 . "#9b8700")
     (140 . "#948700")
     (160 . "#8d8700")
     (180 . "#859900")
     (200 . "#5a942c")
     (220 . "#439b43")
     (240 . "#2da159")
     (260 . "#16a870")
     (280 . "#2aa198")
     (300 . "#009fa7")
     (320 . "#0097b7")
     (340 . "#008fc7")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(vc-follow-symlinks t)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "#c0c0c0" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Monaco"))))
 '(flymake-warnline ((t (:background "color-236"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "red" :inverse-video nil :underline nil :slant italic :weight normal))))
 '(font-lock-comment-face ((t (:foreground "red" :inverse-video nil :underline nil :slant italic :weight normal))))
 '(show-paren-match ((t (:foreground "#d33682" :inverse-video t :weight bold)))))

 ;; '(default ((t (:inherit nil :stipple nil :foreground "#c0c0c0" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 1 :width normal :foundry "default" :family "default"))))
