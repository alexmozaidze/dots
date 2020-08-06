;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;; NOTE: Disabled due to me not using Emacs as an E-Mail client.
;;(setq user-full-name "Alex Mozaidze"
;;      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Liberation Mono" :size 15 :antialias t)
      doom-variable-pitch-font (font-spec :family "Liberation Mono" :size 15))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Org-mode configuration
(remove-hook 'org-mode-hook #'org-superstar-mode)
(after! org
  (setq org-fontify-quote-and-verse-blocks nil
        org-fontify-whole-heading-line nil
        org-hide-leading-stars nil
        org-startup-indented nil
        org-adapt-indentation nil))

;; Make evil-snipe behave more like Vim's original behaviour (besides s and S keys, of course)
(after! evil-snipe
  (setq evil-snipe-scope 'whole-line)
  (setq evil-snipe-repeat-scope 'whole-line))

;; Make g s c search not only after but also before cursor
(map!
 :n "g s c" 'avy-goto-char)

;; Disable indentation when pressing o or O
(setq-default evil-auto-indent nil)
(setq-default fringe-mode 0)
