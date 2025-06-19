;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))

(setq copilot-idle-delay 0.7) ;; или попробуй увеличить до 1.0
(setq copilot-server-response-timeout 30000) ;; увеличить таймаут до 30 секунд


(defun my/quit-window-or-switch-to-scratch ()
  "Если это единственное окно — переключиться на *scratch*, иначе закрыть окно."
  (interactive)
  (if (= 1 (length (window-list)))
      (switch-to-buffer "*scratch*")
    (quit-window)))

;; Переопределяем q в популярных специальных буферах
(dolist (mode '(help-mode
                compilation-mode
                messages-buffer-mode
                org-agenda-mode
                magit-status-mode))
  (evil-define-key 'normal (intern (format "%s-map" mode)) (kbd "q") #'my/quit-window-or-switch-to-scratch))


(add-to-list 'default-frame-alist '(undecorated . t))


;; Сделать дефолтный размер шрифта 14pt
(set-face-attribute 'default nil :height 135)
;; Установить прозрачность окна: 90% непрозрачность (10% прозрачность)
;;(set-frame-parameter (selected-frame) '(alpha-background . 85))

;; Применять прозрачность ко всем новым окнам
;;(add-to-list 'default-frame-alist '(alpha-background . 93)) ;; 0 — полностью прозрачно, 100 — непрозрачно

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 18 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 20))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; setq doom-font (font-spec :family "JetBrains Mono" :size 24))


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-1337)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.

;;(setq doom-theme nil)

(setq display-line-numbers-type 'relative)

(defun my/relative-line-numbers ()
  "Display relative line numbers with current line absolute."
  (setq display-line-numbers 'visual))

(add-hook! 'prog-mode-hook #'my/relative-line-numbers)


;; Включить автосохранение сессии (открытые файлы)
;;(desktop-save-mode 1)


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


(setq org-agenda-files '("~/org/ideas.org" "~/org/journal/"))

(setq my/ideas-file "~/org/ideas.org")

(defun my/open-ideas-file ()
  "Открыть файл с идеями."
  (interactive)
  (find-file my/ideas-file))

(map! :leader
      :desc "Открыть лист идей" "n i" #'my/open-ideas-file)

(use-package! org-journal
  :after org
  :config
  (setq org-journal-dir "~/org/journal/"
        org-journal-date-format "%A, %d %B %Y"
        org-journal-file-format "%Y-%m-%d.org"
        org-journal-enable-agenda-integration t
        org-journal-time-format ""
        org-journal-date-prefix "#+TITLE: "))

(map! :leader
      :desc "Открыть текущую запись дневника" "n j" #'org-journal-open-current-journal-file
      :desc "Новая запись в дневник"           "n J" #'org-journal-new-entry)

(after! org
  (setq org-agenda-custom-commands
        '(("i" "Все идеи" todo "IDEA"
           ((org-agenda-files '("~/org/ideas.org")))))))

(defun my/org-git-sync ()
  "Синхронизировать ~/org с GitHub: pull, add, commit, push."
  (when (file-directory-p "~/org/.git")
    (let ((default-directory "~/org/"))
      ;; git pull
      (start-process "org-sync-pull" "*org-sync*" "git" "pull" "--rebase")
      ;; git add .
      (shell-command "git add .")
      ;; если есть изменения, делаем commit и push
      (let ((has-changes (not (string-empty-p (shell-command-to-string "git status --porcelain")))))
        (when has-changes
          (let ((msg (format "Auto commit: %s" (format-time-string "%Y-%m-%d %H:%M"))))
            (shell-command (format "git commit -m \"%s\"" msg))
            (start-process "org-sync-push" "*org-sync*" "git" "push")))))))

;; Запускать синхронизацию каждые 10 минут
(run-with-timer 0 (* 1 60) #'my/org-git-sync)



(defun my-weebery-is-always-greater ()
  (let* ((banner
          '(
            ""  ; пустые строки для вертикального отступа
            ""
            "        .-~~-.--."
            "       :         )"
            " .~ ~ -.\\       /.- ~~ ."
            " >       `.   .'       <"
            "(         .- -.         )"
            " `- -.-~  `- -'  ~-.- -'"
            "   (        :        )           _ _ .-:"
            "    ~--.    :    .--~        .-~  .-~  }       "
            "        ~-.-^-.-~ \\_      .~  .-~   .~"
            "                 \\ \\'     \\ '_ _ -~"
            "                  `.`.    //"
            "         . - ~ ~-.__`.`-.//"
            "     .-~   . - ~  }~ ~ ~-.~-."
            "   .' .-~      .-~       :/~-.~-./:"
            "  /_~_ _ . - ~                 ~-.~-._"
            "                                   ~-.<"
            ""
            ""))  ; пустые строки снизу
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert
        (+doom-dashboard--center
         +doom-dashboard--width
         (concat line
                 (make-string (max 0 (- longest-line (length line))) 32)))
        "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn #'my-weebery-is-always-greater)

(after! dashboard
  (setq dashboard-items '((agenda . 7))) ; Показывает 7 предстоящих событий
  (setq dashboard-center-content t)      ; Центрирует содержимое по горизонтали
  (setq dashboard-vertically-center-content t)) ; Центрирует содержимое по вертикали



(assoc-delete-all "Jump to bookmark" +doom-dashboard-menu-sections)

(assoc-delete-all "Open documentation" +doom-dashboard-menu-sections)
(add-hook! '+doom-dashboard-functions :append
  (insert "\n" (+doom-dashboard--center +doom-dashboard--width "Powered by Emacs!")))


(defun my/doom-dashboard-hide-mode-line ()
  "Disable mode-line in doom dashboard buffer."
  (with-current-buffer "*doom*"
    (setq mode-line-format nil)
    (setq-local doom-modeline-enable nil)
    (force-mode-line-update)))

(add-hook 'doom-after-init-hook
          (lambda ()
            (run-at-time "0.1 sec" nil #'my/doom-dashboard-hide-mode-line)))


(defun my/doom-dashboard-font-override ()
  "Set a smaller font just for Doom dashboard."
  (buffer-face-set '(:family "Fira Code" :height 90))) ;; <= укажи свой шрифт

(add-hook 'doom-dashboard-mode-hook #'my/doom-dashboard-font-override)
