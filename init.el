(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(border-width 0)
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" default)))
 '(fringe-mode 0 nil (fringe))
 '(horizontal-scroll-bar-mode nil)
 '(md4rd-subs-active
   (quote
    (emacs unixporn linux GradSchool Assyriology thinkpad thinkpadsetups TrueFilm Cuneiform)))
 '(menu-bar-mode nil)
 '(org-agenda-files (quote ("~/Documents/OrgMode/todo/todo.org")))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m org-drill)))
 '(package-selected-packages
   (quote
    (smart-mode-line-powerline-theme smart-mode-line pulseaudio-control exwm dmenu latex-extra magit md4rd google-translate s request hierarchy minimap ace-window which-key hydra fireplace org-plus-contrib multiple-cursors ace-jump-mode google-this bongo dired-sidebar pianobar auctex switch-window windresize define-word org)))
 '(pdf-latex-command "xetex")
 '(scroll-bar-mode nil)
 '(send-mail-function (quote smtpmail-send-it))
 '(set-frame-parameter nil)
 '(smtpmail-smtp-server "smtp.googlemail.com" t)
 '(smtpmail-smtp-service 25 t)
 '(tool-bar-mode nil))

;; ------------------ Melpa ------------------------
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; ------------------ Set Emacs Default Browser -----------------
(setq browse-url-browser-function 'eww-browse-url)

;; ----------------- Hunspell ----------------------

;;; find aspell and hunspell automatically
(cond
 ;; try hunspell at first
  ;; if hunspell does NOT exist, use aspell
 ((executable-find "hunspell")
  (setq ispell-program-name "hunspell")
  (setq ispell-local-dictionary "en_US")
  (setq ispell-local-dictionary-alist
        ;; Please note the list `("-d" "en_US")` contains ACTUAL parameters passed to hunspell
        ;; You could use `("-d" "en_US,en_US-med")` to check with multiple dictionaries
        '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)
          )))

 ((executable-find "aspell")
  (setq ispell-program-name "aspell")
  ;; Please note ispell-extra-args contains ACTUAL parameters passed to aspell
  (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))))


(global-set-key (kbd "C-c C-d") 'define-word-at-point)
(global-set-key (kbd "C-c D") 'define-word)
;; ------------------- Flyspell -------------------------
(add-to-list 'load-path "~/.emacs.d/vendor/flyspell")
(require 'flyspell)
(global-set-key (kbd "<f12>") 'flyspell-mode)

;; --------------------- Mode Line Customization -------------------
(display-time-mode 1)
(display-battery-mode 1)

;; --------------------- XeTeX ------------------------
(setq-default TeX-engine 'xetex)
(setq-default TeX-PDF-mode t)

;; -------------------- Switch Window Keybind ------------------
(global-set-key (kbd "C-x o") 'switch-window)

;; -------------------- Windresize Keybind ---------------------
(global-set-key (kbd "C-c r") 'windresize)

;; -------------------- Input Methods -------------------------
(global-set-key (kbd "C-c i") 'set-input-method)
(global-set-key (kbd "C-c d") 'describe-input-method)
(load-file "~/Documents/Emacs/input-methods/semitic-translit.el")
(load-file "~/Documents/Emacs/input-methods/ugaritic.el")
(load-file "~/Documents/Emacs/input-methods/akkadian.el")

;; ------------------- Visual Line Mode -----------------
(global-visual-line-mode 1)

;; ------------------- Misc Files to be Loaded  --------------------------
(load-file "~/.emacs.d/macros.el")
(load-file "~/.emacs.d/dired-tweaks.el")

;; ------------------ Themes ---------------------------
;; ------------------ Xrecources-Theme -------------------
;;(add-to-list 'load-path "~/.emacs.d/vendor/themes/xresources-theme")
;;(require 'xresources-theme)
;; ------------------ Forest-Blue-Theme ------------------
(add-to-list 'load-path "~/.emacs.d/vendor/themes/nord-theme")
(require 'nord-theme)

;; ------------------ Toggle Line Numbers --------------
(global-set-key (kbd "C-#") 'linum-mode)

;; ------------------ Autopair -----------------------
(add-to-list 'load-path "~/.emacs.d/vendor/autopair")
(require 'autopair)
(autopair-global-mode 1)

;; ------------------ Space After Cursor ----------------
(defun my-insert-space-after-point ()
  (interactive)
   (save-excursion (insert " ")))
(global-set-key (kbd "C-.") 'my-insert-space-after-point)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ------------------ Google This -------------------
(google-this-mode 1)

;; ------------------ Ace-Jump-Mode -----------------
(require 'ace-jump-mode)
;(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-char-mode)

;; ------------------ Magit Stuff -------------------
(define-key global-map (kbd "C-c g") 'magit-status)

;; ------------------ Multiple Cursors --------------
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-c a") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

;; ------------------- Eshell Global -------------------
(global-set-key (kbd "C-c s") 'shell)

;; ------------------- Which Key -----------------------
;;(global-set-key (kbd "C-c w") 'which-key-mode)
(require 'which-key)
(which-key-mode)

;; ------------------- Ace Window ----------------------
(global-set-key (kbd "M-p") 'ace-window)
(setq aw-dispatch-always t)

;; ------------------- Minimap Mode --------------------
(global-set-key (kbd "C-c m") 'minimap-mode)

;; ------------------- md4rd (reddit mode) -------------------
;; Both Heirarchy and Request added to get this to work.
;; So don't freak out because you don't know what they are doing up top.
;;(add-to-list 'load-path "~/.emacs.d/vendor/md4rd")
(require 'md4rd)

;; ------------------- Google Translate -----------------------
(require 'google-translate)
(require 'google-translate-default-ui)
(global-set-key "\C-ct" 'google-translate-at-point)
(global-set-key "\C-cT" 'google-translate-query-translate)

;; ------------------- LaTeX Extra Mode -----------------------
(add-hook 'LaTeX-mode-hook #'latex-extra-mode)
(global-set-key (kbd "C-1") 'cc-1)
(global-set-key (kbd "C-2") 'cc-2)
(global-set-key (kbd "C-3") 'cc-3)
(global-set-key (kbd "C-4") 'cc-4)

;; -------------------- EXWM -----------------------------
(require 'exwm)
(require 'exwm-config)
(exwm-config-default)
(setq exwm-workspace-number 4)
(require 'exwm-systemtray)
(exwm-systemtray-enable)
;; Pulse Audio while in EXWM
(pulseaudio-control-default-keybindings)
;; Swap Workspace
(global-set-key (kbd "s-s") 'exwm-workspace-swap)
;; Lockscreen
(defun lock-screen ()
  (interactive)
  (compile "betterlockscreen -l blur"))
;; Lockscreen keybind
(global-set-key (kbd "<XF86ScreenSaver>") 'lock-screen)
;; RandR
(require 'exwm-randr)
(setq exwm-randr-workspace-output-plist '(0 "VGA1"))
(add-hook 'exwm-randr-screen-change-hook
          (lambda ()
            (start-process-shell-command
             "xrandr" nil "xrandr --output VGA1 --left-of LVDS1 --auto")))
(exwm-randr-enable)



;; -------------------- Smart-Mode-Line -------------------
(setq sml/theme 'powerline)

;; -------------------- Dmenu ---------------------------
(global-set-key (kbd "s-SPC") 'dmenu)

;; -------------------- Highlight Current Line ------------
(global-hl-line-mode +1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;               ;;;;     ;;;;;;     ;;;;                 ;;;;
;;;             ;;    ;;   ;;   ;;   ;;  ;;                ;;;;
;;;            ;;      ;;  ;;  ;;   ;;                     ;;;;
;;;            ;;      ;;  ;;;;;;   ;;  ;;;;               ;;;;
;;;             ;;    ;;   ;;   ;;   ;;  ;;                ;;;;
;;;               ;;;;     ;;   ;;    ;;;;                 ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ------------------ Org Agenda View ------------------
(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((agenda "")
          (alltodo "")))))
;; ------------------ Org Agenda at Startup ----------------
(setq inhibit-splash-screen t)
(org-agenda nil "c")
(delete-other-windows)
(setq org-log-done 'time)
(setq org-agenda-skip-scheduled-if-done t)
;; ------------------- Org Bullets Mode ------------------
(add-to-list 'load-path "~/.emacs.d/vendor/org-bullets")
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; ------------------ Access to Org Mode Archives --------------
(require 'package) (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
