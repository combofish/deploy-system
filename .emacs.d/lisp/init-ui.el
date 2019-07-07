(tool-bar-mode -1)
(scroll-all-mode -1)
(global-linum-mode t) ;; enable line numbers globally
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;;;;启用时间显示设置，在minibuffer上面的那个杠上（忘了叫什么来着）
(display-time-mode 1)
;;;;;时间使用24小时制
(setq display-time-24hr-format t)
;;;;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)
;;;;;时间的变化频率，单位多少来着？
(setq display-time-interval 10)

(setq inhibit-splash-screen t)

(setq-default cursor-type "bar")

(global-hl-line-mode t)

;;(set-cursor-color "blue")
;;(set-mouse-color "yellow")

;;(load-theme 'material t) ;; load material theme
(load-theme 'monokai t)

(provide 'init-ui)

