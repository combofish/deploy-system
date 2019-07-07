;;----Keybindings----

(global-set-key [f8] 'neotree-toggle)
(global-set-key [f6] 'eshell)
(global-set-key [f5] 'gdb)
(global-set-key (kbd "<f2>") 'open-my-init-file)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;(require 'hide-lines)
(global-set-key (kbd "C-c h l") 'hide-lines)
(global-set-key (kbd "C-c s l") 'hide-lines-show-all)
(global-set-key (kbd "C-c m l") 'list-matching-lines)

;;(require 'multiple-cursors)
(global-set-key (kbd "\C-cmn") 'mc/mark-next-like-this)
;;(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;;(global-set-key (kbd "C->") 'mc/mark-next-like-this)
;;(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;;(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key "\C-cha" 'hs-hide-all)
;;(global-set-key "\C-cas" 'hs-show-all)
(global-set-key "\C-csa" 'hs-show-all)
(global-set-key "\C-chb" 'hs-hide-block)
;(global-set-key "\C-cbs" 'hs-show-block)
(global-set-key "\C-csb" 'hs-show-block)
;;(global-set-key "\C-chl" 'hs-hide-level)

(global-set-key (kbd "C-c t i") 'combofish-toggle-web-indent)
(global-set-key (kbd "C-c p f") 'counsel-git)
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
(global-set-key (kbd "s-/") 'hippie-expand)

;;(require 'dired)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))


;;(require 'hide-region)
;;(global-set-key (kbd "C-c h r") 'hide-region-hide)
;;(global-set-key (kdb "C-c s r") 'hide-region-unhide)

(provide 'init-keybindings)
