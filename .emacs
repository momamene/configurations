;; Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(proof-three-window-mode-policy (quote hybrid))
 '(safe-local-variable-values (quote ((checkdoc-minor-mode . t) (require-final-newline . t) (mangle-whitespace . t))))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(exec-path-from-shell-variables '("PATH" "MANPATH" "SHELL")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(proof-locked-face ((t (:background "#111111"))))
 '(proof-queue-face ((t (:background "#222222")))))

;; Package
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(mapc
 (lambda (package)
   (or (package-installed-p package)
       (if (y-or-n-p (format "Package %s is missing. Install it? " package)) 
           (package-install package))))
 '(color-theme zenburn-theme color-theme-solarized
               exec-path-from-shell
               auctex
               magit
               zotelo
               tuareg scala-mode2 coffee-mode haskell-mode markdown-mode markdown-mode+ paredit))

;; Desktop
(desktop-save-mode t)

;; Buffers
(global-auto-revert-mode t)
(setq global-auto-revert-non-file-buffers t)
(global-set-key [(ctrl tab)] 'select-next-window)
(global-set-key [(ctrl shift tab)] 'select-previous-window)
(global-set-key "\C-x\C-k" 'kill-this-buffer)
(global-set-key "\C-x\C-n" 'next-buffer)
(global-set-key "\C-x\C-b" 'ibuffer)

(defun select-next-window ()
  (interactive)
  (select-window (next-window (selected-window))))

(defun select-previous-window ()
  (interactive)
  (select-window (previous-window (selected-window))))

;; Auto-save
(setq auto-save-default nil)
(setq auto-save-list-file-name nil)
(setq make-backup-files nil)

;; Path
(setq explicit-shell-file-name "/bin/zsh")
(exec-path-from-shell-initialize)

;; Language
(set-language-environment 'UTF-8)
(set-language-environment-input-method "Korean")
(set-input-method 'korean-hangul)
(toggle-input-method)

;; Key binding
(defalias 'yes-or-no-p 'y-or-n-p)
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-c\C-q" 'comment-or-uncomment-region)
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-z" 'eshell)
(global-set-key [(ctrl return)] 'ff-find-other-file)

;; Theme
(require 'color-theme)
(load-theme 'solarized-dark t)
(set-default-font "Menlo for Powerline 16")
(global-font-lock-mode t)
(setq initial-scratch-message "")
(setq inhibit-startup-screen t)
(setq search-highlight t)
(setq query-replace-highlight t)

;; Syntax
(setq auto-fill-mode t)
(setq standard-indent 2)
(setq default-tab-width 2)
(setq indent-tabs-mode nil)
(setq default-tabs-mode nil)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Mail
(setq user-mail-address "jhkang@ropas.snu.ac.kr")

;; Uniquify
(require 'uniquify)
(setq
 uniquify-buffer-name-style 'forward
 uniquify-separator "/")

;; Shell
(add-to-list 'auto-mode-alist '(".*.csh\\'" . shell-script-mode))
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; ProofGeneral
(load-file "~/.emacs.d/ProofGeneral-4.2/generic/proof-site.el")
(setq proof-three-window-enable t)
(setq proof-shell-process-connection-type nil)
(add-to-list 'auto-mode-alist '(".*.v\\'" . coq-mode))

;; C
(setq c-basic-offset 2)
(setq c-offsets-alist
      '((substatement-open . 0)))

;; TeX
(require 'tex-site)
(load "preview-latex.el" nil t t)
(add-hook 'TeX-mode-hook
          '(lambda ()
             (define-key TeX-mode-map "\C-c\C-z" 'TeX-home-buffer)))
(require 'reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq LaTeX-command "latex -shell-escape")
(setq TeX-PDF-mode t)
(setq TeX-command-list (quote (("TeX" "%(PDF)%(tex) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (plain-tex-mode texinfo-mode ams-tex-mode) :help "Run plain TeX") ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX") ("Makeinfo" "makeinfo %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with Info output") ("Makeinfo HTML" "makeinfo --html %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with HTML output") ("AmSTeX" "%(PDF)amstex %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (ams-tex-mode) :help "Run AMSTeX") ("ConTeXt" "texexec --once --texutil %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt once") ("ConTeXt Full" "texexec %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt until completion") ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX") ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer") ("Print" "%p" TeX-run-command t t :help "Print the file") ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command) ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file") ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file") ("Check" "lacheck %s" TeX-run-compile nil (latex-mode) :help "Check LaTeX file for correctness") ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document") ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files") ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files") ("Other" "" TeX-run-command t t :help "Run an arbitrary command") ("XeLaTeX" "xelatex %t" TeX-run-command nil (latex-mode) :help "Run XeLaTeX"))))

;; Racket
(add-to-list 'auto-mode-alist '(".*.rkt\\'" . scheme-mode))
(add-hook 'scheme-mode-hook (lambda () (paredit-mode t)))

;; Mac
(if (eq system-type 'darwin)
    (progn
      (setq mac-command-modifier 'meta)
      (setq TeX-view-program-list (quote (("Skim" ("open %o")))))
      (setq TeX-view-program-selection
            (quote (((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-pdf "Skim") (output-html "xdg-open"))))
      ))

;; Ispell
(setq-default ispell-program-name "aspell")
(ispell-change-dictionary "english")
