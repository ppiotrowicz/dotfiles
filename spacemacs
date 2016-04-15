;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     (auto-completion :disabled-for org
                      :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip nil
                      auto-completion-enable-sort-by-usage t
                      auto-completion-private-snippets-directory "~/.emacs.d/private/snippets/"
                      )
     (colors :variables
             colors-enable-nyan-cat-progress-bar t)
     csharp
     deft
     git
     github
     gtags
     emoji
     html
     java
     javascript
     markdown
     org
     osx
     tmux
     ranger
     restclient
     (ruby :variables
           ruby-test-runner 'rspec
           ruby-version-manager 'rbenv
           ruby-enable-enh-ruby-mode t)
     ruby-on-rails
     (shell :variables shell-default-shell 'eshell)
     spotify
     (syntax-checking :variables syntax-checking-enable-tooltips nil)
     themes-megapack
     unimpaired
     (version-control :variables
                      version-control-diff-tool 'git-gutter+
                      version-control-global-margin t)
     yaml

     ;; custom layers
     evil-little-word
     )

   dotspacemacs-additional-packages '(yafolding)

   dotspacemacs-excluded-packages '(rubocop smartparens)

   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."

  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update t
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-always-show-changelog nil
   dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-startup-recent-list-size 5
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(gruvbox spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("M+ 1mn"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-save-file-location nil
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-enable-paste-micro-state nil
   dotspacemacs-guide-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar nil
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers 'relative
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'changed
   ))

  (defun dotspacemacs/user-init ()
    "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
    )

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."

  ;; visual selection should not override system clipboard
  (fset 'evil-visual-update-x-selection 'ignore)

  ;; Org
  ;; (setq org-M-RET-may-split-line '((headline . nil) (item . nil) (table . nil)))
  (setq org-directory "~/org")
  (setq org-link-abbrev-alist
        '(("jira"      . "https://getbase.atlassian.net/browse/")))

   ;; csharp
  (setq-default omnisharp-server-executable-path "/usr/local/bin/omnisharp")

  ;; ruby
  (add-hook 'compilation-filter-hook 'inf-ruby-auto-enter)

  ;; deft
  (setq deft-directory "~/org")
  (setq deft-recursive t)

  ;; java
  ;; (setq eclim-eclipse-dirs "/opt/homebrew-cask/Caskroom/eclipse-java/4.5.1/Eclipse.app/Contents/Eclipse"
  ;;       eclim-executable "/opt/homebrew-cask/Caskroom/eclipse-java/4.5.1/Eclipse.app/Contents/Eclipse/eclim")

  ;; web development
  (setq coffee-tab-width 2
        javascript-indent-level 2
        js-indent-level 2
        js2-basic-offset 2
        web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        sass-indent-offset 2
        css-indent-offset 2)

  ;; UI
  (global-hl-line-mode -1)
  (global-vi-tilde-fringe-mode -1)
  (setq powerline-default-separator 'slant)

  ;; smartparens
  (setq sp-highlight-pair-overlay nil
        sp-highlight-wrap-overlay nil
        sp-highlight-wrap-tag-overlay nil
   )

  ;; Make evil-mode up/down operate in screen lines instead of logical lines
  (define-key evil-motion-state-map "j" 'evil-next-visual-line)
  (define-key evil-motion-state-map "k" 'evil-previous-visual-line)
  (define-key evil-visual-state-map "j" 'evil-next-visual-line)
  (define-key evil-visual-state-map "k" 'evil-previous-visual-line)

  ;; Windows
  (global-set-key (kbd "C-h") 'evil-window-left)
  (global-set-key (kbd "C-j") 'evil-window-down)
  (global-set-key (kbd "C-k") 'evil-window-up)
  (global-set-key (kbd "C-l") 'evil-window-right)

  ;; neo tree
  (setq neo-theme 'nerd)

  ;; yafolding
  (require 'yafolding)
  (add-hook 'enh-ruby-mode-hook 'yafolding-mode)
  (define-key yafolding-mode-map (kbd "<C-S-return>") nil)
  (define-key yafolding-mode-map (kbd "<C-M-return>") nil)
  (define-key yafolding-mode-map (kbd "<C-return>") nil)
  (define-key evil-normal-state-map (kbd "zm") 'yafolding-toggle-all)
  (define-key evil-normal-state-map (kbd "zc") 'yafolding-hide-parent-element)
  (define-key evil-normal-state-map (kbd "za") 'yafolding-toggle-element)
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(erm-syn-errline ((t nil)))
 '(erm-syn-warnline ((t nil))))
