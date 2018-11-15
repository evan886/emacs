;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode -1)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(el-get 'sync)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

; place on   ~/.emacs
(defun my-python-mode-config ()
  (setq python-indent-offset 4
        python-indent 4
        indent-tabs-mode nil
        default-tab-width 4

        ;; 设置 run-python 的参数
        python-shell-interpreter "ipython"
        python-shell-interpreter-args "-i"
        python-shell-prompt-regexp "In \\[[0-9]+\\]: "
        python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
        python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
        python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
        python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

  (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
  (hs-minor-mode t)                     ;开启 hs-minor-mode 以支持代码折叠
  (auto-fill-mode 0)                    ;关闭 auto-fill-mode，拒绝自动折行
  ;(whitespace-mode t)                   ;开启 whitespace-mode 对制表符和行为空格高亮
  ;(hl-line-mode t)                      ;开启 hl-line-mode 对当前行进行高亮
  ;(pretty-symbols-mode t)               ;开启 pretty-symbols-mode 将 lambda 显示成希腊字符 λ
  ;;(set (make-local-variable 'electric-indent-mode) nil)) ;关闭自动缩进
  )

(add-hook 'python-mode-hook 'my-python-mode-config)
;jq

;( require   ' yasnippet)
;(yas/initialize)
;(yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")
;( require   ' auto-complete)
;(require  ' auto - complete - config)
;(global - auto - complete - mode t)
;(setq - default ac - sources  ' (ac-source-words-in-same-mode-buffers))
;(add-hook  ' emacs - lisp - mode - hook (lambda () (add - to - list  ' ac-sources  ' ac - source - symbols)))
;(add - hook  ' auto-complete-mode-hook (lambda () (add-to-list  ' ac - sources  ' ac-source-filename)))
;(set-face-background  ' ac - candidate - face  " lightgray " )
;(set - face - underline  ' ac-candidate-face "darkgray")
;(set-face-background  ' ac - selection - face  " steelblue " ) ;;; 设置比上面截图中更好看的背景颜色
;(define - key ac - completing - map   " \M-n "   ' ac-next)  ;;;  列表中通过按M-n来向下移动
;(define-key ac-completing-map "\M-p"  ' ac - previous)
;(setq ac - auto - start  2 )
;(setq ac - dwim t)
;(define - key ac - mode - map  (kbd  " M-TAB " )  ' auto-complete)
;
;
;;; 20181030
;
;;;配置代码错误检测，添加：
;(epy-setup-checker "pyflakes %f")
;;; 显示行号 试过 这个一定有效果
;
;;; Added by Package.el.  This must come before configurations of
;;; installed packages.  Don't delete this line.  If you don't want it,
;;; just comment it out by adding a semicolon to the start of the line.
;;; You may delete these explanatory comments.
;(package-initialize)
;
(global-linum-mode 1)
;
;;; 更改光标的样式（不能生效，解决方案见第二集）
;;;(setq cursor-type 'bar)
;
;;; 关闭启动帮助画面
;(setq inhibit-splash-screen 1)
;
;;;Eldoc needs an inferior Python process running
;(defun run-python-once ()
;  (remove-hook 'python-mode-hook 'run-python-once)
;  (run-python))
;
;;;Eldoc needs an inferior Python process running
;(add-hook 'python-mode-hook 'run-python-once)
;(defun run-python-once ()
;  (remove-hook 'python-mode-hook 'run-python-once)
;  (run-python))
;
;(add-hook 'python-mode-hook 'run-python-once)
