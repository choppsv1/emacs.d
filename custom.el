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
 '(custom-safe-themes (quote ("3e82f5d4363ecd52f67615290ec602469d1aa4c5dc016608c2d36249ae42d8fc" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "1c3c6e5b1bdc0e32d8f9bf3ea98ec7f3187db4ff52bef7069cc9e9a1652bf2b1" "bce612bb20e3ea75a36298af0e195da66dc83810f2369ba6df9b2f1b32cab071" "82994ff4d41f12abc8e22739c664e5198dcbf31a09623fe036f92219e29c33b2" "ff973d84c720881378bd7492747bdb9f890ba20f265cb8e4eab1b3a59ef294ed" "bf6c638dac12d35b14ed379963d0ff56421fd760b1119a0c7a38cdd024f4a737" "d5d6f1d2fd1097191ba5a50575fd47aa83fc641a9372316f07f820913d51d6d5" "b6a17e2c2f487d8465cbed6c7b2fba52a4f5f3156c7723b4eae9b84eae89c733" "d86d58d9644504e2fc9e4f93a60ee72f6c8ebc4606ffc3161d446ade3c35523b" "3f038447d659b8d776f6e066f2ee86bdb278f8cf7bb090a03fc4a16cb65180f5" "0769ae3268d7f0cba02eeab7faa3a07256766473e873193841cc8af5fb0496bb" "641fc9deab7f6bde7160f3a5f0525f0c647523ebc1a03f67544d770977ae2119" "ec0c9d1715065a594af90e19e596e737c7b2cdaa18eb1b71baf7ef696adbefb0" "bbb51078321186cbbbcb38f9b74ea154154af10c5d9c61d2b0258cb4401ac038" "1faffcddc50d5dc7d334f2817dd6f159ef1820be3aad303eb7f74006531afdff" "81df5c7887aaa76c0174ae54aacd20ab18cc263b95332b09efa0d60a89feaf6a" "ef36e983fa01515298c017d0902524862ec7d9b00c28922d6da093485821e1ba" "0ca71d3462db28ebdef0529995c2d0fdb90650c8e31631e92b9f02bd1bfc5f36" "fc89666d6de5e1d75e6fe4210bd20be560a68982da7f352bd19c1033fb7583ba" "f2355ec455645cd4a4b8f8ac8bcb96c50bc8f383634e59307d8bc651143f6be4" "31772cd378fd8267d6427cec2d02d599eee14a1b60e9b2b894dd5487bd30978e" "50d8de7ef10b93c4c7251888ff845577004e086c5bfb2c4bb71eca51b474063a" "ab91ad83f4c9e12a8d01458e83954fd244541eb9412c87d1ab831629c47ad504" "17a8fa9430ffd81f242ed3ee95e59629ccf9e1210657536013a0def9b16e68c9" "234249a92c2cf7b61223d9f83e1d9eefcd80fcf6b7a5e9ca03dc9d3f1b122ae2" "2c73700ef9c2c3aacaf4b65a7751b8627b95a1fd8cebed8aa199f2afb089a85f" "f34690262d1506627de39945e0bc2c7c47ece167edea85851bab380048dc8580" default)))
 '(ediff-diff-options "--minimal")
 '(global-font-lock-mode t nil (font-lock))
 '(gtags-path-style (quote relative))
 '(indent-tabs-mode nil)
 '(mac-command-key-is-meta nil)
 '(max-specpdl-size 5)
 '(ns-alternate-modifier (quote meta))
 '(ns-command-modifier (quote alt))
 '(safe-local-variable-values (quote ((pymacs-auto-reload . t))))
 '(show-trailing-whitespace t)
 '(temporary-file-directory "/tmp")
 '(vc-follow-symlinks t))

(if (and athome on-mac)
    (if athome
        (custom-set-faces
         ;; custom-set-faces was added by Custom.
         ;; If you edit it by hand, you could mess it up, so be careful.
         ;; Your init file should contain only one such instance.
         ;; If there is more than one, they won't work right.
         ;;'(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "apple" :family "Menlo")))))
       '(default ((t (:inherit nil :family "Menlo")))))
      (custom-set-faces
       ;; custom-set-faces was added by Custom.
       ;; If you edit it by hand, you could mess it up, so be careful.
       ;; Your init file should contain only one such instance.
       ;; If there is more than one, they won't work right.
       '(default ((t (:inherit nil :family "Menlo")))))))
  
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :family "Menlo"))))
 '(flycheck-error ((t (:background "Red1" :foreground "Black" :underline (:color "Red1" :style wave)))))
 '(flycheck-warning ((t (:background "DarkOrange" :foreground "Black" :underline (:color "DarkOrange" :style wave)))))
 '(flymake-warnline ((t (:inherit default :underline (:color "Orange3" :style wave)))))
 '(font-lock-comment-face ((t (:foreground "Red" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(mode-line ((t (:background "navajo white" :foreground "Black"))))
 '(mode-line-buffer-id ((t (:foreground "DarkBlue" :weight bold)))))
