;;owner function.
;;--------------------

(package-initialize)
;;own function.
(defun open-my-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;;Configure file.
;;--------------------
(add-to-list 'load-path "~/.emacs.d/lisp") 

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)

;;(load "init-packages")
;;(load "init-ui")
;;(load "init-better-defaults")
;;(load "init-keybindings")
;;(load "init-org")

;;(load-file "~/.emacs.d/lisp/init-packages.elc")
;;(load-file "~/.emacs.d/lisp/init-ui.elc")
;;(load-file "~/.emacs.d/lisp/init-better-defaults.el")
;;(load-file "~/.emacs.d/lisp/init-keybindings.elc")
;;(load-file "~/.emacs.d/lisp/init-org.elc")

;;(autoload 'test-autoload "init-better-defaults")
;;(test-autoload)

;;(update-directory-autoloads  "~/.emacs.d/lisp/")
;;(update-file-autoloads "~/.emacs.d/lisp/init-better-defaults.el" t "~/.emacs.d/lisp/init-better-defaults-autoload.el")
;;(load "init-better-defaults-autoload")

;;custom.
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

;;use configure in org mode.
;;(require 'org-install)
;;(require 'ob-tangle)
;;(org-babel-load-file (expand-file-name "combofish.org" user-emacs-directory))


