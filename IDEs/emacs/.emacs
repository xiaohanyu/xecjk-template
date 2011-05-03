;;cdlatex settings;

(require 'cdlatex)
(autoload 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
(autoload 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" nil)

(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-cdlatex)   ; with Emacs latex mode
(add-hook 'TeX-mode-hook '(lambda () (outline-minor-mode 1)))
(add-hook 'LaTeX-mode-hook '(lambda () (outline-minor-mode 1)))
(add-hook 'latex-mode-hook '(lambda () (outline-minor-mode 1)))

;;Auctex settings;
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'turn-off-auto-fill)

(add-hook 'LaTeX-mode-hook (lambda ()
			     (TeX-fold-mode 1)))
(setq debug-on-error t)
(put 'upcase-region 'disabled nil)

(defun auctex ()
  (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t;
%`xelatex%(mode)%' %t" TeX-run-TeX nil t))  ;; 这里我编译了两次TeX文件
  (setq TeX-command-default "XeLaTeX")  ;; 设定默认编译命令为XeLaTeX
  (setq TeX-save-query nil)  ;; 保存之前不询问
  (setq TeX-show-compilation t))  ;; 在新窗口显示编译过程
(setq TeX-output-view-style '(("^pdf$" "." "okular %o %(outpage)")))
(add-hook 'LaTeX-mode-hook 'auctex)

;
