(setq ring-bell-function 'ignore)

(global-linum-mode t)

(global-auto-revert-mode t)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
                                            ("9cf" "combofish")
                                            ))

(setq make-backup-files nil)
(setq auto-save-default t)

;;(add-to-list 'load-path "/home/liming/.emacs.d/elpa/ecb")
;;(require 'ecb)
;;(setq ecb-auto-activate t
;;      ecb-tip-of-the-day nil)

(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'C++-mode-hook 'hs-minor-mode)
(add-hook 'lisp-mode-hook 'hs-minor-mode)
(add-hook 'html-mode-hook 'hs-minor-mode)
(add-hook 'elpy-mode-hook 'hs-minor-mode)

;;(require 'smex)
;;(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex);;C-s.

;;(global-auto-complete-mode t)
(global-flycheck-mode)
(global-company-mode)

(auto-image-file-mode t)


(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)))))

(defun hidden-dos-col ()
  "Do not show ^M in files containing mixed UNIX and dos line ending."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-time ?\^M []))

(defun remove-dos-col ()
  "Replace DOS colns CR LF with Unix colns CX"
  (interactive)
  (goto-char (point-min)
             (while (search-forward "\r" nil t) (replace-match ""))))
  

(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region"))
      (progn
        (indent-buffer)
        (message "Indent buffer.")))))

(fset 'yes-or-no-p 'y-or-n-p)

(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-x)
(setq dired-dwim-target t)

;;;###autoload
(defun test-autoload()
  (interactive)
  (message "test autoload"))


(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
;;(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(delete-selection-mode t)

(provide 'init-better-defaults)
