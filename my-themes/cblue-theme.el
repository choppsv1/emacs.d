;;; cblue-theme.el --- A low contrast color theme for Emacs.

;; Copyright (C) 2011-2014 Bozhidar Batsov

;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: http://github.com/bbatsov/cblue-emacs
;; Version: 20141112.923
;; X-Original-Version: 2.3-cvs

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; A port of the popular Vim theme Cblue for Emacs 24, built on top
;; of the new built-in theme support in Emacs 24.

;;; Credits:

;; Jani Nurminen created the original theme for vim on such this port
;; is based.

;;; Code:

(deftheme cblue "The Cblue color theme")

(defun d2x (r g b)
  (format "#%02X%02X%02X" r g b))
;;; Color Palette

(defvar cblue-colors-alist
  '(("cblue-fg+1"     . (d2x 216 237 255)) ; "#FFFFEF")
    ("cblue-fg"       . (d2x 194 227 255)) ; (d2x 220 220 204) "#DCDCCC")
    ("cblue-fg-05"    . (d2x 141 165 175)) ; (d2x 101 101 85)) "#656555")
    ("cblue-fg-1"     . (d2x 141 165 175)) ; (d2x 101 101 85)) "#656555")
    ("cblue-bg-2"     . "#000000")
    ("cblue-bg-1"     . "#2B2B2B")
    ("cblue-bg-05"    . "#383838")
    ("cblue-bg"       . (d2x 35 72 113)) ; (d2x 63 63 63)) ; "#3F3F3F")
    ("cblue-bg+05"    . (d2x 40 83 130))  ; (d2x 73 73 73)) "#494949")
    ("cblue-bg+1"     . (d2x 43 90 141))  ; (d2x 79 79 79)) "#4F4F4F")
    ("cblue-bg+2"     . (d2x 53 108 170)) ; (d2x 95 95 95)) "#5F5F5F")
    ("cblue-bg+3"     . (d2x 61 126 199)) ; (d2x 111 111 111)) "#6F6F6F")
    ("cblue-red+1"    . "#DCA3A3")
    ("cblue-red"      . "#CC9393")
    ("cblue-red-1"    . "#BC8383")
    ("cblue-red-2"    . "#AC7373")
    ("cblue-red-3"    . "#9C6363")
    ("cblue-red-4"    . "#8C5353")
    ("cblue-orange"   . "#DFAF8F")
    ("cblue-yellow"   . "#F0DFAF")
    ("cblue-yellow-1" . "#E0CF9F")
    ("cblue-yellow-2" . "#D0BF8F")
    ("cblue-green-1"  . "#5F7F5F")
    ("cblue-green"    . "#7F9F7F")
    ("cblue-green+1"  . "#8FB28F")
    ("cblue-green+2"  . "#9FC59F")
    ("cblue-green+3"  . "#AFD8AF")
    ("cblue-green+4"  . "#BFEBBF")
    ("cblue-cyan"     . "#93E0E3")
    ("cblue-blue+1"   . "#94BFF3")
    ("cblue-blue"     . "#8CD0D3")
    ("cblue-blue-1"   . "#7CB8BB")
    ("cblue-blue-2"   . "#6CA0A3")
    ("cblue-blue-3"   . "#5C888B")
    ("cblue-blue-4"   . "#4C7073")
    ("cblue-blue-5"   . "#366060")
    ("cblue-magenta"  . "#DC8CC3"))
  "List of Cblue colors.
Each element has the form (NAME . HEX).

`+N' suffixes indicate a color is lighter.
`-N' suffixes indicate a color is darker.")

(defmacro cblue-with-color-variables (&rest body)
  "`let' bind all colors defined in `cblue-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   cblue-colors-alist))
     ,@body))

;;; Theme Faces
(cblue-with-color-variables
  (custom-theme-set-faces
   'cblue
;;;; Built-in
;;;;; basic coloring
   '(button ((t (:underline t))))
   `(link ((t (:foreground ,cblue-yellow :underline t :weight bold))))
   `(link-visited ((t (:foreground ,cblue-yellow-2 :underline t :weight normal))))
   `(default ((t (:foreground ,cblue-fg :background ,cblue-bg))))
   `(cursor ((t (:foreground ,cblue-fg :background ,cblue-fg+1))))
   `(escape-glyph ((t (:foreground ,cblue-yellow :bold t))))
   `(fringe ((t (:foreground ,cblue-fg :background ,cblue-bg+1))))
   `(header-line ((t (:foreground ,cblue-yellow
                                  :background ,cblue-bg-1
                                  :box (:line-width -1 :style released-button)))))
   `(highlight ((t (:background ,cblue-bg-05))))
   `(success ((t (:foreground ,cblue-green :weight bold))))
   `(warning ((t (:foreground ,cblue-orange :weight bold))))
;;;;; compilation
   `(compilation-column-face ((t (:foreground ,cblue-yellow))))
   `(compilation-enter-directory-face ((t (:foreground ,cblue-green))))
   `(compilation-error-face ((t (:foreground ,cblue-red-1 :weight bold :underline t))))
   `(compilation-face ((t (:foreground ,cblue-fg))))
   `(compilation-info-face ((t (:foreground ,cblue-blue))))
   `(compilation-info ((t (:foreground ,cblue-green+4 :underline t))))
   `(compilation-leave-directory-face ((t (:foreground ,cblue-green))))
   `(compilation-line-face ((t (:foreground ,cblue-yellow))))
   `(compilation-line-number ((t (:foreground ,cblue-yellow))))
   `(compilation-message-face ((t (:foreground ,cblue-blue))))
   `(compilation-warning-face ((t (:foreground ,cblue-orange :weight bold :underline t))))
   `(compilation-mode-line-exit ((t (:foreground ,cblue-green+2 :weight bold))))
   `(compilation-mode-line-fail ((t (:foreground ,cblue-red :weight bold))))
   `(compilation-mode-line-run ((t (:foreground ,cblue-yellow :weight bold))))
;;;;; grep
   `(grep-context-face ((t (:foreground ,cblue-fg))))
   `(grep-error-face ((t (:foreground ,cblue-red-1 :weight bold :underline t))))
   `(grep-hit-face ((t (:foreground ,cblue-blue))))
   `(grep-match-face ((t (:foreground ,cblue-orange :weight bold))))
   `(match ((t (:background ,cblue-bg-1 :foreground ,cblue-orange :weight bold))))
;;;;; isearch
   `(isearch ((t (:foreground ,cblue-yellow-2 :weight bold :background ,cblue-bg+2))))
   `(isearch-fail ((t (:foreground ,cblue-fg :background ,cblue-red-4))))
   `(lazy-highlight ((t (:foreground ,cblue-yellow-2 :weight bold :background ,cblue-bg-05))))

   `(menu ((t (:foreground ,cblue-fg :background ,cblue-bg))))
   `(minibuffer-prompt ((t (:foreground ,cblue-yellow))))
   `(mode-line
     ((,class (:foreground ,cblue-green+1
                           :background ,cblue-bg-1
                           :box (:line-width -1 :style released-button)))
      (t :inverse-video t)))
   `(mode-line-buffer-id ((t (:foreground ,cblue-yellow :weight bold))))
   `(mode-line-inactive
     ((t (:foreground ,cblue-green-1
                      :background ,cblue-bg-05
                      :box (:line-width -1 :style released-button)))))
   `(region ((,class (:background ,cblue-bg-1))
             (t :inverse-video t)))
   `(secondary-selection ((t (:background ,cblue-bg+2))))
   `(trailing-whitespace ((t (:background ,cblue-red))))
   `(vertical-border ((t (:foreground ,cblue-fg))))
;;;;; font lock
   `(font-lock-builtin-face ((t (:foreground ,cblue-fg :weight bold))))
   `(font-lock-comment-face ((t (:foreground ,cblue-fg-1 :slant italic))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,cblue-fg-1 :slant italic))))
   `(font-lock-constant-face ((t (:foreground ,cblue-green+4))))
   `(font-lock-doc-face ((t (:foreground ,cblue-green+2))))
   `(font-lock-function-name-face ((t (:foreground ,cblue-cyan))))
   ; `(font-lock-keyword-face ((t (:foreground ,cblue-yellow :weight bold))))
   `(font-lock-keyword-face ((t (:foreground ,cblue-fg+1 :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,cblue-yellow :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,cblue-blue+1))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,cblue-yellow :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,cblue-green :weight bold))))
   `(font-lock-string-face ((t (:foreground ,cblue-red))))
   `(font-lock-type-face ((t (:foreground ,cblue-blue-1))))
   `(font-lock-variable-name-face ((t (:foreground ,cblue-orange))))
   `(font-lock-warning-face ((t (:foreground ,cblue-yellow-2 :weight bold))))

   `(c-annotation-face ((t (:inherit font-lock-constant-face))))
;;;;; newsticker
   `(newsticker-date-face ((t (:foreground ,cblue-fg))))
   `(newsticker-default-face ((t (:foreground ,cblue-fg))))
   `(newsticker-enclosure-face ((t (:foreground ,cblue-green+3))))
   `(newsticker-extra-face ((t (:foreground ,cblue-bg+2 :height 0.8))))
   `(newsticker-feed-face ((t (:foreground ,cblue-fg))))
   `(newsticker-immortal-item-face ((t (:foreground ,cblue-green))))
   `(newsticker-new-item-face ((t (:foreground ,cblue-blue))))
   `(newsticker-obsolete-item-face ((t (:foreground ,cblue-red))))
   `(newsticker-old-item-face ((t (:foreground ,cblue-bg+3))))
   `(newsticker-statistics-face ((t (:foreground ,cblue-fg))))
   `(newsticker-treeview-face ((t (:foreground ,cblue-fg))))
   `(newsticker-treeview-immortal-face ((t (:foreground ,cblue-green))))
   `(newsticker-treeview-listwindow-face ((t (:foreground ,cblue-fg))))
   `(newsticker-treeview-new-face ((t (:foreground ,cblue-blue :weight bold))))
   `(newsticker-treeview-obsolete-face ((t (:foreground ,cblue-red))))
   `(newsticker-treeview-old-face ((t (:foreground ,cblue-bg+3))))
   `(newsticker-treeview-selection-face ((t (:background ,cblue-bg-1 :foreground ,cblue-yellow))))
;;;; Third-party
;;;;; ace-jump
   `(ace-jump-face-background
     ((t (:foreground ,cblue-fg-1 :background ,cblue-bg :inverse-video nil))))
   `(ace-jump-face-foreground
     ((t (:foreground ,cblue-green+2 :background ,cblue-bg :inverse-video nil))))
;;;;; android mode
   `(android-mode-debug-face ((t (:foreground ,cblue-green+1))))
   `(android-mode-error-face ((t (:foreground ,cblue-orange :weight bold))))
   `(android-mode-info-face ((t (:foreground ,cblue-fg))))
   `(android-mode-verbose-face ((t (:foreground ,cblue-green))))
   `(android-mode-warning-face ((t (:foreground ,cblue-yellow))))
;;;;; anzu
   `(anzu-mode-line ((t (:foreground ,cblue-cyan :weight bold))))
;;;;; auctex
   `(font-latex-bold-face ((t (:inherit bold))))
   `(font-latex-warning-face ((t (:foreground nil :inherit font-lock-warning-face))))
   `(font-latex-sectioning-5-face ((t (:foreground ,cblue-red :weight bold ))))
   `(font-latex-sedate-face ((t (:foreground ,cblue-yellow))))
   `(font-latex-italic-face ((t (:foreground ,cblue-cyan :slant italic))))
   `(font-latex-string-face ((t (:inherit ,font-lock-string-face))))
   `(font-latex-math-face ((t (:foreground ,cblue-orange))))
;;;;; auto-complete
   `(ac-candidate-face ((t (:background ,cblue-bg+3 :foreground ,cblue-bg-2))))
   `(ac-selection-face ((t (:background ,cblue-blue-4 :foreground ,cblue-fg))))
   `(popup-tip-face ((t (:background ,cblue-yellow-2 :foreground ,cblue-bg-2))))
   `(popup-scroll-bar-foreground-face ((t (:background ,cblue-blue-5))))
   `(popup-scroll-bar-background-face ((t (:background ,cblue-bg-1))))
   `(popup-isearch-match ((t (:background ,cblue-bg :foreground ,cblue-fg))))
;;;;; company-mode
   `(company-tooltip ((t (:foreground ,cblue-fg :background ,cblue-bg+1))))
   `(company-tooltip-selection ((t (:foreground ,cblue-fg :background ,cblue-bg-1))))
   `(company-tooltip-mouse ((t (:background ,cblue-bg-1))))
   `(company-tooltip-common ((t (:foreground ,cblue-green+2))))
   `(company-tooltip-common-selection ((t (:foreground ,cblue-green+2))))
   `(company-scrollbar-fg ((t (:background ,cblue-bg-1))))
   `(company-scrollbar-bg ((t (:background ,cblue-bg+2))))
   `(company-preview ((t (:background ,cblue-green+2))))
   `(company-preview-common ((t (:foreground ,cblue-green+2 :background ,cblue-bg-1))))
;;;;; bm
   `(bm-face ((t (:background ,cblue-yellow-1 :foreground ,cblue-bg))))
   `(bm-fringe-face ((t (:background ,cblue-yellow-1 :foreground ,cblue-bg))))
   `(bm-fringe-persistent-face ((t (:background ,cblue-green-1 :foreground ,cblue-bg))))
   `(bm-persistent-face ((t (:background ,cblue-green-1 :foreground ,cblue-bg))))
;;;;; clojure-test-mode
   `(clojure-test-failure-face ((t (:foreground ,cblue-orange :weight bold :underline t))))
   `(clojure-test-error-face ((t (:foreground ,cblue-red :weight bold :underline t))))
   `(clojure-test-success-face ((t (:foreground ,cblue-green+1 :weight bold :underline t))))
;;;;; coq
   `(coq-solve-tactics-face ((t (:foreground nil :inherit font-lock-constant-face))))
;;;;; ctable
   `(ctbl:face-cell-select ((t (:background ,cblue-blue :foreground ,cblue-bg))))
   `(ctbl:face-continue-bar ((t (:background ,cblue-bg-05 :foreground ,cblue-bg))))
   `(ctbl:face-row-select ((t (:background ,cblue-cyan :foreground ,cblue-bg))))
;;;;; diff
   `(diff-added ((,class (:foreground ,cblue-green+4 :background nil))
                 (t (:foreground ,cblue-green-1 :background nil))))
   `(diff-changed ((t (:foreground ,cblue-yellow))))
   `(diff-removed ((,class (:foreground ,cblue-red :background nil))
                   (t (:foreground ,cblue-red-3 :background nil))))
   `(diff-refine-added ((t (:inherit diff-added :weight bold))))
   `(diff-refine-change ((t (:inherit diff-changed :weight bold))))
   `(diff-refine-removed ((t (:inherit diff-removed :weight bold))))
   `(diff-header ((,class (:background ,cblue-bg+2))
                  (t (:background ,cblue-fg :foreground ,cblue-bg))))
   `(diff-file-header
     ((,class (:background ,cblue-bg+2 :foreground ,cblue-fg :bold t))
      (t (:background ,cblue-fg :foreground ,cblue-bg :bold t))))
;;;;; diff-hl
   `(diff-hl-change ((,class (:foreground ,cblue-blue-2 :background ,cblue-bg-05))))
   `(diff-hl-delete ((,class (:foreground ,cblue-red+1 :background ,cblue-bg-05))))
   `(diff-hl-insert ((,class (:foreground ,cblue-green+1 :background ,cblue-bg-05))))
   `(diff-hl-unknown ((,class (:foreground ,cblue-yellow :background ,cblue-bg-05))))
;;;;; dim-autoload
   `(dim-autoload-cookie-line ((t :foreground ,cblue-bg+1)))
;;;;; dired+
   `(diredp-display-msg ((t (:foreground ,cblue-blue))))
   `(diredp-compressed-file-suffix ((t (:foreground ,cblue-orange))))
   `(diredp-date-time ((t (:foreground ,cblue-magenta))))
   `(diredp-deletion ((t (:foreground ,cblue-yellow))))
   `(diredp-deletion-file-name ((t (:foreground ,cblue-red))))
   `(diredp-dir-heading ((t (:foreground ,cblue-blue :background ,cblue-bg-1))))
   `(diredp-dir-priv ((t (:foreground ,cblue-cyan))))
   `(diredp-exec-priv ((t (:foreground ,cblue-red))))
   `(diredp-executable-tag ((t (:foreground ,cblue-green+1))))
   `(diredp-file-name ((t (:foreground ,cblue-blue))))
   `(diredp-file-suffix ((t (:foreground ,cblue-green))))
   `(diredp-flag-mark ((t (:foreground ,cblue-yellow))))
   `(diredp-flag-mark-line ((t (:foreground ,cblue-orange))))
   `(diredp-ignored-file-name ((t (:foreground ,cblue-red))))
   `(diredp-link-priv ((t (:foreground ,cblue-yellow))))
   `(diredp-mode-line-flagged ((t (:foreground ,cblue-yellow))))
   `(diredp-mode-line-marked ((t (:foreground ,cblue-orange))))
   `(diredp-no-priv ((t (:foreground ,cblue-fg))))
   `(diredp-number ((t (:foreground ,cblue-green+1))))
   `(diredp-other-priv ((t (:foreground ,cblue-yellow-1))))
   `(diredp-rare-priv ((t (:foreground ,cblue-red-1))))
   `(diredp-read-priv ((t (:foreground ,cblue-green-1))))
   `(diredp-symlink ((t (:foreground ,cblue-yellow))))
   `(diredp-write-priv ((t (:foreground ,cblue-magenta))))
;;;;; ediff
   `(ediff-current-diff-A ((t (:foreground ,cblue-fg :background ,cblue-red-4))))
   `(ediff-current-diff-Ancestor ((t (:foreground ,cblue-fg :background ,cblue-red-4))))
   `(ediff-current-diff-B ((t (:foreground ,cblue-fg :background ,cblue-green-1))))
   `(ediff-current-diff-C ((t (:foreground ,cblue-fg :background ,cblue-blue-5))))
   `(ediff-even-diff-A ((t (:background ,cblue-bg+1))))
   `(ediff-even-diff-Ancestor ((t (:background ,cblue-bg+1))))
   `(ediff-even-diff-B ((t (:background ,cblue-bg+1))))
   `(ediff-even-diff-C ((t (:background ,cblue-bg+1))))
   `(ediff-fine-diff-A ((t (:foreground ,cblue-fg :background ,cblue-red-2 :weight bold))))
   `(ediff-fine-diff-Ancestor ((t (:foreground ,cblue-fg :background ,cblue-red-2 weight bold))))
   `(ediff-fine-diff-B ((t (:foreground ,cblue-fg :background ,cblue-green :weight bold))))
   `(ediff-fine-diff-C ((t (:foreground ,cblue-fg :background ,cblue-blue-3 :weight bold ))))
   `(ediff-odd-diff-A ((t (:background ,cblue-bg+2))))
   `(ediff-odd-diff-Ancestor ((t (:background ,cblue-bg+2))))
   `(ediff-odd-diff-B ((t (:background ,cblue-bg+2))))
   `(ediff-odd-diff-C ((t (:background ,cblue-bg+2))))
;;;;; egg
   `(egg-text-base ((t (:foreground ,cblue-fg))))
   `(egg-help-header-1 ((t (:foreground ,cblue-yellow))))
   `(egg-help-header-2 ((t (:foreground ,cblue-green+3))))
   `(egg-branch ((t (:foreground ,cblue-yellow))))
   `(egg-branch-mono ((t (:foreground ,cblue-yellow))))
   `(egg-term ((t (:foreground ,cblue-yellow))))
   `(egg-diff-add ((t (:foreground ,cblue-green+4))))
   `(egg-diff-del ((t (:foreground ,cblue-red+1))))
   `(egg-diff-file-header ((t (:foreground ,cblue-yellow-2))))
   `(egg-section-title ((t (:foreground ,cblue-yellow))))
   `(egg-stash-mono ((t (:foreground ,cblue-green+4))))
;;;;; elfeed
   `(elfeed-search-date-face ((t (:foreground ,cblue-yellow-1 :underline t
                                              :weight bold))))
   `(elfeed-search-tag-face ((t (:foreground ,cblue-green))))
   `(elfeed-search-feed-face ((t (:foreground ,cblue-cyan))))
;;;;; emacs-w3m
   `(w3m-anchor ((t (:foreground ,cblue-yellow :underline t
                                 :weight bold))))
   `(w3m-arrived-anchor ((t (:foreground ,cblue-yellow-2
                                         :underline t :weight normal))))
   `(w3m-form ((t (:foreground ,cblue-red-1 :underline t))))
   `(w3m-header-line-location-title ((t (:foreground ,cblue-yellow
                                                     :underline t :weight bold))))
   '(w3m-history-current-url ((t (:inherit match))))
   `(w3m-lnum ((t (:foreground ,cblue-green+2 :background ,cblue-bg))))
   `(w3m-lnum-match ((t (:background ,cblue-bg-1
                                     :foreground ,cblue-orange
                                     :weight bold))))
   `(w3m-lnum-minibuffer-prompt ((t (:foreground ,cblue-yellow))))
;;;;; erc
   `(erc-action-face ((t (:inherit erc-default-face))))
   `(erc-bold-face ((t (:weight bold))))
   `(erc-current-nick-face ((t (:foreground ,cblue-blue :weight bold))))
   `(erc-dangerous-host-face ((t (:inherit font-lock-warning-face))))
   `(erc-default-face ((t (:foreground ,cblue-fg))))
   `(erc-direct-msg-face ((t (:inherit erc-default))))
   `(erc-error-face ((t (:inherit font-lock-warning-face))))
   `(erc-fool-face ((t (:inherit erc-default))))
   `(erc-highlight-face ((t (:inherit hover-highlight))))
   `(erc-input-face ((t (:foreground ,cblue-yellow))))
   `(erc-keyword-face ((t (:foreground ,cblue-blue :weight bold))))
   `(erc-nick-default-face ((t (:foreground ,cblue-yellow :weight bold))))
   `(erc-my-nick-face ((t (:foreground ,cblue-red :weight bold))))
   `(erc-nick-msg-face ((t (:inherit erc-default))))
   `(erc-notice-face ((t (:foreground ,cblue-green))))
   `(erc-pal-face ((t (:foreground ,cblue-orange :weight bold))))
   `(erc-prompt-face ((t (:foreground ,cblue-orange :background ,cblue-bg :weight bold))))
   `(erc-timestamp-face ((t (:foreground ,cblue-green+4))))
   `(erc-underline-face ((t (:underline t))))
;;;;; ert
   `(ert-test-result-expected ((t (:foreground ,cblue-green+4 :background ,cblue-bg))))
   `(ert-test-result-unexpected ((t (:foreground ,cblue-red :background ,cblue-bg))))
;;;;; eshell
   `(eshell-prompt ((t (:foreground ,cblue-yellow :weight bold))))
   `(eshell-ls-archive ((t (:foreground ,cblue-red-1 :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-clutter ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-directory ((t (:foreground ,cblue-blue+1 :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,cblue-red+1 :weight bold))))
   `(eshell-ls-unreadable ((t (:foreground ,cblue-fg))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((t (:foreground ,cblue-yellow :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,cblue-cyan :weight bold))))
;;;;; flx
   `(flx-highlight-face ((t (:foreground ,cblue-green+2 :weight bold))))
;;;;; flycheck
   `(flycheck-error
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,cblue-red-1) :inherit unspecified))
      (t (:foreground ,cblue-red-1 :weight bold :underline t))))
   `(flycheck-warning
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,cblue-yellow) :inherit unspecified))
      (t (:foreground ,cblue-yellow :weight bold :underline t))))
   `(flycheck-info
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,cblue-cyan) :inherit unspecified))
      (t (:foreground ,cblue-cyan :weight bold :underline t))))
   `(flycheck-fringe-error ((t (:foreground ,cblue-red-1 :weight bold))))
   `(flycheck-fringe-warning ((t (:foreground ,cblue-yellow :weight bold))))
   `(flycheck-fringe-info ((t (:foreground ,cblue-cyan :weight bold))))
;;;;; flymake
   `(flymake-errline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,cblue-red)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,cblue-red-1 :weight bold :underline t))))
   `(flymake-warnline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,cblue-orange)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,cblue-orange :weight bold :underline t))))
   `(flymake-infoline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,cblue-green)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,cblue-green-1 :weight bold :underline t))))
;;;;; flyspell
   `(flyspell-duplicate
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,cblue-orange) :inherit unspecified))
      (t (:foreground ,cblue-orange :weight bold :underline t))))
   `(flyspell-incorrect
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,cblue-red) :inherit unspecified))
      (t (:foreground ,cblue-red-1 :weight bold :underline t))))
;;;;; full-ack
   `(ack-separator ((t (:foreground ,cblue-fg))))
   `(ack-file ((t (:foreground ,cblue-blue))))
   `(ack-line ((t (:foreground ,cblue-yellow))))
   `(ack-match ((t (:foreground ,cblue-orange :background ,cblue-bg-1 :weight bold))))
;;;;; git-gutter
   `(git-gutter:added ((t (:foreground ,cblue-green :weight bold :inverse-video t))))
   `(git-gutter:deleted ((t (:foreground ,cblue-red :weight bold :inverse-video t))))
   `(git-gutter:modified ((t (:foreground ,cblue-magenta :weight bold :inverse-video t))))
   `(git-gutter:unchanged ((t (:foreground ,cblue-fg :weight bold :inverse-video t))))
;;;;; git-gutter-fr
   `(git-gutter-fr:added ((t (:foreground ,cblue-green  :weight bold))))
   `(git-gutter-fr:deleted ((t (:foreground ,cblue-red :weight bold))))
   `(git-gutter-fr:modified ((t (:foreground ,cblue-magenta :weight bold))))
;;;;; git-rebase-mode
   `(git-rebase-hash ((t (:foreground, cblue-orange))))
;;;;; gnus
   `(gnus-group-mail-1 ((t (:bold t :inherit gnus-group-mail-1-empty))))
   `(gnus-group-mail-1-empty ((t (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2 ((t (:bold t :inherit gnus-group-mail-2-empty))))
   `(gnus-group-mail-2-empty ((t (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3 ((t (:bold t :inherit gnus-group-mail-3-empty))))
   `(gnus-group-mail-3-empty ((t (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-4 ((t (:bold t :inherit gnus-group-mail-4-empty))))
   `(gnus-group-mail-4-empty ((t (:inherit gnus-group-news-4-empty))))
   `(gnus-group-mail-5 ((t (:bold t :inherit gnus-group-mail-5-empty))))
   `(gnus-group-mail-5-empty ((t (:inherit gnus-group-news-5-empty))))
   `(gnus-group-mail-6 ((t (:bold t :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty ((t (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low ((t (:bold t :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty ((t (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news-1 ((t (:bold t :inherit gnus-group-news-1-empty))))
   `(gnus-group-news-2 ((t (:bold t :inherit gnus-group-news-2-empty))))
   `(gnus-group-news-3 ((t (:bold t :inherit gnus-group-news-3-empty))))
   `(gnus-group-news-4 ((t (:bold t :inherit gnus-group-news-4-empty))))
   `(gnus-group-news-5 ((t (:bold t :inherit gnus-group-news-5-empty))))
   `(gnus-group-news-6 ((t (:bold t :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low ((t (:bold t :inherit gnus-group-news-low-empty))))
   `(gnus-header-content ((t (:inherit message-header-other))))
   `(gnus-header-from ((t (:inherit message-header-from))))
   `(gnus-header-name ((t (:inherit message-header-name))))
   `(gnus-header-newsgroups ((t (:inherit message-header-other))))
   `(gnus-header-subject ((t (:inherit message-header-subject))))
   `(gnus-summary-cancelled ((t (:foreground ,cblue-orange))))
   `(gnus-summary-high-ancient ((t (:foreground ,cblue-blue))))
   `(gnus-summary-high-read ((t (:foreground ,cblue-green :weight bold))))
   `(gnus-summary-high-ticked ((t (:foreground ,cblue-orange :weight bold))))
   `(gnus-summary-high-unread ((t (:foreground ,cblue-fg :weight bold))))
   `(gnus-summary-low-ancient ((t (:foreground ,cblue-blue))))
   `(gnus-summary-low-read ((t (:foreground ,cblue-green))))
   `(gnus-summary-low-ticked ((t (:foreground ,cblue-orange :weight bold))))
   `(gnus-summary-low-unread ((t (:foreground ,cblue-fg))))
   `(gnus-summary-normal-ancient ((t (:foreground ,cblue-blue))))
   `(gnus-summary-normal-read ((t (:foreground ,cblue-green))))
   `(gnus-summary-normal-ticked ((t (:foreground ,cblue-orange :weight bold))))
   `(gnus-summary-normal-unread ((t (:foreground ,cblue-fg))))
   `(gnus-summary-selected ((t (:foreground ,cblue-yellow :weight bold))))
   `(gnus-cite-1 ((t (:foreground ,cblue-blue))))
   `(gnus-cite-10 ((t (:foreground ,cblue-yellow-1))))
   `(gnus-cite-11 ((t (:foreground ,cblue-yellow))))
   `(gnus-cite-2 ((t (:foreground ,cblue-blue-1))))
   `(gnus-cite-3 ((t (:foreground ,cblue-blue-2))))
   `(gnus-cite-4 ((t (:foreground ,cblue-green+2))))
   `(gnus-cite-5 ((t (:foreground ,cblue-green+1))))
   `(gnus-cite-6 ((t (:foreground ,cblue-green))))
   `(gnus-cite-7 ((t (:foreground ,cblue-red))))
   `(gnus-cite-8 ((t (:foreground ,cblue-red-1))))
   `(gnus-cite-9 ((t (:foreground ,cblue-red-2))))
   `(gnus-group-news-1-empty ((t (:foreground ,cblue-yellow))))
   `(gnus-group-news-2-empty ((t (:foreground ,cblue-green+3))))
   `(gnus-group-news-3-empty ((t (:foreground ,cblue-green+1))))
   `(gnus-group-news-4-empty ((t (:foreground ,cblue-blue-2))))
   `(gnus-group-news-5-empty ((t (:foreground ,cblue-blue-3))))
   `(gnus-group-news-6-empty ((t (:foreground ,cblue-bg+2))))
   `(gnus-group-news-low-empty ((t (:foreground ,cblue-bg+2))))
   `(gnus-signature ((t (:foreground ,cblue-yellow))))
   `(gnus-x ((t (:background ,cblue-fg :foreground ,cblue-bg))))
;;;;; guide-key
   `(guide-key/highlight-command-face ((t (:foreground ,cblue-blue))))
   `(guide-key/key-face ((t (:foreground ,cblue-green))))
   `(guide-key/prefix-command-face ((t (:foreground ,cblue-green+1))))
;;;;; helm
   `(helm-header
     ((t (:foreground ,cblue-green
                      :background ,cblue-bg
                      :underline nil
                      :box nil))))
   `(helm-source-header
     ((t (:foreground ,cblue-yellow
                      :background ,cblue-bg-1
                      :underline nil
                      :weight bold
                      :box (:line-width -1 :style released-button)))))
   `(helm-selection ((t (:background ,cblue-bg+1 :underline nil))))
   `(helm-selection-line ((t (:background ,cblue-bg+1))))
   `(helm-visible-mark ((t (:foreground ,cblue-bg :background ,cblue-yellow-2))))
   `(helm-candidate-number ((t (:foreground ,cblue-green+4 :background ,cblue-bg-1))))
   `(helm-separator ((t (:foreground ,cblue-red :background ,cblue-bg))))
   `(helm-time-zone-current ((t (:foreground ,cblue-green+2 :background ,cblue-bg))))
   `(helm-time-zone-home ((t (:foreground ,cblue-red :background ,cblue-bg))))
   `(helm-bookmark-addressbook ((t (:foreground ,cblue-orange :background ,cblue-bg))))
   `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
   `(helm-bookmark-gnus ((t (:foreground ,cblue-magenta :background ,cblue-bg))))
   `(helm-bookmark-info ((t (:foreground ,cblue-green+2 :background ,cblue-bg))))
   `(helm-bookmark-man ((t (:foreground ,cblue-yellow :background ,cblue-bg))))
   `(helm-bookmark-w3m ((t (:foreground ,cblue-magenta :background ,cblue-bg))))
   `(helm-buffer-not-saved ((t (:foreground ,cblue-red :background ,cblue-bg))))
   `(helm-buffer-process ((t (:foreground ,cblue-cyan :background ,cblue-bg))))
   `(helm-buffer-saved-out ((t (:foreground ,cblue-fg :background ,cblue-bg))))
   `(helm-buffer-size ((t (:foreground ,cblue-fg-1 :background ,cblue-bg))))
   `(helm-ff-directory ((t (:foreground ,cblue-cyan :background ,cblue-bg :weight bold))))
   `(helm-ff-file ((t (:foreground ,cblue-fg :background ,cblue-bg :weight normal))))
   `(helm-ff-executable ((t (:foreground ,cblue-green+2 :background ,cblue-bg :weight normal))))
   `(helm-ff-invalid-symlink ((t (:foreground ,cblue-red :background ,cblue-bg :weight bold))))
   `(helm-ff-symlink ((t (:foreground ,cblue-yellow :background ,cblue-bg :weight bold))))
   `(helm-ff-prefix ((t (:foreground ,cblue-bg :background ,cblue-yellow :weight normal))))
   `(helm-grep-cmd-line ((t (:foreground ,cblue-cyan :background ,cblue-bg))))
   `(helm-grep-file ((t (:foreground ,cblue-fg :background ,cblue-bg))))
   `(helm-grep-finish ((t (:foreground ,cblue-green+2 :background ,cblue-bg))))
   `(helm-grep-lineno ((t (:foreground ,cblue-fg-1 :background ,cblue-bg))))
   `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running ((t (:foreground ,cblue-red :background ,cblue-bg))))
   `(helm-moccur-buffer ((t (:foreground ,cblue-cyan :background ,cblue-bg))))
   `(helm-mu-contacts-address-face ((t (:foreground ,cblue-fg-1 :background ,cblue-bg))))
   `(helm-mu-contacts-name-face ((t (:foreground ,cblue-fg :background ,cblue-bg))))
;;;;; hl-line-mode
   `(hl-line-face ((,class (:background ,cblue-bg-05))
                   (t :weight bold)))
   `(hl-line ((,class (:background ,cblue-bg-05)) ; old emacsen
              (t :weight bold)))
;;;;; hl-sexp
   `(hl-sexp-face ((,class (:background ,cblue-bg+1))
                   (t :weight bold)))
;;;;; ido-mode
   `(ido-first-match ((t (:foreground ,cblue-yellow :weight bold))))
   `(ido-only-match ((t (:foreground ,cblue-orange :weight bold))))
   `(ido-subdir ((t (:foreground ,cblue-yellow))))
   `(ido-indicator ((t (:foreground ,cblue-yellow :background ,cblue-red-4))))
;;;;; iedit-mode
   `(iedit-occurrence ((t (:background ,cblue-bg+2 :weight bold))))
;;;;; jabber-mode
   `(jabber-roster-user-away ((t (:foreground ,cblue-green+2))))
   `(jabber-roster-user-online ((t (:foreground ,cblue-blue-1))))
   `(jabber-roster-user-dnd ((t (:foreground ,cblue-red+1))))
   `(jabber-rare-time-face ((t (:foreground ,cblue-green+1))))
   `(jabber-chat-prompt-local ((t (:foreground ,cblue-blue-1))))
   `(jabber-chat-prompt-foreign ((t (:foreground ,cblue-red+1))))
   `(jabber-activity-face((t (:foreground ,cblue-red+1))))
   `(jabber-activity-personal-face ((t (:foreground ,cblue-blue+1))))
   `(jabber-title-small ((t (:height 1.1 :weight bold))))
   `(jabber-title-medium ((t (:height 1.2 :weight bold))))
   `(jabber-title-large ((t (:height 1.3 :weight bold))))
;;;;; js2-mode
   `(js2-warning ((t (:underline ,cblue-orange))))
   `(js2-error ((t (:foreground ,cblue-red :weight bold))))
   `(js2-jsdoc-tag ((t (:foreground ,cblue-green-1))))
   `(js2-jsdoc-type ((t (:foreground ,cblue-green+2))))
   `(js2-jsdoc-value ((t (:foreground ,cblue-green+3))))
   `(js2-function-param ((t (:foreground, cblue-green+3))))
   `(js2-external-variable ((t (:foreground ,cblue-orange))))
;;;;; ledger-mode
   `(ledger-font-payee-uncleared-face ((t (:foreground ,cblue-red-1 :weight bold))))
   `(ledger-font-payee-cleared-face ((t (:foreground ,cblue-fg :weight normal))))
   `(ledger-font-xact-highlight-face ((t (:background ,cblue-bg+1))))
   `(ledger-font-pending-face ((t (:foreground ,cblue-orange weight: normal))))
   `(ledger-font-other-face ((t (:foreground ,cblue-fg))))
   `(ledger-font-posting-account-face ((t (:foreground ,cblue-blue-1))))
   `(ledger-font-posting-account-cleared-face ((t (:foreground ,cblue-fg))))
   `(ledger-font-posting-account-pending-face ((t (:foreground ,cblue-orange))))
   `(ledger-font-posting-amount-face ((t (:foreground ,cblue-orange))))
   `(ledger-font-posting-account-pending-face ((t (:foreground ,cblue-orange))))
   `(ledger-occur-narrowed-face ((t (:foreground ,cblue-fg-1 :invisible t))))
   `(ledger-occur-xact-face ((t (:background ,cblue-bg+1))))
   `(ledger-font-comment-face ((t (:foreground ,cblue-green))))
   `(ledger-font-reconciler-uncleared-face ((t (:foreground ,cblue-red-1 :weight bold))))
   `(ledger-font-reconciler-cleared-face ((t (:foreground ,cblue-fg :weight normal))))
   `(ledger-font-reconciler-pending-face ((t (:foreground ,cblue-orange :weight normal))))
   `(ledger-font-report-clickable-face ((t (:foreground ,cblue-orange :weight normal))))
;;;;; linum-mode
   `(linum ((t (:foreground ,cblue-green+2 :background ,cblue-bg))))
;;;;; macrostep
   `(macrostep-gensym-1
     ((t (:foreground ,cblue-green+2 :background ,cblue-bg-1))))
   `(macrostep-gensym-2
     ((t (:foreground ,cblue-red+1 :background ,cblue-bg-1))))
   `(macrostep-gensym-3
     ((t (:foreground ,cblue-blue+1 :background ,cblue-bg-1))))
   `(macrostep-gensym-4
     ((t (:foreground ,cblue-magenta :background ,cblue-bg-1))))
   `(macrostep-gensym-5
     ((t (:foreground ,cblue-yellow :background ,cblue-bg-1))))
   `(macrostep-expansion-highlight-face
     ((t (:inherit highlight))))
   `(macrostep-macro-face
     ((t (:underline t))))
;;;;; magit
   `(magit-item-highlight ((t (:background ,cblue-bg+05))))
   `(magit-section-title ((t (:foreground ,cblue-yellow :weight bold))))
   `(magit-process-ok ((t (:foreground ,cblue-green :weight bold))))
   `(magit-process-ng ((t (:foreground ,cblue-red :weight bold))))
   `(magit-branch ((t (:foreground ,cblue-blue :weight bold))))
   `(magit-log-author ((t (:foreground ,cblue-orange))))
   `(magit-log-sha1 ((t (:foreground, cblue-orange))))
;;;;; message-mode
   `(message-cited-text ((t (:inherit font-lock-comment-face))))
   `(message-header-name ((t (:foreground ,cblue-green+1))))
   `(message-header-other ((t (:foreground ,cblue-green))))
   `(message-header-to ((t (:foreground ,cblue-yellow :weight bold))))
   `(message-header-from ((t (:foreground ,cblue-yellow :weight bold))))
   `(message-header-cc ((t (:foreground ,cblue-yellow :weight bold))))
   `(message-header-newsgroups ((t (:foreground ,cblue-yellow :weight bold))))
   `(message-header-subject ((t (:foreground ,cblue-orange :weight bold))))
   `(message-header-xheader ((t (:foreground ,cblue-green))))
   `(message-mml ((t (:foreground ,cblue-yellow :weight bold))))
   `(message-separator ((t (:inherit font-lock-comment-face))))
;;;;; mew
   `(mew-face-header-subject ((t (:foreground ,cblue-orange))))
   `(mew-face-header-from ((t (:foreground ,cblue-yellow))))
   `(mew-face-header-date ((t (:foreground ,cblue-green))))
   `(mew-face-header-to ((t (:foreground ,cblue-red))))
   `(mew-face-header-key ((t (:foreground ,cblue-green))))
   `(mew-face-header-private ((t (:foreground ,cblue-green))))
   `(mew-face-header-important ((t (:foreground ,cblue-blue))))
   `(mew-face-header-marginal ((t (:foreground ,cblue-fg :weight bold))))
   `(mew-face-header-warning ((t (:foreground ,cblue-red))))
   `(mew-face-header-xmew ((t (:foreground ,cblue-green))))
   `(mew-face-header-xmew-bad ((t (:foreground ,cblue-red))))
   `(mew-face-body-url ((t (:foreground ,cblue-orange))))
   `(mew-face-body-comment ((t (:foreground ,cblue-fg :slant italic))))
   `(mew-face-body-cite1 ((t (:foreground ,cblue-green))))
   `(mew-face-body-cite2 ((t (:foreground ,cblue-blue))))
   `(mew-face-body-cite3 ((t (:foreground ,cblue-orange))))
   `(mew-face-body-cite4 ((t (:foreground ,cblue-yellow))))
   `(mew-face-body-cite5 ((t (:foreground ,cblue-red))))
   `(mew-face-mark-review ((t (:foreground ,cblue-blue))))
   `(mew-face-mark-escape ((t (:foreground ,cblue-green))))
   `(mew-face-mark-delete ((t (:foreground ,cblue-red))))
   `(mew-face-mark-unlink ((t (:foreground ,cblue-yellow))))
   `(mew-face-mark-refile ((t (:foreground ,cblue-green))))
   `(mew-face-mark-unread ((t (:foreground ,cblue-red-2))))
   `(mew-face-eof-message ((t (:foreground ,cblue-green))))
   `(mew-face-eof-part ((t (:foreground ,cblue-yellow))))
;;;;; mic-paren
   `(paren-face-match ((t (:foreground ,cblue-cyan :background ,cblue-bg :weight bold))))
   `(paren-face-mismatch ((t (:foreground ,cblue-bg :background ,cblue-magenta :weight bold))))
   `(paren-face-no-match ((t (:foreground ,cblue-bg :background ,cblue-red :weight bold))))
;;;;; mingus
   `(mingus-directory-face ((t (:foreground ,cblue-blue))))
   `(mingus-pausing-face ((t (:foreground ,cblue-magenta))))
   `(mingus-playing-face ((t (:foreground ,cblue-cyan))))
   `(mingus-playlist-face ((t (:foreground ,cblue-cyan ))))
   `(mingus-song-file-face ((t (:foreground ,cblue-yellow))))
   `(mingus-stopped-face ((t (:foreground ,cblue-red))))
;;;;; nav
   `(nav-face-heading ((t (:foreground ,cblue-yellow))))
   `(nav-face-button-num ((t (:foreground ,cblue-cyan))))
   `(nav-face-dir ((t (:foreground ,cblue-green))))
   `(nav-face-hdir ((t (:foreground ,cblue-red))))
   `(nav-face-file ((t (:foreground ,cblue-fg))))
   `(nav-face-hfile ((t (:foreground ,cblue-red-4))))
;;;;; mu4e
   `(mu4e-cited-1-face ((t (:foreground ,cblue-blue    :slant italic))))
   `(mu4e-cited-2-face ((t (:foreground ,cblue-green+2 :slant italic))))
   `(mu4e-cited-3-face ((t (:foreground ,cblue-blue-2  :slant italic))))
   `(mu4e-cited-4-face ((t (:foreground ,cblue-green   :slant italic))))
   `(mu4e-cited-5-face ((t (:foreground ,cblue-blue-4  :slant italic))))
   `(mu4e-cited-6-face ((t (:foreground ,cblue-green-1 :slant italic))))
   `(mu4e-cited-7-face ((t (:foreground ,cblue-blue    :slant italic))))
   `(mu4e-replied-face ((t (:foreground ,cblue-bg+3))))
   `(mu4e-trashed-face ((t (:foreground ,cblue-bg+3 :strike-through t))))
;;;;; mumamo
   `(mumamo-background-chunk-major ((t (:background nil))))
   `(mumamo-background-chunk-submode1 ((t (:background ,cblue-bg-1))))
   `(mumamo-background-chunk-submode2 ((t (:background ,cblue-bg+2))))
   `(mumamo-background-chunk-submode3 ((t (:background ,cblue-bg+3))))
   `(mumamo-background-chunk-submode4 ((t (:background ,cblue-bg+1))))
;;;;; org-mode
   `(org-agenda-date-today
     ((t (:foreground ,cblue-fg+1 :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((t (:inherit font-lock-comment-face))))
   `(org-archived ((t (:foreground ,cblue-fg :weight bold))))
   `(org-checkbox ((t (:background ,cblue-bg+2 :foreground ,cblue-fg+1
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((t (:foreground ,cblue-blue :underline t))))
   `(org-deadline-announce ((t (:foreground ,cblue-red-1))))
   `(org-done ((t (:bold t :weight bold :foreground ,cblue-green+3))))
   `(org-formula ((t (:foreground ,cblue-yellow-2))))
   `(org-headline-done ((t (:foreground ,cblue-green+3))))
   `(org-hide ((t (:foreground ,cblue-bg-1))))
   `(org-level-1 ((t (:foreground ,cblue-orange))))
   `(org-level-2 ((t (:foreground ,cblue-green+4))))
   `(org-level-3 ((t (:foreground ,cblue-blue-1))))
   `(org-level-4 ((t (:foreground ,cblue-yellow-2))))
   `(org-level-5 ((t (:foreground ,cblue-cyan))))
   `(org-level-6 ((t (:foreground ,cblue-green+2))))
   `(org-level-7 ((t (:foreground ,cblue-red-4))))
   `(org-level-8 ((t (:foreground ,cblue-blue-4))))
   `(org-link ((t (:foreground ,cblue-yellow-2 :underline t))))
   `(org-scheduled ((t (:foreground ,cblue-green+4))))
   `(org-scheduled-previously ((t (:foreground ,cblue-red))))
   `(org-scheduled-today ((t (:foreground ,cblue-blue+1))))
   `(org-sexp-date ((t (:foreground ,cblue-blue+1 :underline t))))
   `(org-special-keyword ((t (:inherit font-lock-comment-face))))
   `(org-table ((t (:foreground ,cblue-green+2))))
   `(org-tag ((t (:bold t :weight bold))))
   `(org-time-grid ((t (:foreground ,cblue-orange))))
   `(org-todo ((t (:bold t :foreground ,cblue-red :weight bold))))
   `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
   `(org-warning ((t (:bold t :foreground ,cblue-red :weight bold :underline nil))))
   `(org-column ((t (:background ,cblue-bg-1))))
   `(org-column-title ((t (:background ,cblue-bg-1 :underline t :weight bold))))
   `(org-mode-line-clock ((t (:foreground ,cblue-fg :background ,cblue-bg-1))))
   `(org-mode-line-clock-overrun ((t (:foreground ,cblue-bg :background ,cblue-red-1))))
   `(org-ellipsis ((t (:foreground ,cblue-yellow-1 :underline t))))
   `(org-footnote ((t (:foreground ,cblue-cyan :underline t))))
;;;;; outline
   `(outline-1 ((t (:foreground ,cblue-orange))))
   `(outline-2 ((t (:foreground ,cblue-green+4))))
   `(outline-3 ((t (:foreground ,cblue-blue-1))))
   `(outline-4 ((t (:foreground ,cblue-yellow-2))))
   `(outline-5 ((t (:foreground ,cblue-cyan))))
   `(outline-6 ((t (:foreground ,cblue-green+2))))
   `(outline-7 ((t (:foreground ,cblue-red-4))))
   `(outline-8 ((t (:foreground ,cblue-blue-4))))
;;;;; p4
   `(p4-depot-added-face ((t :inherit diff-added)))
   `(p4-depot-branch-op-face ((t :inherit diff-changed)))
   `(p4-depot-deleted-face ((t :inherit diff-removed)))
   `(p4-depot-unmapped-face ((t :inherit diff-changed)))
   `(p4-diff-change-face ((t :inherit diff-changed)))
   `(p4-diff-del-face ((t :inherit diff-removed)))
   `(p4-diff-file-face ((t :inherit diff-file-header)))
   `(p4-diff-head-face ((t :inherit diff-header)))
   `(p4-diff-ins-face ((t :inherit diff-added)))
;;;;; perspective
   `(persp-selected-face ((t (:foreground ,cblue-yellow-2 :inherit mode-line))))
;;;;; powerline
   `(powerline-active1 ((t (:background ,cblue-bg-05 :inherit mode-line))))
   `(powerline-active2 ((t (:background ,cblue-bg+2 :inherit mode-line))))
   `(powerline-inactive1 ((t (:background ,cblue-bg+1 :inherit mode-line-inactive))))
   `(powerline-inactive2 ((t (:background ,cblue-bg+3 :inherit mode-line-inactive))))
;;;;; proofgeneral
   `(proof-active-area-face ((t (:underline t))))
   `(proof-boring-face ((t (:foreground ,cblue-fg :background ,cblue-bg+2))))
   `(proof-command-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-debug-message-face ((t (:inherit proof-boring-face))))
   `(proof-declaration-name-face ((t (:inherit font-lock-keyword-face :foreground nil))))
   `(proof-eager-annotation-face ((t (:foreground ,cblue-bg :background ,cblue-orange))))
   `(proof-error-face ((t (:foreground ,cblue-fg :background ,cblue-red-4))))
   `(proof-highlight-dependency-face ((t (:foreground ,cblue-bg :background ,cblue-yellow-1))))
   `(proof-highlight-dependent-face ((t (:foreground ,cblue-bg :background ,cblue-orange))))
   `(proof-locked-face ((t (:background ,cblue-blue-5))))
   `(proof-mouse-highlight-face ((t (:foreground ,cblue-bg :background ,cblue-orange))))
   `(proof-queue-face ((t (:background ,cblue-red-4))))
   `(proof-region-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-script-highlight-error-face ((t (:background ,cblue-red-2))))
   `(proof-tacticals-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,cblue-bg))))
   `(proof-tactics-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,cblue-bg))))
   `(proof-warning-face ((t (:foreground ,cblue-bg :background ,cblue-yellow-1))))
;;;;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,cblue-fg))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,cblue-green+4))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,cblue-yellow-2))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,cblue-cyan))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,cblue-green+2))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,cblue-blue+1))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,cblue-yellow-1))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,cblue-green+1))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,cblue-blue-2))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,cblue-orange))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,cblue-green))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,cblue-blue-5))))
;;;;; rcirc
   `(rcirc-my-nick ((t (:foreground ,cblue-blue))))
   `(rcirc-other-nick ((t (:foreground ,cblue-orange))))
   `(rcirc-bright-nick ((t (:foreground ,cblue-blue+1))))
   `(rcirc-dim-nick ((t (:foreground ,cblue-blue-2))))
   `(rcirc-server ((t (:foreground ,cblue-green))))
   `(rcirc-server-prefix ((t (:foreground ,cblue-green+1))))
   `(rcirc-timestamp ((t (:foreground ,cblue-green+2))))
   `(rcirc-nick-in-message ((t (:foreground ,cblue-yellow))))
   `(rcirc-nick-in-message-full-line ((t (:bold t))))
   `(rcirc-prompt ((t (:foreground ,cblue-yellow :bold t))))
   `(rcirc-track-nick ((t (:inverse-video t))))
   `(rcirc-track-keyword ((t (:bold t))))
   `(rcirc-url ((t (:bold t))))
   `(rcirc-keyword ((t (:foreground ,cblue-yellow :bold t))))
;;;;; rpm-mode
   `(rpm-spec-dir-face ((t (:foreground ,cblue-green))))
   `(rpm-spec-doc-face ((t (:foreground ,cblue-green))))
   `(rpm-spec-ghost-face ((t (:foreground ,cblue-red))))
   `(rpm-spec-macro-face ((t (:foreground ,cblue-yellow))))
   `(rpm-spec-obsolete-tag-face ((t (:foreground ,cblue-red))))
   `(rpm-spec-package-face ((t (:foreground ,cblue-red))))
   `(rpm-spec-section-face ((t (:foreground ,cblue-yellow))))
   `(rpm-spec-tag-face ((t (:foreground ,cblue-blue))))
   `(rpm-spec-var-face ((t (:foreground ,cblue-red))))
;;;;; rst-mode
   `(rst-level-1-face ((t (:foreground ,cblue-orange))))
   `(rst-level-2-face ((t (:foreground ,cblue-green+1))))
   `(rst-level-3-face ((t (:foreground ,cblue-blue-1))))
   `(rst-level-4-face ((t (:foreground ,cblue-yellow-2))))
   `(rst-level-5-face ((t (:foreground ,cblue-cyan))))
   `(rst-level-6-face ((t (:foreground ,cblue-green-1))))
;;;;; sh-mode
   `(sh-heredoc     ((t (:foreground ,cblue-yellow :bold t))))
   `(sh-quoted-exec ((t (:foreground ,cblue-red))))
;;;;; show-paren
   `(show-paren-mismatch ((t (:foreground ,cblue-red+1 :background ,cblue-bg+3 :weight bold))))
   `(show-paren-match ((t (:background ,cblue-bg+3 :weight bold))))
;;;;; smartparens
   `(sp-show-pair-mismatch-face ((t (:foreground ,cblue-red+1 :background ,cblue-bg+3 :weight bold))))
   `(sp-show-pair-match-face ((t (:background ,cblue-bg+3 :weight bold))))
;;;;; sml-mode-line
   '(sml-modeline-end-face ((t :inherit default :width condensed)))
;;;;; SLIME
   `(slime-repl-output-face ((t (:foreground ,cblue-red))))
   `(slime-repl-inputed-output-face ((t (:foreground ,cblue-green))))
   `(slime-error-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,cblue-red)))
      (t
       (:underline ,cblue-red))))
   `(slime-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,cblue-orange)))
      (t
       (:underline ,cblue-orange))))
   `(slime-style-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,cblue-yellow)))
      (t
       (:underline ,cblue-yellow))))
   `(slime-note-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,cblue-green)))
      (t
       (:underline ,cblue-green))))
   `(slime-highlight-face ((t (:inherit highlight))))
;;;;; speedbar
   `(speedbar-button-face ((t (:foreground ,cblue-green+2))))
   `(speedbar-directory-face ((t (:foreground ,cblue-cyan))))
   `(speedbar-file-face ((t (:foreground ,cblue-fg))))
   `(speedbar-highlight-face ((t (:foreground ,cblue-bg :background ,cblue-green+2))))
   `(speedbar-selected-face ((t (:foreground ,cblue-red))))
   `(speedbar-separator-face ((t (:foreground ,cblue-bg :background ,cblue-blue-1))))
   `(speedbar-tag-face ((t (:foreground ,cblue-yellow))))
;;;;; tabbar
   `(tabbar-button ((t (:foreground ,cblue-fg
                                    :background ,cblue-bg))))
   `(tabbar-selected ((t (:foreground ,cblue-fg
                                      :background ,cblue-bg
                                      :box (:line-width -1 :style pressed-button)))))
   `(tabbar-unselected ((t (:foreground ,cblue-fg
                                        :background ,cblue-bg+1
                                        :box (:line-width -1 :style released-button)))))
;;;;; term
   `(term-color-black ((t (:foreground ,cblue-bg
                                       :background ,cblue-bg-1))))
   `(term-color-red ((t (:foreground ,cblue-red-2
                                       :background ,cblue-red-4))))
   `(term-color-green ((t (:foreground ,cblue-green
                                       :background ,cblue-green+2))))
   `(term-color-yellow ((t (:foreground ,cblue-orange
                                       :background ,cblue-yellow))))
   `(term-color-blue ((t (:foreground ,cblue-blue-1
                                      :background ,cblue-blue-4))))
   `(term-color-magenta ((t (:foreground ,cblue-magenta
                                         :background ,cblue-red))))
   `(term-color-cyan ((t (:foreground ,cblue-cyan
                                       :background ,cblue-blue))))
   `(term-color-white ((t (:foreground ,cblue-fg
                                       :background ,cblue-fg-1))))
   '(term-default-fg-color ((t (:inherit term-color-white))))
   '(term-default-bg-color ((t (:inherit term-color-black))))
;;;;; undo-tree
   `(undo-tree-visualizer-active-branch-face ((t (:foreground ,cblue-fg+1 :weight bold))))
   `(undo-tree-visualizer-current-face ((t (:foreground ,cblue-red-1 :weight bold))))
   `(undo-tree-visualizer-default-face ((t (:foreground ,cblue-fg))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,cblue-yellow))))
   `(undo-tree-visualizer-unmodified-face ((t (:foreground ,cblue-cyan))))
;;;;; volatile-highlights
   `(vhl/default-face ((t (:background ,cblue-bg-05))))
;;;;; web-mode
   `(web-mode-builtin-face ((t (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face ((t (:inherit ,font-lock-constant-face))))
   `(web-mode-css-at-rule-face ((t (:foreground ,cblue-orange ))))
   `(web-mode-css-prop-face ((t (:foreground ,cblue-orange))))
   `(web-mode-css-pseudo-class-face ((t (:foreground ,cblue-green+3 :weight bold))))
   `(web-mode-css-rule-face ((t (:foreground ,cblue-blue))))
   `(web-mode-doctype-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-folded-face ((t (:underline t))))
   `(web-mode-function-name-face ((t (:foreground ,cblue-blue))))
   `(web-mode-html-attr-name-face ((t (:foreground ,cblue-orange))))
   `(web-mode-html-attr-value-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-html-tag-face ((t (:foreground ,cblue-cyan))))
   `(web-mode-keyword-face ((t (:inherit ,font-lock-keyword-face))))
   `(web-mode-preprocessor-face ((t (:inherit ,font-lock-preprocessor-face))))
   `(web-mode-string-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-type-face ((t (:inherit ,font-lock-type-face))))
   `(web-mode-variable-name-face ((t (:inherit ,font-lock-variable-name-face))))
   `(web-mode-server-background-face ((t (:background ,cblue-bg))))
   `(web-mode-server-comment-face ((t (:inherit web-mode-comment-face))))
   `(web-mode-server-string-face ((t (:inherit web-mode-string-face))))
   `(web-mode-symbol-face ((t (:inherit font-lock-constant-face))))
   `(web-mode-warning-face ((t (:inherit font-lock-warning-face))))
   `(web-mode-whitespaces-face ((t (:background ,cblue-red))))
;;;;; whitespace-mode
   `(whitespace-space ((t (:background ,cblue-bg+1 :foreground ,cblue-bg+1))))
   `(whitespace-hspace ((t (:background ,cblue-bg+1 :foreground ,cblue-bg+1))))
   `(whitespace-tab ((t (:background ,cblue-red-1))))
   `(whitespace-newline ((t (:foreground ,cblue-bg+1))))
   `(whitespace-trailing ((t (:background ,cblue-red))))
   `(whitespace-line ((t (:background ,cblue-bg :foreground ,cblue-magenta))))
   `(whitespace-space-before-tab ((t (:background ,cblue-orange :foreground ,cblue-orange))))
   `(whitespace-indentation ((t (:background ,cblue-yellow :foreground ,cblue-red))))
   `(whitespace-empty ((t (:background ,cblue-yellow))))
   `(whitespace-space-after-tab ((t (:background ,cblue-yellow :foreground ,cblue-red))))
;;;;; wanderlust
   `(wl-highlight-folder-few-face ((t (:foreground ,cblue-red-2))))
   `(wl-highlight-folder-many-face ((t (:foreground ,cblue-red-1))))
   `(wl-highlight-folder-path-face ((t (:foreground ,cblue-orange))))
   `(wl-highlight-folder-unread-face ((t (:foreground ,cblue-blue))))
   `(wl-highlight-folder-zero-face ((t (:foreground ,cblue-fg))))
   `(wl-highlight-folder-unknown-face ((t (:foreground ,cblue-blue))))
   `(wl-highlight-message-citation-header ((t (:foreground ,cblue-red-1))))
   `(wl-highlight-message-cited-text-1 ((t (:foreground ,cblue-red))))
   `(wl-highlight-message-cited-text-2 ((t (:foreground ,cblue-green+2))))
   `(wl-highlight-message-cited-text-3 ((t (:foreground ,cblue-blue))))
   `(wl-highlight-message-cited-text-4 ((t (:foreground ,cblue-blue+1))))
   `(wl-highlight-message-header-contents-face ((t (:foreground ,cblue-green))))
   `(wl-highlight-message-headers-face ((t (:foreground ,cblue-red+1))))
   `(wl-highlight-message-important-header-contents ((t (:foreground ,cblue-green+2))))
   `(wl-highlight-message-header-contents ((t (:foreground ,cblue-green+1))))
   `(wl-highlight-message-important-header-contents2 ((t (:foreground ,cblue-green+2))))
   `(wl-highlight-message-signature ((t (:foreground ,cblue-green))))
   `(wl-highlight-message-unimportant-header-contents ((t (:foreground ,cblue-fg))))
   `(wl-highlight-summary-answered-face ((t (:foreground ,cblue-blue))))
   `(wl-highlight-summary-disposed-face ((t (:foreground ,cblue-fg
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((t (:foreground ,cblue-blue))))
   `(wl-highlight-summary-normal-face ((t (:foreground ,cblue-fg))))
   `(wl-highlight-summary-thread-top-face ((t (:foreground ,cblue-yellow))))
   `(wl-highlight-thread-indent-face ((t (:foreground ,cblue-magenta))))
   `(wl-highlight-summary-refiled-face ((t (:foreground ,cblue-fg))))
   `(wl-highlight-summary-displaying-face ((t (:underline t :weight bold))))
;;;;; which-func-mode
   `(which-func ((t (:foreground ,cblue-green+4))))
;;;;; yascroll
   `(yascroll:thumb-text-area ((t (:background ,cblue-bg-1))))
   `(yascroll:thumb-fringe ((t (:background ,cblue-bg-1 :foreground ,cblue-bg-1))))
   ))

;;; Theme Variables
(cblue-with-color-variables
  (custom-theme-set-variables
   'cblue
;;;;; ansi-color
   `(ansi-color-names-vector [,cblue-bg ,cblue-red ,cblue-green ,cblue-yellow
                                          ,cblue-blue ,cblue-magenta ,cblue-cyan ,cblue-fg])
;;;;; fill-column-indicator
   `(fci-rule-color ,cblue-bg-05)
;;;;; vc-annotate
   `(vc-annotate-color-map
     '(( 20. . ,cblue-red-1)
       ( 40. . ,cblue-red)
       ( 60. . ,cblue-orange)
       ( 80. . ,cblue-yellow-2)
       (100. . ,cblue-yellow-1)
       (120. . ,cblue-yellow)
       (140. . ,cblue-green-1)
       (160. . ,cblue-green)
       (180. . ,cblue-green+1)
       (200. . ,cblue-green+2)
       (220. . ,cblue-green+3)
       (240. . ,cblue-green+4)
       (260. . ,cblue-cyan)
       (280. . ,cblue-blue-2)
       (300. . ,cblue-blue-1)
       (320. . ,cblue-blue)
       (340. . ,cblue-blue+1)
       (360. . ,cblue-magenta)))
   `(vc-annotate-very-old-color ,cblue-magenta)
   `(vc-annotate-background ,cblue-bg-1)
   ))

;;; Rainbow Support

(declare-function rainbow-mode 'rainbow-mode)
(declare-function rainbow-colorize-by-assoc 'rainbow-mode)

(defvar cblue-add-font-lock-keywords nil
  "Whether to add font-lock keywords for cblue color names.
In buffers visiting library `cblue-theme.el' the cblue
specific keywords are always added.  In all other Emacs-Lisp
buffers this variable controls whether this should be done.
This requires library `rainbow-mode'.")

(defvar cblue-colors-font-lock-keywords nil)

;; (defadvice rainbow-turn-on (after cblue activate)
;;   "Maybe also add font-lock keywords for cblue colors."
;;   (when (and (derived-mode-p 'emacs-lisp-mode)
;;              (or cblue-add-font-lock-keywords
;;                  (equal (file-name-nondirectory (buffer-file-name))
;;                         "cblue-theme.el")))
;;     (unless cblue-colors-font-lock-keywords
;;       (setq cblue-colors-font-lock-keywords
;;             `((,(regexp-opt (mapcar 'car cblue-colors-alist) 'words)
;;                (0 (rainbow-colorize-by-assoc cblue-colors-alist))))))
;;     (font-lock-add-keywords nil cblue-colors-font-lock-keywords)))

;; (defadvice rainbow-turn-off (after cblue activate)
;;   "Also remove font-lock keywords for cblue colors."
;;   (font-lock-remove-keywords nil cblue-colors-font-lock-keywords))

;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'cblue)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End:
;;; cblue-theme.el ends here
