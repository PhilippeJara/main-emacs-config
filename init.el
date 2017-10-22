(require 'package)


;;; Code:



(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(company-echo-truncate-lines nil)
 '(company-irony-ignore-case (quote smart))
 '(company-tooltip-align-annotations t)
 '(company-tooltip-idle-delay 0)
 '(company-tooltip-margin 2)
 '(company-tooltip-maximum-width 50)
 '(cua-mode nil nil (cua-base))
 '(cua-normal-cursor-color "black")
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("6333b02622c185a36c4b4b2dcd706fc3d153d8f11bb68ea95d59f265d026bcce" "145aa35c243c585f446792f0920b8d7e161ff7b69c8f683095c4090c83c4809f" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "596a1db81357b93bd1ae17bed428d0021d12f30cda7bbb31ac44e115039171ae" "baed613982750c890ae1e6d704eacfe61b227b5bc21f5090b47792cef1892c5a" "6652533b56a94b84c281b6e3c7c16890b0b43cc85d1fe1b16201798a846e3d0b" default)))
 '(ede-project-directories
   (quote
    ("/home/philippe/teste" "/home/philippe/Dropbox/Prog/lisp/org-parser" "c:/Users/Philippe/Dropbox/puc/prog2")))
 '(el-get-dir "~/.emacs.d/elpa/el-get-5.1/")
 '(electric-pair-mode t)
 '(emms-player-mocp
   (quote
    (*player*
     (start . emms-player-mocp-start)
     (stop . emms-player-mocp-stop)
     (playablep . emms-player-mocp-playable-p)
     (regex . "\\.mp3$")
     (pause . emms-player-simple-pause)
     (resume . emms-player-simple-resume))))
 '(emms-player-mocp-command-name "mocp")
 '(emms-player-mocp-parameters (quote ("-l")))
 '(global-hl-line-mode t)
 '(global-prettify-symbols-mode t)
 '(ido-mode t nil (ido))
 '(menu-bar-mode nil)
 '(modern-c++-font-lock-global-mode t)
 '(org-mobile-directory "~/Dropbox/org_mobile")
 '(org-mobile-files (quote (org-agenda-files "~/Dropbox/todos/")))
 '(org-mobile-inbox-for-pull "~/Dropbox/org/from-mobile.org")
 '(package-selected-packages
   (quote
    (emms srefactor dired-x direx helm-descbinds latex-preview-pane auctex helm-smex smex helm-fuzzier helm-flx dired+ helm-directory el-get swiper-helm rainbow-delimiters cpputils-cmake cmake-project htmlize modern-cpp-font-lock cmake-mode cmake-ide json-mode centered-window-mode conkeror-minor-mode image-dired+ w3m zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu)))
 '(pdf-tools-enabled-modes
   (quote
    (pdf-history-minor-mode pdf-isearch-minor-mode pdf-links-minor-mode pdf-misc-minor-mode pdf-outline-minor-mode pdf-misc-size-indication-minor-mode pdf-misc-menu-bar-minor-mode pdf-annot-minor-mode pdf-sync-minor-mode pdf-misc-context-menu-minor-mode pdf-cache-prefetch-minor-mode pdf-occur-global-minor-mode pdf-virtual-global-minor-mode)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tramp-syntax (quote default) nil (tramp)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-type-face ((t (:inherit nil :foreground "#ce537a"))))
 '(fringe ((t (:background "unspecified-bg"))))
 '(linum ((t (:background "#0c0d0e" :foreground "#44505c"))))
 '(mode-line ((t (:background "#222226" :foreground "#b2b2b2" :box (:line-width 1 :color "gray43") :height 0.9))))
 '(mode-line-inactive ((t (:background "#232629" :foreground "dim gray" :box nil))))
 '(region ((t (:background "green4" :foreground "black"))))
 '(swiper-match-face-2 ((t (:background "tan" :inverse-video t)))))



;; set functions

(defun init () (interactive)
       (find-file "~/.emacs.d/init.el"))
(defun dropbox () (interactive)
       (dired "~/Dropbox"))
(defun i3-main-config () (interactive)
       (find-file "~/.config/i3/config"))
(defun i3-blocks-config () (interactive)
       (find-file "~/.config/i3/.i3blocks.conf"))
(defun conkeror-config () (interactive)
       (find-file "~/.conkerorrc"))
(defun home-folder () (interactive)
       (dired "~/"))

(defun image-toggle ()
  (interactive)
  (mark-whole-buffer)
  (diredp-mark-region-files)
  (image-dired-dired-toggle-marked-thumbs)
  (mark-whole-buffer)
  (diredp-unmark-region-files))

(defun exchange-mark-no-deac ()
  (interactive)
  (exchange-point-and-mark)
  (deactivate-mark nil))
;; (defun prog2 () (interactive)
;;        (let ((root (concat "~/Dropbox/puc/prog2/" "aula_"
;;                            (number-to-string (second (calendar-current-date)))
;;                            "_"
;;                            (number-to-string (first (calendar-current-date)))
;;                            )))
;;          (make-directory root)
;;          (mapc (lambda (x) (write-region (cadr x) nil (concat root (car x))))
;;                '(("/main.c" "#include \"auxiliar.h\" \n#include \"main.h\" \nint main(){return 0;}")
;;                  ("/main.h" "")
;;                  ("/auxiliar.c" "#include \"auxiliar.h\"")
;;                  ("/auxiliar.h" "")
;;                  ("/makefile" "tst: main.c auxiliar.c \n\t gcc -ggdb main.c auxiliar.c")))))

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

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
;; (global-set-key (kbd "<f2>") 'common-lisp-hyperspec-lookup-reader-macro)
;; (global-set-key (kbd "<f3>") 'common-lisp-hyperspec-format)
(global-set-key (kbd "<apps>") 'execute-extended-command)
(global-set-key (kbd "C-l") 'backward-delete-char)
(global-set-key (kbd "C-a") 'back-to-indentation)
(global-set-key (kbd "M-;") 'comment-dwim)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-l") 'backward-kill-word)
(global-set-key (kbd "C-x o") '(lambda ()(interactive) (insert "usar M-o")))
(global-set-key (kbd "C-x s") 'save-buffer)
(global-set-key (kbd "M--") 'menu-bar-mode)
(global-set-key (kbd "M-p") 'gcm-scroll-up)
(global-set-key (kbd "M-n") 'gcm-scroll-down)
(global-set-key  [f9] 'gud-step)
(global-set-key  [f6] 'gud-next)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
;;(global-set-key  (kbd "C-x C-x") 'exchange-mark-no-deac)
(global-set-key  (kbd "C-x C-x") 'exchange-point-and-mark)
(global-set-key (kbd "M-r") 'anzu-replace-modificado)
(define-prefix-command 'f2-map)
(global-set-key (kbd "<f2>") 'f2-map)
(mapc (lambda (command-key)
	(global-set-key (kbd (concat "<f2> " (cadr command-key))) (car command-key)))
      '((init  "e")
	(dropbox "d")
	(mu4e "m")
	(home-folder "h")
	(i3-main-config "i c")
	(i3-blocks-config "i b")
	(conkeror-config "c")))

;; set startup

(fset 'yes-or-no-p 'y-or-n-p)
(setq ido-enable-flex-matching t
      ido-everywhere t
      visible-bell nil
      global-auto-revert-mode t
      inhibit-startup-message t
      ;;fit-window-to-buffer-horizontally t
      display-time-mode t)


;; HOOKS TERMINAR!!!!

;; (mapc (lambda (mode-cmd) (add-hook (car mode-cmd) (cadr mode-cmd)))
;;       '((c++-mode-hook linum-mode)
;; 	(c++-mode-hook irony-mode)
;; 	(c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++1y")))
;; 	(c++-mode-hook company-mode)
;; 	(c++-mode-hook flycheck-mode)))

(add-hook 'dired-mode-hook (lambda ()(dired-omit-mode)))
;; (defun my-irony-mode-hook ()
;;   (define-key irony-mode-map [remap completion-at-point]
;;     'counsel-irony)
;;   (define-key irony-mode-map [remap complete-symbol]
;;     'cousel-irony))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(mapc (lambda (hook) (add-hook hook 'display-line-numbers-mode))
      '(c++-mode-hook
        c-mode-hook
        objc-mode-hook
        lisp-mode-hook
        emacs-lisp-mode-hook
        python-mode-hook
        conf-mode-hook))
(mapc (lambda (hook) (add-hook hook 'rainbow-delimiters-mode))
      '(c++-mode-hook
        c-mode-hook
        objc-mode-hook
        lisp-mode-hook
        emacs-lisp-mode-hook
        python-mode-hook
        conf-mode-hook))

(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++1z")))
(add-hook 'c++-mode-hook 'semantic-mode)
;; (add-hook 'window-configuration-change-hook (lambda ()
;; 					      (if (eq (count-windows) 1)
;; 						  (set-fringe-style 500)
;; 						(set-fringe-style nil))))



;; ============= ;; irony-mode ;; =============
;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'irony-mode)
;; ============= ;; company mode ;; =============
(add-hook 'c++-mode-hook 'company-mode) (add-hook 'c-mode-hook 'company-mode)
;; ============= ;; flycheck-mode ;; =============
(add-hook 'c++-mode-hook 'flycheck-mode) (add-hook 'c-mode-hook 'flycheck-mode) (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
;; ============= ;; eldoc-mode ;; =============
;; (add-hook 'irony-mode-hook 'irony-eldoc) 









;; ============ ;;   slime   ;; ============ ;;

(use-package slime
  :ensure t
  :bind (
	 :map slime-mode-map
	 ("<f1>" . slime-documentation-lookup)
	 ("M-m" . slime-selector)
	 ("M-p" . gcm-scroll-up)
	 ("M-n" . gcm-scroll-down)
	 :map slime-repl-mode-map
	 ("<f1>" . slime-documentation-lookup)
	 ("M-m" . slime-selector))
  :init
  (load (expand-file-name "~/.roswell/helper.el"))
  (setq slime-contribs '(slime-fancy)
	inferior-lisp-program "ros -Q run")
  ;; (setf slime-lisp-implementations
  ;; 	`((sbcl ("sbcl"))
  ;; 	  (ecl ("ecl"))))
  ;; (setf slime-default-lisp 'usar M-roswell)
  :config
  ;;(slime)
  )


;; ============ ;;   swiper   ;; ============ ;;

;; (use-package swiper
;;   :ensure t
;;   :bind (("C-s" . swiper)
;; 	 :map swiper-map
;; 	 ("C-s" . ivy-next-line)
;; 	 ("C-r" . ivy-previous-line)
;; 	 ("C-l" . backward-delete-char)))

;; ============ ;;   irony-mode   ;; ============ ;;

(use-package irony
  :ensure t
  :config
  (use-package company-irony
    :ensure t
    :config
    (add-to-list 'company-backends 'company-irony))
  (use-package company-irony-c-headers
    :ensure t
    :config
    (add-to-list 'company-backends 'company-irony-c-headers))
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

;; ============ ;;   flycheck   ;; ============ ;;

(use-package flycheck
  :ensure t
  :init
  ;;(add-hook 'after-init-hook #'global-flycheck-mode)
  :config
  (setq flycheck-display-errors-delay 1.2)
  ;;(flycheck-pos-tip-mode)
  (mapc (lambda (hook) (add-hook hook 'flycheck-mode))
      '(c++-mode-hook
        c-mode-hook
        objc-mode-hook
        lisp-mode-hook
        python-mode-hook
        conf-mode-hook))
  )




;; ============ ;;   which-key   ;; ============ ;;

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1))

;; ============ ;;   projectile   ;; ============ ;;

(use-package projectile
  :ensure t
  :init
  (setq projectile-switch-project-action #'projectile-dired)
  (setq projectile-mode-line
         '(:eval (format " Projectile[%s]"
                         (projectile-project-name)))
  :config
  (projectile-global-mode t))

;; ============ ;;   company   ;; ============ ;;


(use-package company
  :ensure t
  :bind (:map company-active-map
	      ("spc" . company-abort)
	      ("s" . self-insert-command)
	      ("\C-n" . company-select-next-or-abort)
	      ("\C-p" . company-select-previous-or-abort)
	      ("<tab>" . company-show-doc-buffer))
  :init
  (setq company-show-numbers t)
  (setq company-idle-delay 0)
  :config
  (global-company-mode 1)
  (add-to-list 'company-backends
	       '(company-irony-c-headers
		 company-irony)))
;;problema de ordem de carregamento? da certo ser re eval esse codigo após abrir .cpp


;; ============ ;;   dired   ;; ============ ;;

(require 'dired-x)
;; (use-package dired-x
;;   :bind (:map dired-mode-map
;; 	      ("M-p" . gcm-scroll-up)
;; 	      ("M-d" . gcm-scroll-down)))
;;   :config
;;   (add-hook dired-mode-hook (lambda ()(dired-omit-mode))))



;; ============ ;;   image-dired   ;; ============ ;;

(use-package image-dired
:ensure t)

;; ============ ;;   image-dired+   ;; ============ ;;

(use-package image-dired+
:ensure t)
;; ============ ;;   dired+   ;; ============ ;;

(use-package dired+
  :ensure t
  :bind (:map diredp-list-files-map
	      ("M-n" . gcm-scroll-down)
	      ("M-p" . gcm-scroll-up)
	      ("C-t c-t" . image-toggle ))
  ;; :init (defun image-toggle ()
  ;; 	  (interactive)
  ;; 	  (setq current-prefix-arg '(5))
  ;; 	  (call-interactively 'image-dired-dired-toggle-marked-thumbs)))
  :config
  (call-interactively 'diredp-next-line)
  )


;; ============ ;;   org   ;; ============ ;;


(use-package org
  :ensure t
  :bind (("C-c c" . org-capture)
	 ("C-c a" . org-agenda)
	 :map org-mode-map
	 ("M-n" . gcm-scroll-down)
	 ("M-p" . gcm-scroll-up))
  :init
  (setq org-todo-keywords '((sequence "TODO" "MOSTLY DONE" "DONE"))
	org-agenda-files (list "~/Dropbox/todo.org" "~/Dropbox/todos/Faculdade.org" "~/Dropbox/todos/projs.org" "~/Dropbox/todos/misc.org")
	org-replace-disputed-keys t))


;; ============ ;;   helm   ;; ============ ;;


(use-package helm
  :ensure t
  :bind (("C-x b" . helm-buffers-list)
	 ("C-x C-f" . helm-find-files)
	 ("C-x f" .  helm-locate)
	 ("M-y" . helm-show-kill-ring)
	 ("M-x" . helm-M-x)
	 ("M-h" . helm-apropos)
	 ;;("C-s" . helm-swoop)
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
  (helm-autoresize-mode 1)
  (load-file "~/.emacs.d/helm-ido-like.el")
  )


;; ============ ;;   ido   ;; ============ ;;

(use-package ido
  :ensure t
  :bind (("C-o" . ido-switch-buffer)))

;; ============ ;;   w3m   ;; ============ ;;


(use-package w3m
  :ensure t
  :bind (("C-h g" . w3m-goto-url)
	 :map w3m-mode-map
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
  :ensure t
  :init
  (setq message-send-mail-function 'smtpmail-send-it
	smtpmail-stream-type 'starttls
	smtpmail-default-smtp-server "smtp.gmail.com"
	smtpmail-smtp-server "smtp.gmail.com"
	smtpmail-smtp-service 587))


;; ============ ;;   mu4e   ;; ============ ;;

(use-package mu4e
  ;;:ensure t
  :init 
  (add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
  (setq org-mu4e-link-query-in-headers-mode nil
	mail-user-agent 'mu4e-user-agent
	;; allow for updating mail using 'U' in the main view:
	mu4e-get-mail-command "offlineimap"
	mu4e-update-interval 2400
	;; something about ourselves
	user-mail-address "philippejara@gmail.com"
	user-full-name  "Philippe Jara de Mello Mesquita Martins"
	mu4e-compose-signature 	(concat	 "Atenciosamente,\n Philippe Jara" "")
	;; don't save message to Sent Messages, Gmail/IMAP takes care of this
	mu4e-sent-messages-behavior 'delete
	;; don't keep message buffers around
	message-kill-buffer-on-exit t
	mu4e-drafts-folder "/Gmail/[Gmail].Drafts"
	mu4e-sent-folder   "/Gmail/[Gmail].Sent Mail"
	mu4e-trash-folder  "/Gmail/trash"
        mu4e-maildir-shortcuts
	'( ("/Gmail/[Gmail].Sent Mail"   . ?s)
	   ("/Gmail/[Gmail].Trash"       . ?t)
	   ("/Gmail/[Gmail].All Mail"    . ?a)))
:config
(add-to-list 'mu4e-bookmarks
       (make-mu4e-bookmark
        :name "All Inboxes"
        :query (concat
		"(maildir:/globomail/INBOX OR maildir:/Gmail/INBOX OR maildir:/hotmail/INBOX)"
		"AND NOT flag:list")
        :key ?i)))
;; ============ ;;   golden-ratio   ;; ============ ;;

;; (use-package golden-ratio
;;     :init
;;   (defun pl/helm-alive-p ()
;;     (if (boundp 'helm-alive-p)
;; 	(symbol-value 'helm-alive-p)))
;;   :config
;;   (add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)
;;   (golden-ratio-mode nil))


;; ============ ;;   anzu   ;; ============ ;;

(use-package anzu
  :ensure t
  :config
  (defun anzu-replace-modificado ()
    "anzu-query-replace-at-cursor-thing without query."
    (interactive)
    (let ((orig (point-marker)))
      (anzu--query-replace-common t
                                  :at-cursor t
                                  :query nil)
      (goto-char (marker-position orig))
      (set-marker orig nil)))
  )
;; ============ ;;   magit   ;; ============ ;;

(use-package magit
  :ensure t
  :bind ("<f7>" . magit-status))

;; ============ ;;   undo-tree   ;; ============ ;;

(use-package undo-tree
  :ensure t
  :bind(("C-z" . undo-tree-undo))
  ;;("C-" . undo-tree-redo))
  :config
  (global-undo-tree-mode))

;; ;; ============ ;;   centered-window-mode   ;; ============ ;;

(use-package centered-window-mode
  :ensure t
  :config
  (centered-window-mode))

;; ============ ;;   semantic   ;; ============ ;;

(use-package semantic
  :ensure t
  :config
  (global-semanticdb-minor-mode t)
  (global-semantic-idle-summary-mode nil))
;; ============ ;;   pdftools   ;; ============ ;;

(use-package pdftools
  :init (pdf-tools-install))
;; ============ ;;   emms   ;; ============ ;;

(use-package emms
  :config
  (emms-standard)
  (define-emms-simple-player mocp
    '(file)
    "\\.mp3$"
    "mocp"
    "-l")
  ;;(emms-default-players)
  (add-to-list 'emms-player-list 'emms-player-mocp))

;; ============ ;;   theme   ;; ============ ;;
;;(add-to-list 'default-frame-alist '(background-color . "black"))
;;(load-theme 'spacemacs-dark)
;;(load-theme 'personal-dark-2edgy4u t)
(load-theme 'my-light-theme t)
;;r(set-default-font "DejaVu Sans Mono 9")
(setq redisplay-dont-pause t)

