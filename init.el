(require 'package)


;;; Code:



(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(cua-mode t nil (cua-base))
 '(cua-normal-cursor-color "black")
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("145aa35c243c585f446792f0920b8d7e161ff7b69c8f683095c4090c83c4809f" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "596a1db81357b93bd1ae17bed428d0021d12f30cda7bbb31ac44e115039171ae" "baed613982750c890ae1e6d704eacfe61b227b5bc21f5090b47792cef1892c5a" "6652533b56a94b84c281b6e3c7c16890b0b43cc85d1fe1b16201798a846e3d0b" default)))
 '(ede-project-directories
   (quote
    ("/home/philippe/teste" "/home/philippe/Dropbox/Prog/lisp/org-parser" "c:/Users/Philippe/Dropbox/puc/prog2")))
 '(electric-pair-mode t)
 '(global-hl-line-mode t)
 '(global-prettify-symbols-mode t)
 '(ido-mode t nil (ido))
 '(menu-bar-mode nil)
 '(org-mobile-directory "~/Dropbox/org_mobile")
 '(org-mobile-files (quote (org-agenda-files "~/Dropbox/todos/")))
 '(org-mobile-inbox-for-pull "~/Dropbox/org/from-mobile.org")
 '(package-selected-packages
   (quote
    (image-dired+ w3m zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu)))
 '(pdf-tools-enabled-modes
   (quote
    (pdf-history-minor-mode pdf-isearch-minor-mode pdf-links-minor-mode pdf-misc-minor-mode pdf-outline-minor-mode pdf-misc-size-indication-minor-mode pdf-misc-menu-bar-minor-mode pdf-annot-minor-mode pdf-sync-minor-mode pdf-misc-context-menu-minor-mode pdf-cache-prefetch-minor-mode pdf-occur-global-minor-mode pdf-virtual-global-minor-mode)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:background "#0c0d0e" :foreground "#44505c"))))
 '(mode-line-inactive ((t (:background "#232629" :foreground "dim gray" :box nil)))))



;; set functions

(defun init () (interactive)
       (find-file "~/.emacs.d/init.el"))
(defun dropbox () (interactive)
       (dired "~/Dropbox"))
(defun i3-main-config () (interactive)
       (find-file "~/.config/i3/config"))
(defun i3-blocks-config () (interactive)
       (find-file "~/.config/i3/.i3blocks.conf"))
(defun home-folder () (interactive)
       (dired "~/"))

(defun image-toggle ()
  (interactive)
  (mark-whole-buffer)
  (diredp-mark-region-files)
  (image-dired-dired-toggle-marked-thumbs)
  (mark-whole-buffer)
  (diredp-unmark-region-files))

(defun prog2 () (interactive)
       (let ((root (concat "~/Dropbox/puc/prog2/" "aula_"
                           (number-to-string (second (calendar-current-date)))
                           "_"
                           (number-to-string (first (calendar-current-date)))
                           )))
         (make-directory root)
         (mapc (lambda (x) (write-region (cadr x) nil (concat root (car x))))
               '(("/main.c" "#include \"auxiliar.h\" \n#include \"main.h\" \nint main(){return 0;}")
                 ("/main.h" "")
                 ("/auxiliar.c" "#include \"auxiliar.h\"")
                 ("/auxiliar.h" "")
                 ("/makefile" "tst: main.c auxiliar.c \n\t gcc -ggdb main.c auxiliar.c")))))

(defun gcm-scroll-down ()
  (interactive)
  (scroll-up 4))

(defun gcm-scroll-up ()
  (interactive)
  (scroll-down 4))

(defun tt (x) (interactive "sPackage:")
       (insert	(concat
		 ";; ============ ;;   "
		 x
		 "   ;; ============ ;;"
		 "\n\n"
		 "(use-package "
		 x
		 ")")))


;; set keybinds

(global-set-key (kbd "C-x C-f") 'ido-find-file)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
;; (global-set-key (kbd "<f2>") 'common-lisp-hyperspec-lookup-reader-macro)
;; (global-set-key (kbd "<f3>") 'common-lisp-hyperspec-format)
(global-set-key (kbd "<apps>") 'execute-extended-command)
(global-set-key (kbd "C-l") 'backward-delete-char)
(global-set-key (kbd "C-a") 'back-to-indentation)
(global-set-key (kbd "M-;") 'comment-dwim)
(global-set-key (kbd "C-x o") 'other-window)
(global-set-key (kbd "M--") 'menu-bar-mode)
(global-set-key (kbd "M-p") 'gcm-scroll-up)
(global-set-key (kbd "M-n") 'gcm-scroll-down)
(global-set-key  [f9] 'gud-step)
(global-set-key  [f6] 'gud-next)

(define-prefix-command 'f2-map)
(global-set-key (kbd "<f2>") 'f2-map)
(mapc (lambda (command-key)
	(global-set-key (kbd (concat "<f2> " (cadr command-key))) (car command-key)))
      '((init  "e")
	(dropbox "d")
	(mu4e "m")
	(home-folder "h")
	(i3-main-config "i c")
	(i3-blocks-config "i b")))

;; set startup

(fset 'yes-or-no-p 'y-or-n-p)
(setq ido-enable-flex-matching t
      ido-everywhere t
      visible-bell nil
      global-auto-revert-mode t
      inhibit-startup-message t
      fit-window-to-buffer-horizontally t)




;; HOOKS TERMINAR!!!!

;; (mapc (lambda (mode-cmd) (add-hook (car mode-cmd) (cadr mode-cmd)))
;;       '((c++-mode-hook linum-mode)
;; 	(c++-mode-hook irony-mode)
;; 	(c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++1y")))
;; 	(c++-mode-hook company-mode)
;; 	(c++-mode-hook flycheck-mode)))

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'counsel-irony)
  (define-key irony-mode-map [remap complete-symbol]
    'cousel-irony))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(mapc (lambda (hook) (add-hook hook 'linum-mode))
      '(c++-mode-hook
        c-mode-hook
        objc-mode-hook
        lisp-mode-hook
        emacs-lisp-mode-hook
        python-mode-hook
        conf-mode-hook))
(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++1y")))




;; ============= ;; irony-mode ;; =============
;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'irony-mode)
;; ============= ;; company mode ;; =============
(add-hook 'c++-mode-hook 'company-mode) (add-hook 'c-mode-hook 'company-mode)
;; ============= ;; flycheck-mode ;; =============
(add-hook 'c++-mode-hook 'flycheck-mode) (add-hook 'c-mode-hook 'flycheck-mode) (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
;; ============= ;; eldoc-mode ;; =============
 (add-hook 'irony-mode-hook 'irony-eldoc)










;; ============ ;;   slime   ;; ============ ;;

(use-package slime
  :bind (:map slime-mode-map
	      ("<f1>" . slime-documentation-lookup)
	      :map slime-repl-mode-map
	      ("<f1>" . slime-documentation-lookup))
  :init
  (load (expand-file-name "~/.roswell/helper.el"))
  (setq slime-contribs '(slime-fancy)
	inferior-lisp-program "ros -Q run")
  :config
  (slime))

;; ============ ;;   swiper   ;; ============ ;;

(use-package swiper
  :bind (("C-s" . swiper)
	 :map swiper-map
	 ("C-l" . backward-delete-char)))


;; ============ ;;   flycheck   ;; ============ ;;

(use-package flycheck
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode)
  :config
  (global-flycheck-mode t))




;; ============ ;;   which-key   ;; ============ ;;

(use-package which-key
  :config
  (which-key-mode 1))



;; ============ ;;   company   ;; ============ ;;


(use-package company
  :bind (:map company-active-map
	      ("spc" . company-abort)
	      ("\C-n" . company-select-next-or-abort)
	      ("\C-p" . company-select-previous-or-abort)
	      ("<tab>" . company-show-doc-buffer))
  :config
  (global-company-mode 1))


;; ============ ;;   dired   ;; ============ ;;


(use-package dired
  :bind (:map dired-mode-map
	      ("M-p" . gcm-scroll-up)
	      ("M-d" . gcm-scroll-down)
	      ))

;; ============ ;;   image-dired   ;; ============ ;;

(use-package image-dired)

;; ============ ;;   image-dired+   ;; ============ ;;

(use-package image-dired+)
;; ============ ;;   dired+   ;; ============ ;;

(use-package dired+
  :bind (:map diredp-list-files-map
	      ("M-n" . gcm-scroll-down)
	      ("M-p" . gcm-scroll-up)
	      ("C-t c-t" . image-toggle ))
  ;; :init (defun image-toggle ()
  ;; 	  (interactive)
  ;; 	  (setq current-prefix-arg '(5))
  ;; 	  (call-interactively 'image-dired-dired-toggle-marked-thumbs)))
  )


;; ============ ;;   org   ;; ============ ;;


(use-package org
  :bind (("C-c a" . org-agenda))
  :init
  (setq org-todo-keywords '((sequence "TODO" "MOSTLY DONE" "DONE"))
	org-agenda-files (list "~/Dropbox/todo.org" "~/Dropbox/todos/Faculdade.org" "~/Dropbox/todos/projs.org" "~/Dropbox/todos/misc.org")
	org-replace-disputed-keys t))


;; ============ ;;   helm   ;; ============ ;;


(use-package helm
  :bind (("C-x b" . helm-buffers-list)
	 ("C-x C-f" . helm-find-files)
	 ("C-x f" .  helm-locate)
	 ("M-y" . helm-show-kill-ring)
	 ("M-x" . helm-M-x)
	 ("M-h" . helm-apropos)
	 :map helm-map
	 ("<tab>" . helm-execute-persistent-action) ; rebind tab to do persistent action
	 ("C-i" . helm-execute-persistent-action) ; make TAB works in terminal
	 ("C-z" . helm-select-action) ; list actions using C-z
	 ("C-l" . backward-delete-char))
  :init
  (setq helm-display-header-line t ;; t by default
	helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
	helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
	helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
	helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
	helm-ff-file-name-history-use-recentf t
	helm-echo-input-in-header-line t
	helm-autoresize-max-height 30
	helm-autoresize-min-height 20
	helm-split-window-in-side-p t
	helm-buffers-fuzzy-matching t
	helm-buffer-skip-remote-checking t
	helm-gtags-use-input-at-cursor t)
  :config
  (helm-mode 1)
  (set-face-attribute 'helm-source-header t :height 10)
  (helm-autoresize-mode 1))


;; ============ ;;   w3m   ;; ============ ;;


(use-package w3m
  :bind (:map w3m-mode-map
	      ("M-n" . gcm-scroll-down)
	      ("n" . gcm-scroll-down)
	      ("M-p" . gcm-scroll-up)
	      ("p" . gcm-scroll-up))
  :init
  (setq w3m-user-agent "Mozilla/5.0 (Linux; U; Android 2.3.3; zh-tw; HTC_Pyramid Build/GRI40) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.")
  (setq browse-url-browser-function 'w3m-goto-url-new-session)
  :config
  (w3m-lnum-mode 1))


;; ============ ;;   smtpmail   ;; ============ ;;


(use-package smtpmail
  :init
  (setq message-send-mail-function 'smtpmail-send-it
	smtpmail-stream-type 'starttls
	smtpmail-default-smtp-server "smtp.gmail.com"
	smtpmail-smtp-server "smtp.gmail.com"
	smtpmail-smtp-service 587))


;; ============ ;;   mu4e   ;; ============ ;;

(use-package mu4e
  :init 
  (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
  (setq org-mu4e-link-query-in-headers-mode nil
	mail-user-agent 'mu4e-user-agent
	;; allow for updating mail using 'U' in the main view:
	mu4e-get-mail-command "offlineimap"
	mu4e-update-interval 600
	;; something about ourselves
	user-mail-address "philippejara@gmail.com"
	user-full-name  "Philippe Jara de Mello Mesquita Martins"
	mu4e-compose-signature 	(concat	 "Atenciosamente,\n Philippe Jara" "")
	;; don't save message to Sent Messages, Gmail/IMAP takes care of this
	mu4e-sent-messages-behavior 'delete
	;; don't keep message buffers around
	message-kill-buffer-on-exit t
	mu4e-maildir-shortcuts ()))


;; ============ ;;   golden-ratio   ;; ============ ;;

(use-package golden-ratio
  :init
  (defun pl/helm-alive-p ()
    (if (boundp 'helm-alive-p)
	(symbol-value 'helm-alive-p)))
  :config
  (add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)
  (golden-ratio-mode t))



;; ============ ;;   theme   ;; ============ ;;

(load-theme 'spacemacs-dark)
