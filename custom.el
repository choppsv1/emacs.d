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
   ["#5f5f5f" "#ff4b4b" "#a1db00" "#fce94f" "#5fafd7" "#d18aff" "#afd7ff" "#ffffff"])
 '(blink-matching-paren (quote jump))
 '(compilation-message-face (quote default))
 '(cursor-color "#839496")
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "97f14bc52a6fa4aaab8bb8dac480562134db9cab701fa57215ab3b689d5df2e3" "9e5579892c376f3b94408cc3dc4addba296a66885e614bd69b89e9d41df6e07b" "9a596dd204019c4b5efc49fa73dea3f55b7ac5c13ad422afe95288b065988a94" "74278d14b7d5cf691c4d846a4bbf6e62d32104986f104c1e61f718f9669ec04b" "40a783fd65a506a532c32423cd5ca3619d8192cac030b1f1cc2a609d7521bc9d" "f0eda5a0cbe43d2febfbbeed6830c6205f4b3edd1a3597a002c57f79f36cff89" "733e15f82f33a908eb8c23f59de15c0ebee237c6f2612a2658392b97ca79fd91" "d2a8afb097bad9601cde0be3e54a77b72f9a6fd9b2a0e3d989f5de7ec65a59be" "1caf37e01a3eb214cad263df639561b5c1fe8b6688357b7face0d114db55cb22" "75e04a413a1190dc38cd13dcb323f59c0bf0c74e48587559653cd9f3733590cf" "344796539418d052a8d96c65e786f1a49f17fdb704aa9153cd94820521c83da5" "642876830eeb4a044abf3c27d6455942603966e82a5eb79150ee5b2aa491f93e" "cb5057632fc74406a981ae604c616cba6d57169f44cb144624410c0b62d199fc" "762f876a8b353246d78ccba5504e7568b82f1428a3a762d5ee84029a29fac7ac" "e8f40a7d8a16ff9a1ec82dffe34cba03df1fddabd24f25e0d7ff6f72fae7141e" "61ae47d7175cd41b1093a15a2086edd4280f68ba10e6f0e77914c285b1600c70" "4ddb77471f2d9cba54b9cb2d584b0d881b9306673ee4779e832cb1bdcfa44547" "db7b353808344c9789fea92b06bbaddcd4e72c560f6d19174f1c328050b8557a" "60aec68739315d0ab01f72264ed97f80fd01239b7d9cc03af41cdd64e7b96f2f" "26614652a4b3515b4bbbb9828d71e206cc249b67c9142c06239ed3418eff95e2" "457cc03a8813275a27f48aab7cbe3d34215fc998e98fe863560505439fd12480" "1a1f8a7b60e9688ceb507d2496a00912cbbb0ce837838484986ded2e530dcf8c" "d8c980741841970630f1b4b7d784a2092b299e8776b371f5558aa03cbb7e22c3" "c7f7dfaeddfd2364f9c5238b77fbad197e80299fb1b240e82a416a4f1c6d4d0e" "63e99890345d047d6e371b7551d8cdf4c57dccf626771d72880431403851cef1" "3a54e5de411ae8cb308c218aa33c32f7fcd5469423bf29880eddae14aa49c5b7" "4d0635937c272260244546f775c57bee28ef3b6b36de7f9dd8b67ea9b40fd2fa" "ef42be0b727f673b34990d18304ac603686f83095342ef782545762fb23c777c" "504f03efbb7486c8cba7175c65b7051c22095168faf244218f32cf677618e772" "e81efc0578c7912d650f5b10397d6aa9724a3cc3095351b2260714292a2ce37c" "e5541a48e01a071db1905dc7575db80635a9e9a73e2b261ab8d826fe18302087" "eb7b598090efd9eca4a6d65ce7f52b8afe8956c787932c4396c14ca62fe5ff30" "92b4d2c32a8ba03094347fc81ba73b62ef29e5e17dc3c18ac6a8012cdc63e150" "f8c9bd3b7358d26320b4f32d5e5d3d99ed76baa7bcc472e70a17365f468ba59c" "5cba3af968ffa185b8a2a608638a837dd7a8ebfdbdca5004b5d39cfbcff1fa45" "def98940d916418158a05fa213b9746b6f10ed6e717fe8c76b98d243fcf06ce1" "87e6fb77a4e3d02e8b9fa11038147549edcdd1476d821dcbc5cc6c001ffa58c8" "f48465409dcdbae6ad4cfc9090a4b935b292c5440f6201fa37b3a888b1e17452" "0a6228bb64e1404c54ca0727480c60e9d7f230db3668d42299729ab28119bc99" "02e717f16686b465a15e8ebe9e45efc3b277460f1c1397660da7c15f047af63f" "35b5e4bbdad4adca3a59b41b2e6f0a5652286c142ba00680fc452bfb720140fd" "37ec7590c5eea4518576bcfbb10f124c612d71fbe01051e2031a36051a5b1773" "76b9f9ff11e8bf501d19cf9efabf4f10eca04c8f072169e4b4c2eecbff6068da" "0e13ee6561b4f7e0493c1ec09396b3a1d7588912babcfc75351fefbd66db56df" "fb7b5b24d459ccf40f44659506a111ff0df9a07117a00aaee4999952a92f056a" "8199df91124746729a520bec524af8531e31134277e330142b35dc3cf5290d4a" "08efabe5a8f3827508634a3ceed33fa06b9daeef9c70a24218b70494acdf7855" "1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" "4dd1b115bc46c0f998e4526a3b546985ebd35685de09bc4c84297971c822750e" "3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" "90edd91338ebfdfcd52ecd4025f1c7f731aced4c9c49ed28cfbebb3a3654840b" "764e3a6472a3a4821d929cdbd786e759fab6ef6c2081884fca45f1e1e3077d1d" "4af6fad34321a1ce23d8ab3486c662de122e8c6c1de97baed3aa4c10fe55e060" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "8288b9b453cdd2398339a9fd0cec94105bc5ca79b86695bd7bf0381b1fbe8147" "cc0dbb53a10215b696d391a90de635ba1699072745bf653b53774706999208e3" "f782ed87369a7d568cee28d14922aa6d639f49dd676124d817dd82c8208985d0" "f3278046d89cd5bc16fbe006a9fdec1d20b4466f12d5e80ee7a92dd4a34ff886" "c13601380bc9959dcb6913e68e5f73b6b5c71a38a95a18961be07de9c899e951" "d54a3dbe479399c87ee777528d80d152ed6d78145d8cfbd1ceae757ac6ef7b77" "405279bb6726c6c338f0985702341993579f709f7b0d2839f6be1e7a2df9f481" "57c7478f41af5099b4a4b8b106d75079a55d0ac656f235d3166554bd880a29bf" "49c48d6b308ad8b200893966ef68e724fce47cf971984dc0428603dd58984360" "bba277f89fa58703df7d55cb79fed8737510847cda16fab0c2bba36c60bf5602" "e88be47d58e15316cb3ab3e9234b9f4349802b75a8b4ab4d7a5036f579a3351e" "f56be17c2cd65036fa9a1a07d3fd7fc2db1b11d766718227110d031a79fd10d2" "28e8d320fa3090fb3800c94aa10074b7f023c94f20d8df99e5b03af1d9b40f61" "48450d202dcecb3d03dccae5f6d9ca97d9b763585a5a2c83d3acb95c04a09b95" "8953d4486078211e7659aa2fd7538c80dd1d1b01d9b859ed07606a01a99edb96" "c492989af6e86f5af6a1de3deeb14091e395d2e80883aaaa51f8081af870b43b" "5c13a4a10815c1e2cce29c6c6879a71fcec398997006987ba9067335b433c550" "641e870ef457c16c807fd98d4aa36e5b7b7e89ba9e447b97d6d7b8f6c3737ec3" "c809a231cfa4b5915e238ef432b2bf9c00aaeda4039da796945930bee843658e" "c7fe605906cc445f1177db61a160fac35efe4873c20351b0c97e124b159d0dc4" "8bef186c83b02a8289c0dd2e0691dbb6fafcd53827495bc0c1c163b19802088b" "0353ac0e8a12a2c01f804ca1b574230a988208f4f915759cdee6a2bdab1c87e1" "1803e720717f9666ec2d7bceba219def91806a7660ba77e93d8aacf0b279a918" "0ab11bd9bfd068e757e872630124ad229a920775c75898eb0c229a6126ac6fa3" "0cfbd3262f35cf8c3f09db64b71c6e73af4790d875049fcf02e3c228ee7d2e93" "67a03b464eda79f521b04d38cdb229e3364b82b013f2d883c1ba21b1eb9fbfc6" "6dd652228a045804c2d08c8af262697783baf1fe2710f35653901e6c015dfbf3" "e9721046efbb419abac75698e787d3b26e41c0e7bde2b9aacaf11b4c2b759e93" "08851585c86abcf44bb1232bced2ae13bc9f6323aeda71adfa3791d6e7fea2b6" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "2ebd8de752afa9ed93616d8c83314b4a525ad3821f5c3b0df5bb349c03a6c89f" "ded99382e6720605744479900c940e8461f8b766014178c103e3e8bf14b9761c" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "31a01668c84d03862a970c471edbd377b2430868eccf5e8a9aec6831f1a0908d" "1297a022df4228b81bc0436230f211bad168a117282c20ddcba2db8c6a200743" "8025178ffb4ec0fe3eaf5d7d8466d631e7050c1f9b2df9fdff1a6b2f3e0efb4a" "84b7a78774d25283a00ce4c7d612713c88a354ceb1c383e79d86470c236f4471" "faaed60676b3361da54d20b1f1a0f188afeff85286fd7733dc1bf959162a2f48" "d235ae983aff2c7e5ebdb25ef13871d7a0128d98fe0707ee981665bffc1feacc" "f0edf0fe52f20b855d18403b72e519246eff7966daf7b1f51d9cc21b13b4f5c9" "0aacd122e143392944e0cc61970f49818f843fbf3a9098bd566e775324954dad" "e27deaf9a347c2571ffc8871b3a8a5099a866c1b074f7c0c895b2cc717fc053b" "9e5efafa20267b1339d68a8eefd4340be60120231b2c16eeb1765ff8f3be34c3" "fd0dc567c49c1f7f141ed0655463f25aa44c2a131c7e47bb9873951d2f75d36b" "b83e67fac74491de6034ff7e447109d1032fb035b1e3bb9e146b3b7bc3f75961" "a76c6d0d43e5bf8624c79f499e6b91b62e52a3193978f3ac035fb34aadf78952" "5a312399c7603bf504779fba395631e06a97239601f80e1c632720d30da1292b" "1d90c20fd19ab6c0613745dced0b216736e2307d0cd9e1129c8e1fdddc2247c6" "df9ddd8b798d9f3eda04331f12a77c9034adb25c2d791ebbd66c89ea228cba96" "e036e4886c6c2d29fdb6af3e8a85b13d7ccc37628f951c4f03fb40257a7329cd" "a0ef57b0fe077a6bfbea23373ee5419c5632a94f13d5e8d69c0f9f419c0151ae" "0ea049b1a8aadc7560ae7e23068e3ff579ef1508be502dc2e9c0c0eaf6224b96" "efa048d8a9f9a8340a2f6382f3b8b8f4549cba38aa226803ff5b6a9b3a2d5f4b" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "3b819bba57a676edf6e4881bd38c777f96d1aa3b3b5bc21d8266fa5b0d0f1ebf" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "9d7844491c085559f53f741f4539e6e101691ff2f958f7eefe8c5010e0a39723" "a79a76afd58ba775553c82a2ffbe3b9b05d2718e1aac0594c1bbfb5b9c24003d" "e0e9d9f4495b98f9acacf43ea77df1826bef7fb2feaec32f7d449c7cd8c05a53" "025354235e98db5e7fd9c1a74622ff53ad31b7bde537d290ff68d85665213d85" "767c3539b11193191734367c70fba135408f7de351cd315c3a17ea837605770a" "2afe3283c2e4f81474174aa665aa4b43c8a39ba5686500155960facf83cd6edc" "6fe6ab4abe97a4f13533e47ae59fbba7f2919583f9162b440dd06707b01f7794" "3e82f5d4363ecd52f67615290ec602469d1aa4c5dc016608c2d36249ae42d8fc" "7bf10dc9d882eca8cb2893737831589c204fe8b8efbd2140ae39c52e2084afa8" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "ecc9eb9872c62536082498b8126c53ae821a2c7f7e2e120fccf8e4ed60b6187c" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(ediff-diff-options "--minimal")
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-pyvenv elpy-module-yasnippet elpy-module-sane-defaults)))
 '(elpy-rpc-backend "jedi")
 '(elpy-test-runner (quote elpy-test-nose-runner))
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(evil-want-fine-undo t)
 '(flycheck-highlighting-mode (quote lines))
 '(flycheck-idle-change-delay 1)
 '(flyspell-auto-correct-binding [67108922])
 '(foreground-color "#839496")
 '(gnus-logo-colors (quote ("#2fdbde" "#c0c0c0")) t)
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")) t)
 '(gtags-path-style (quote relative))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(indent-tabs-mode nil)
 '(jedi:install-imenu nil)
 '(jedi:server-args (quote ("--sys-path" "/ws/chopps-sjc/ws/xrut-ats/modules")))
 '(mac-command-key-is-meta nil)
 '(magit-use-overlays nil)
 '(make-backup-files nil)
 '(max-specpdl-size 5)
 '(ns-alternate-modifier (quote meta))
 '(ns-command-modifier (quote alt))
 '(org-agenda-files
   (quote
    ("~/org-mode/work.org" "/Users/chopps/org-mode/status.org" "/Users/chopps/org-mode/bills.org" "/Users/chopps/org-mode/detroit-tax.org" "/Users/chopps/org-mode/example.org" "/Users/chopps/org-mode/gifts.org" "/Users/chopps/org-mode/ietf.org" "/Users/chopps/org-mode/job.org" "/Users/chopps/org-mode/liem.org" "/Users/chopps/org-mode/lin.org" "/Users/chopps/org-mode/medical.org" "/Users/chopps/org-mode/notes.org" "/Users/chopps/org-mode/puppy.org" "/Users/chopps/org-mode/redbrick.org" "/Users/chopps/org-mode/routing-wg-chairs.org" "/Users/chopps/org-mode/scratch.org" "/Users/chopps/org-mode/temp.org" "/Users/chopps/org-mode/template.org" "/Users/chopps/org-mode/terastream.org" "/Users/chopps/org-mode/toi-sedy.org" "/Users/chopps/org-mode/zipcar.org")))
 '(org-protocol-default-template-key "t")
 '(org2blog/wp-shortcode-langs-map (quote (("emacs-lisp" . "lisp") ("sh" . "bash"))))
 '(org2blog/wp-use-sourcecode-shortcode t t)
 '(red "#ffffff")
 '(req-package-log-level (quote debug))
 '(safe-local-variable-values
   (quote
    ((org-latex-listings . t)
     (evil-shift-width . 2)
     (eval when
           (require
            (quote rainbow-mode)
            nil t)
           (rainbow-mode 1))
     (flycheck-gcc-include-path . "/usr/include/python3.4")
     (flycheck-clang-include-path . "/usr/include/python3.4")
     (flycheck-clang-include-path quote
                                  ("/usr/include/python3.4" "/usr/include/python2.7"))
     (flycheck-clang-include-path . "/usr/include/python")
     (eval progn
           (require
            (quote projectile))
           (puthash
            (projectile-project-root)
            "make test" projectile-test-cmd-map))
     (pymacs-auto-reload . t))))
 ;; '(scroll-step 1)
 '(show-trailing-whitespace t)
 '(ssh-program "ssh-login.sh")
 '(temporary-file-directory "/tmp/")
 '(vc-follow-symlinks t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 160 :width normal :foundry "nil" :family "SimSunShort"))))
 '(fixed-pitch ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 160 :width normal :foundry "nil" :family "SimSunShort"))))
 '(irfc-head-name-face ((t (:inherit org-level-1))))
 '(irfc-head-number-face ((t (:inherit org-level-1))))
 '(irfc-rfc-link-face ((t (:inherit org-link))))
 '(variable-pitch ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "nil" :family "DejaVu Sans")))))
