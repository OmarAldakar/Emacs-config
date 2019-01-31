;; ------------------ CUSTOM WINDOW ---------------------------
(load-theme 'wombat)
(setq frame-title-format "emacs")
(set-language-environment "UTF-8")
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(menu-bar-mode -1)
(column-number-mode)
(set-default 'cursor-type 'hbar)
(add-hook 'prog-mode-hook 'linum-mode)
(setq truncate-partial-width-windows nil)
(setq ring-bell-function 'ignore)
(setq inhibit-startup-screen t)

;; ------------------- C-c/C-v ... ----------------------------
(cua-mode t)
(setq cua-auto-tabify-rectangles nil)
(transient-mark-mode 1)
(setq cua-keep-region-after-copy t)



;; ------------------- SHORTCUTS ------------------------------
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-t") 'find-file-other-window)
(global-set-key (kbd "C-w") 'delete-window)


;; ------------------ EMACS PACKAGE ---------------------------
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))


(add-to-list 'package-archives
           '("marmalade" . "http://marmalade-repo.org/packages")
           t)
(package-initialize)

;; ----------------- SOME TOOLS ------------------------------
(electric-pair-mode)
(global-set-key (kbd "C-f") 'query-replace)


;; ----------------- INIT-AUTO_COMPELTION --------------------
(use-package company
  :ensure t
  :config  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(add-hook 'after-init-hook 'global-company-mode)

;; -------------------- C-CONF -------------------------------
(add-hook 'c-mode-hook 'global-flycheck-mode)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(eval-after-load 'company
  '(add-to-list

    'company-backends '(company-irony-c-headers company-irony)))

;; ------------------- PYTHON CONF ---------------------------
(require 'company-jedi)
(add-to-list 'company-backends 'company-jedi)
(add-hook 'python-mode-hook 'global-flycheck-mode)
