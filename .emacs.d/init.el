;; Package configs
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(set-register ?e (cons 'file "~/.emacs.d/init.el"))
(set-register ?r (cons 'file "~/.emacs.d"))

;; Some term enhancement
(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))
(ad-activate 'term-sentinel)

(defadvice ansi-term (before force-bash)
  (interactive (list "/bin/zsh")))
(ad-activate 'ansi-term)


;; Other configs
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Splash Screen
(setq inhibit-startup-screen t)
(setq initial-scratch-message ";; Happy Hacking")

;; Show matching parens
(setq show-paren-delay 0)
(show-paren-mode  1)

;; Paragraph movement
(global-set-key (kbd "s-j") 'forward-paragraph)
(global-set-key (kbd "s-k") 'backward-paragraph)

;; Keybinding for term mode
(add-hook 'term-mode
          (lambda () (global-set-key (kbd "s-v") 'term-paste)))

;; OrgMode Configs
(setq org-html-validation-link nil)
(setq org-todo-keywords
      '((sequence "TODO" "WORKING" "HOLD" "|" "DONE")))
(setq org-todo-keyword-faces
      '(("TODO"    . "blue")
	("WORKING" . "yellow")
	("HOLD"    . "red")
	("DONE"    . "green")))
(setq
 ;; Default directory for org files
 org-directory "~/notes/org"
 ;; Directory for notes/tasks to be refiled
 org-default-notes-file (concat org-directory "/refile.org")
 ;; Allows to store agenda files in their appropriate files.
 ;; This is useful when per project task lists are used.
 ;; Only show level 1 headings for refiling (level 2 are the task headers)
 org-refile-targets (quote ((nil :maxlevel . 1)
 			      (org-agenda-files :maxlevel . 1)))
 ;; Org agenda files read from here
 org-agenda-files (list org-directory)
 )
(define-key global-map (kbd "C-c t")
  (lambda () (interactive) (org-capture nil "t")))
       
(define-key global-map (kbd "C-c c")
  (lambda () (interactive) (org-capture nil )))

;; UI configurations
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(setq frame-resize-pixelwise t)
(dotimes (n 3)
  (toggle-frame-maximized))
(menu-bar-mode   -1)
(global-linum-mode 1)
(add-to-list 'default-frame-alist '(font . "Iosevka-11"))
(add-to-list 'default-frame-alist '(height . 24))
(add-to-list 'default-frame-alist '(width . 80))

;; Vim mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package evil-escape
  :ensure t
  :init
  (setq-default evil-escape-key-sequence "jk")
  :config
  (evil-escape-mode 1))

;; Anzu for search matching
(use-package anzu
  :ensure t
  :config
  (global-anzu-mode 1)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
  (global-set-key [remap query-replace] 'anzu-query-replace))

;; Theme
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))

;; Helm
(use-package helm
  :ensure t
  :init
  (setq helm-M-x-fuzzy-match t
	helm-mode-fuzzy-match t
	helm-buffers-fuzzy-matching t
	helm-recentf-fuzzy-match t
	helm-locate-fuzzy-match t
	helm-semantic-fuzzy-match t
	helm-imenu-fuzzy-match t
	helm-completion-in-region-fuzzy-match t
	helm-candidate-number-list 80
	helm-split-window-in-side-p t
	helm-move-to-line-cycle-in-source t
	helm-echo-input-in-header-line t
	helm-autoresize-max-height 0
	helm-autoresize-min-height 20)
  :config
  (helm-mode 1))

;; RipGrep
(use-package helm-rg :ensure t)

;; RipGrep
(use-package helm-flyspell :ensure t) 
;; Projectile
(use-package projectile
  :ensure t
  :init
  (setq projectile-require-project-root nil)
  :config
  (projectile-mode 1))

;; Helm Projectile
(use-package helm-projectile
  :ensure t
  :init
  (setq helm-projectile-fuzzy-match t)
  :config
  (helm-projectile-on))

;; spelling
(add-to-list 'ispell-local-dictionary-alist '("norsk-hunspell"
                                              "[[:alpha:]]"
                                              "[^[:alpha:]]"
                                              "[']"
                                              t
                                              ("-d" "nb_NO"); Dictionary file name
                                              nil
                                              iso-8859-1))

(add-to-list 'ispell-local-dictionary-alist '("english-hunspell"
                                              "[[:alpha:]]"
                                              "[^[:alpha:]]"
                                              "[']"
                                              t
                                              ("-d" "en_US-large")
                                              nil
                                              iso-8859-1))

(setq ispell-program-name "hunspell") 
(setq ispell-dictionary "nb_NO") 
(define-key flyspell-mode-map (kbd "C-;") 'helm-flyspell-correct) 

;; All The Icons
(use-package all-the-icons :ensure t)

;; NeoTree
(use-package neotree
  :ensure t
  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))



(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-quick-look) 
(evil-define-key 'normal neotree-mode-map (kbd "backtab") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)

(use-package all-the-icons :ensure t)  
(setq neo-theme (if (display-graphic-p) 'icons 'arrow)) 

;; Which Key
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode))

;; Custom keybinding
(use-package general
  :ensure t
  :config (general-define-key
  :states '(normal visual insert emacs)
  :prefix "SPC"
  :non-normal-prefix "M-SPC"
  "/"   '(helm-projectile-rg :which-key "ripgrep")
  "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
  "SPC" '(helm-M-x :which-key "M-x")
  "pf"  '(helm-projectile-find-file :which-key "find files")
  "pp"  '(helm-projectile-switch-project :which-key "switch project")
  "pb"  '(helm-projectile-switch-to-buffer :which-key "switch buffer")
  "pr"  '(helm-show-kill-ring :which-key "show kill ring")
  ;; Buffers
  "bb"  '(helm-mini :which-key "buffers list")
  ;; Window
  "wl"  '(windmove-right :which-key "move right")
  "wh"  '(windmove-left :which-key "move left")
  "wk"  '(windmove-up :which-key "move up")
  "wj"  '(windmove-down :which-key "move bottom")
  "w/"  '(split-window-right :which-key "split right")
  "w-"  '(split-window-below :which-key "split bottom")
  "wx"  '(delete-window :which-key "delete window")
  "qz"  '(delete-frame :which-key "delete frame")
  "qq"  '(kill-emacs :which-key "quit")
  ;; NeoTree
  "ft"  '(neotree-toggle :which-key "toggle neotree")
  "ff"  '(helm-find-files :which-key "find file")
  ;; Others
  "at"  '(ansi-term :which-key "open terminal")
))

(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))
;;keybind
(global-set-key (kbd "C-c a") 'org-agenda)

;; autosave org evry 30 sec
(add-hook 'auto-save-hook 'org-save-all-org-buffers)

;; Fancy titlebar for MacOS
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon  nil)
(setq frame-title-format nil)

;;Org bullets
(use-package org-bullets :ensure t  ) 
(require 'org-bullets) 
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
 
;; Flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(add-hook 'org-mode-hook 'turn-on-flyspell)

(use-package csharp-mode
  :ensure t
  )

(defun my-csharp-mode-hook ()
  ;; enable the stuff you want for C# here
  (electric-pair-local-mode 1) ;; Emacs 25
  )
(add-hook 'csharp-mode-hook 'my-csharp-mode-hook)

;; LSP
(use-package lsp-mode
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  :init (setq lsp-keymap-prefix "C-l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (python-mode . lsp)
         (c++ . lsp)
         (csharp . lsp)
         (rust . lsp)
         (javascript . lsp)
         ;;(typescript . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :init
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

;; Company mode
(use-package company
:ensure t
:init
(setq company-minimum-prefix-length 3)
(setq company-auto-complete nil)
(setq company-idle-delay 0)
(setq company-require-match 'never)
(setq company-frontends
  '(company-pseudo-tooltip-unless-just-one-frontend
    company-preview-frontend
    company-echo-metadata-frontend))
(setq tab-always-indent 'complete)
(defvar completion-at-point-functions-saved nil)
:config
(global-company-mode 1)
(define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
(define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
(define-key company-active-map (kbd "S-TAB") 'company-select-previous)
(define-key company-active-map (kbd "<backtab>") 'company-select-previous)
(define-key company-mode-map [remap indent-for-tab-command] 'company-indent-for-tab-command)
(defun company-indent-for-tab-command (&optional arg)
  (interactive "P")
  (let ((completion-at-point-functions-saved completion-at-point-functions)
    	(completion-at-point-functions '(company-complete-common-wrapper)))
	(indent-for-tab-command arg)))

(defun company-complete-common-wrapper ()
	(let ((completion-at-point-functions completion-at-point-functions-saved))
	(company-complete-common))))

(use-package company-lsp
:ensure t
:init
(push 'company-lsp company-backends))
 
;; Powerline
(use-package spaceline
  :ensure t
  :init
  (setq powerline-default-separator 'slant)
  :config
  (spaceline-emacs-theme)
  (spaceline-toggle-minor-modes-off)
  (spaceline-toggle-buffer-size-off)
  (spaceline-toggle-evil-state-on))


(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/notes/org/todo.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/notes/personal/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a"))) 
(define-key global-map (kbd "C-c x")
  (lambda () (interactive) (org-capture)))
 
;;;;;;;;;;;;;;;;;;;;;;;
;; Language Supports ;;
;;;;;;;;;;;;;;;;;;;;;;;
 
;; JavaScript
;;(use-package js2-mode
;;  :ensure t
;;  :init
;;  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))
;;(use-package tern :ensure t)
;;
;;;; Rust
;;(use-package rust-mode
;;  :ensure t
;;  :init
;;  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode)))
;;
;;(use-package lsp-rust
;;  :ensure t
;;  :init
;;  (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
;;  (add-hook 'rust-mode-hook #'lsp-rust-enable)
;;  (add-hook 'rust-mode-hook #'flycheck-mode))
;;
;; ;; Typescript
;;(use-package typescript-mode
;;  :ensure t
;;  :init
;;  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode)))
;;
;;;; LSP for JavaScript and TypeScript
;;(use-package lsp-javascript-typescript
;;  :ensure t
;;  :init
;;  (add-to-list 'js-mode-hook #'lsp-javascript-typescript-enable)
;;  (add-to-list 'typescript-mode-hook #'lsp-javascript-typescript-enable))
;; 
 ;; Auto-generated
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/notes/school/TDAT3002 - SysØk/notes.org")))
 '(package-selected-packages
   (quote
    (evil-org csharp-mode lsp-javascript-typescript typescript-mode lsp-rust rust-mode tern js2-mode spaceline company-lsp company lsp-ui lsp-mode flycheck general which-key neotree all-the-icons helm-projectile projectile helm-rg helm doom-themes anzu evil-escape evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
