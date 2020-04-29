;; .emacs.el --- GNU Emacs 用初期化ファイル                                                                                                            
                                                                                                                                                       
(set-language-environment "Japanese")                                                                                                                  
;(setq-default buffer-file-coding-system 'utf-8)                                                                                                       
(set-default-coding-systems 'utf-8)                                                                                                                    
(set-terminal-coding-system 'utf-8)                                                                                                                    
(set-keyboard-coding-system 'utf-8)                                                                                                                    
                                                                                                                                                       
;; load-pathを再帰的に定義                                                                                                                             
(let ((default-directory "~/.emacs.d/site-lisp"))                                                                                                      
  (setq load-path (cons default-directory load-path))                                                                                                  
  (normal-top-level-add-subdirs-to-load-path))

(setq inhibit-startup-message t)       ; Emacs 起動メッセージを非表示                                                                                  
(setq scroll-step 2)                   ; 画面スクロールの進み幅                                                                                        
(setq column-number-mode t)            ; カラムを表示する                                                                                              
(setq make-backup-files nil)                                                                                                                           
(setq-default fill-column 74)          ; デフォルトのテキストカラム (目安)                                                                             
(setq search-highlight t)              ; 検索時にハイライトする                                                                                        
(setq query-replace-highlight t)       ; 置換時にハイライトする                                                                                        
(setq automatic-hscrolling t)          ; 水平スクローリングを有効                                                                                      
(auto-compression-mode t)              ; 圧縮ファイルを自動で扱う                                                                                      
(setq dired-recursive-deletes 'top)    ; Dired で再帰的にディレクトリ削除                                                                              
(setq dired-recursive-copies t)        ; Dired で再帰的にディレクトリ複製                                                                              
(setq next-line-add-newlines nil)      ; バッファの最後で行を作成しない                                                                                
(setq quail-japanese-use-double-n t)   ; quail で `nn' で「ん」を入力する。                                                                            
(and (fboundp 'auto-image-file-mode)   ; 画像ファイルを自動で扱う                                                                                      
     (auto-image-file-mode t))                                                                                                                         
(put 'narrow-to-region 'disabled nil)  ; narrow-to-region を有効に                                                                                     
(setq-default indicate-empty-lines t)  ; バッファの終端を明示                                                                                          
(when (require 'hiwin nil t)                                                                                                                           
  (hiwin-activate)                             ;; hiwin-modeを有効化                                                                                   
  (set-face-background 'hiwin-face "gray10"))  ;; 非アクティブバッファの背景色を設定                                                                   
(setq debug-on-error t)                                                                                                                                
(windmove-default-keybindings)         ; 画面をshift+カーソルで移動

;; font-lock (文字装飾) に関する指定                                                                                                                   
(global-font-lock-mode 1)              ; 常に font-lock する                                                                                           
(setq font-lock-maximum-decoration t)  ; 全力で font-lock する                                                                                         
(show-paren-mode t)                    ; 対応カッコを表示する                                                                                          
(setq show-paren-style "parenthesis")  ; 対応カッコを光らせる                                                                                          
(and (boundp 'show-trailing-whitespace) ; 行末の空白を表示するか                                                                                       
     (setq-default                                                                                                                                     
      show-trailing-whitespace nil))                                                                                                                   
(setq-default transient-mark-mode t)                                                                                                                   
;; モードライン（アクティブでないバッファ）の文字色を設定します。                                                                                      
(set-face-foreground 'mode-line-inactive "gray30")                                                                                                     
;; モードライン（アクティブでないバッファ）の背景色を設定します。                                                                                      
(set-face-background 'mode-line-inactive "gray85")                                                                                                     
                                                                                                                                                       
(global-set-key (kbd "ESC M-%") 'query-replace-regexp)                                                                                                 
(global-set-key (kbd "ESC M-:") 'eval-region)                                                                                                          
(global-set-key (kbd "ESC M-<") 'beginning-of-buffer-other-window)                                                                                     
(global-set-key (kbd "C-x 4 s") 'reishi-open-term-other-window)                                                                                        
;(global-set-key (kbd "C-x C-p") 'reishi-other-window-backward)                                                                                        
(global-set-key (kbd "C-x C-n") 'other-window)                                                                                                         
(global-set-key (kbd "C-x C-q") 'view-mode)                                                                                                            
(global-set-key (kbd "C-x l")   'goto-line)                                                                                                            
(global-set-key (kbd "M-p")     'backward-paragraph)                                                                                                   
(global-set-key (kbd "M-n")     'forward-paragraph)                                                                                                    
(global-set-key [C-tab]         'bury-buffer)                                                                                                          
(global-set-key [delete]        'backward-delete-char)                                                                                                 
(global-set-key [home]          'beginning-of-buffer)                                                                                                  
(global-set-key [end]           'end-of-buffer)                                                                                                        
(global-set-key "\C-h" 'delete-backward-char)                                                                                                          
(global-set-key "\C-ct" 'perltidy-region)                                                                                                              
;(global-set-key "\C-x p" 'php-cs-fixer)                                                                                                               
                                                                                                                                                       
;;; 種類ごとの文字色                                                                                                                                   
(add-hook 'font-lock-mode-hook                                                                                                                         
  '(lambda ()                                                                                                                                          
    (set-face-foreground 'font-lock-comment-face  "brightblack")                                                                                       
    (set-face-foreground 'font-lock-variable-name-face  "brightyellow")                                                                                
  )                                                                                                                                                    
)

(when (require 'mwheel nil 'noerror)                                                                                                                   
  (mouse-wheel-mode t))                                                                                                                                
                                                                                                                                                       
(if (>= emacs-major-version 21)                                                                                                                        
    (mouse-wheel-mode))                                                                                                                                
                                                                                                                                                       
(show-paren-mode 1)                                                                                                                                    
                                                                                                                                                       
;; auto-complete                                                                                                                                       
(require 'auto-complete)                                                                                                                               
(global-auto-complete-mode t)                                                                                                                          
                                                                                                                                                       
;; twittering-mode                                                                                                                                     
(require 'twittering-mode)                                                                                                                             
(setq twittering-use-master-password t) ; no oAuth                                                                                                     
(setq twittering-icon-mode t)           ; display user icon                                                                                            
(setq twittering-display-remaining t)                                                                                                                  
                                                                                                                                                       
;; color theme                                                                                                                                         
(when (require 'color-theme)                                                                                                                           
(color-theme-initialize)                                                                                                                               
(color-theme-tangotango))
