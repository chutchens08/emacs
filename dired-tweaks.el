;; ---------- Goto Files --------------
(global-set-key (kbd "C-c l")
		(lambda ()
		  (interactive)
		  (dired "~/Documents/LaTeX")))

(global-set-key (kbd "C-c o")
		(lambda ()
		  (interactive)
		  (dired "~/Documents/OrgMode")))

(global-set-key (kbd "C-c w")
		(lambda ()
		  (interactive)
		  (dired "~/Downloads/School")))

;; ---------- Hidden Files ------------
(require 'dired-x)
(setq dired-omit-files "^\\...+$")
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))
(global-set-key (kbd "M-o") 'dired-omit-mode)

;; ---------- Dired Sidebar --------------
(global-set-key (kbd "C-c f") 'dired-sidebar-toggle-sidebar)

;; ---------- Move Between Two Buffers -------------
; I found this snippet of code online.
; when two vertical instances of dired are open, the user will be able to copy/move files from one buffer to the next.
; from what I can tell it does not affect dired when only one buffer is opened.
(setq dired-dwim-target t)

;; ---------- File Size ----------------
(setq dired-listing-switches "-alh")
