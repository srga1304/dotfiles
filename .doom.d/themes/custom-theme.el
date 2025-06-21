;;; doom-kitty-custom-theme.el --- Kitty terminal colors for Doom Emacs

(require 'doom-themes)

(def-doom-theme doom-kitty-custom
  "A custom Doom theme based on your Kitty terminal colors"

  ;; \u0426\u0432\u0435\u0442\u043e\u0432\u0430\u044f \u043f\u0430\u043b\u0438\u0442\u0440\u0430
  (
   ;; \u041e\u0441\u043d\u043e\u0432\u043d\u044b\u0435 \u0446\u0432\u0435\u0442\u0430
   (bg         '("#181818" nil nil))
   (fg         '("#d8d8d8" nil nil))

   ;; ANSI \u0446\u0432\u0435\u0442\u0430 (\u043f\u0440\u0438\u043c\u0435\u0440\u043d\u043e\u0435 \u0441\u043e\u043e\u0442\u0432\u0435\u0442\u0441\u0442\u0432\u0438\u0435)
   (black      '("#181818" nil nil))
   (red        '("#ac4242" nil nil))
   (green      '("#90a959" nil nil))
   (yellow     '("#f4bf75" nil nil))
   (blue       '("#6a9fb5" nil nil))
   (magenta    '("#aa759f" nil nil))
   (cyan       '("#75b5aa" nil nil))
   (white      '("#d8d8d8" nil nil))

   ;; bright ANSI colors
   (bright-black   '("#6b6b6b" nil nil))
   (bright-red     '("#c55555" nil nil))
   (bright-green   '("#aac474" nil nil))
   (bright-yellow  '("#feca88" nil nil))
   (bright-blue    '("#82b8c8" nil nil))
   (bright-magenta '("#c28cb8" nil nil))
   (bright-cyan    '("#93d3c3" nil nil))
   (bright-white   '("#f8f8f8" nil nil))
   )

  ;; \u041d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0430 \u0444\u0435\u0439\u0441\u043e\u0432
  (
   (default :background bg :foreground fg)
   (cursor  :background red)
   (region  :background blue :foreground fg)
   (highlight :background bright-black)
   (fringe :background bg)
   (vertical-bar :background bg)
   (minibuffer-prompt :foreground blue :weight 'bold)
   (font-lock-builtin-face :foreground magenta)
   (font-lock-comment-face :foreground bright-black :slant 'italic)
   (font-lock-constant-face :foreground cyan)
   (font-lock-function-name-face :foreground green)
   (font-lock-keyword-face :foreground red :weight 'bold)
   (font-lock-string-face :foreground yellow)
   (font-lock-type-face :foreground bright-green)
   (font-lock-variable-name-face :foreground fg)
   (link :foreground bright-blue :underline t)
   (warning :foreground yellow :weight 'bold)
   (error :foreground red :weight 'bold)
   )
  )

(provide 'doom-kitty-custom-theme)
