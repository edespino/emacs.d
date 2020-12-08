;;; Local settings

(defun pt-pbcopy ()
  "Copy region to pasteboard."
  (interactive)
  (print (mark))
  (when mark-active
    (shell-command-on-region
     (point) (mark) "pbcopy")
    (kill-buffer "*Shell Command Output*")))

(global-set-key [?\C-x ?\C-y] 'pt-pbpaste)
(global-set-key [?\C-x ?\M-w] 'pt-pbcopy)
(global-set-key "\C-ct"       'find-file-at-point)
(global-set-key (kbd "C-c d") 'goto-line)
(global-set-key (kbd "C-x ,") 'compile)

(put 'dired-find-alternate-file 'disabled nil)

(add-to-list `auto-mode-alist `("\\.envrc\\'" . shell-script-mode))

(require-package 'org-bullets)
(add-hook 'org-mode-hook 'org-bullets-mode)

(require-package 'undo-tree)
(global-undo-tree-mode)

(set-default 'truncate-lines t)
(setq truncate-partial-width-windows nil)
(global-set-key "\C-c$" 'toggle-truncate-lines)

(require-package 'switch-window)
(setq-default switch-window-shortcut-style 'alphabet)
(setq-default switch-window-timeout nil)
(global-set-key (kbd "C-x o") 'switch-window)

(provide 'init-local)
