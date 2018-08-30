;;(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(require 'package)
(add-to-list 'package-archives '("MELPA" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("MELPA_Q" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)

;;(defvar combofish/packages-use '(
;;                       company
;;                       monokai-theme

;;                       ) "Default packages")

;;(setq package-selected-packages combofish/packages-use)
;;(defun combofish/packages-installed-p ()
;;  (loop for pkg in combofish/packages-use
;;        when (not (packages-installed-p pkg)) do (return nil)
;;        finally (return t)))

;;(package-refresh-contents)

;;(package-install 'flycheck)
;;(package-install 'eln)
;;(package-install 'elpy)
;;(package-install 'py-autopep8)
;;(package-install 'better-defaults)
;;(package-install 'material-theme)
;;(package-install 'ein)
;;(package-install 'neotree)
;;;;(package-install command-log-mode)
;;(package-install 'auto-complete)
;;(package-install 'magit)

;;(package-install 'imenu)
;;;;(package-install 'cscope)

;;(package-install 'hungry-delete)
;;(package-install 'monokai-theme)

;;;;(package-install 'popwin)
;;(package-install 'smartparens)
;;;;(package-install 'autopair)

;;(package-install 'reveal-in-osx-finder)
;;(package-install 'swiper)
;;(package-install 'smex)
;;(package-install 'counsel)

;;(package-install 'ecb)
;;(package-install 'ECB)
;;cvs -z3 -d:pserver:anonymous@ecb.cvs.sourceforge.net:/cvsroot/ecb co -P ecb

;;(package-install 'multiple-cursors) 
;;;;(package-install 'hide-region)
;;(package-install 'session)
;;(package-install 'hide-lines)
;;(package-install 'web-mode)

;;(package-install 'js2-mode)
;;(package-install 'js2-refactor)

;;(package-install 'yasnippet)
;;(package-install 'auto-complete)
;;(package-install 'iedit)
;;;;(package-install 'electric-pair)
;;(package-install 'nyan-mode)
;;撤销
;;(package-install 'undo-tree)

;;(package-install 'imenu)
;;(require 'iedit)
(require 'cl)

(require 'hide-lines)
(require 'multiple-cursors)
(require 'neotree)

(require 'hungry-delete)
(global-hungry-delete-mode t)

(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)

;;configure j2s-mode for js mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
         ("\\.html\\'" . web-mode)
         )
       auto-mode-alist))

(defun combofish-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(add-hook 'web-mode-hook 'combofish-web-mode-indent-setup)

(defun combofish-toggle-web-indent ()
  (interactive)
  ;;For web development.
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
        (setq js-indent-level (if (= js-indent-level 2) 4 2))
        (setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))
  (if (eq major-mode 'web-mode)
      (progn
        (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
        (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
        (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))
;;  (setq indent-tabs-mode nil)) 
  )

(add-to-list 'load-path "/home/liming/.emacs.d/elpa/js2-refactor.el")
(require 'js2-refactor)
;;(require 'js2-refactor.el)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
 ;;(js2r-add-keybindings-with-prefix "C-c C-m")
(js2r-add-keybindings-with-prefix "C-c C-m")

;;python configure  
;;----------------------------------------
(elpy-enable) ;; enable elpy
;;(elpy-use-ipython)

;;use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;;enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
 
(require 'yasnippet)

;;(require 'session)
;;(add-hook 'after-init-hook 'session-initialize)


;;(load "desktop")
;;(desktop-load-default)
;;(desktop-read)

(require 'exwm)
(require 'exwm-config)
(exwm-config-default)

(provide 'init-packages)
