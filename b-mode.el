;;; b-mode.el --- major mode for editing B code

;; Copyright © 2020, by developers

;; Author: Oleksandr Denysenko
;; Version: 0.1
;; Created: 31 Jan 2020
;; Keywords: languages
;; Homepage: n/a

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This is a syntax description for B programming language

;; (load "/path/to/el/file/b-mode")
;; (require 'b-mode)
;; (add-to-list 'auto-mode-alist '("\\.b\\'" . b-mode))

;;; Code:

(setq b-font-lock-keywords
      (let* (
            ;; define several category of keywords
            (b-keywords '("auto" "extrn" "if" "else" "for" "while" "repeat" "switch" "do" "return" "break" "goto" "next" "case" "default"))
            (b-types '("float" "integer" "string" "vector"))
            (b-functions '("char" "chdir" "chmod" "chown" "close" "creat" "ctime" "execl" "execv" "exit" "fork" "fstat" "getchar" "getuid" "gtty" "lchar" "link" "mkdir" "open" "printf" "printn" "putchar" "read" "seek" "setuid" "stat" "stty" "time" "unlink" "wait" "write"))
            (b-routines '(".ABBRV" ".ABORT" ".BSET" ".READ" ".TABS" ".WRITE" "ABS" "ALLOCATE" "ANY" "APPLY" "ASCBCD" "CALLF" "CALLFF" "CLOSE" "COMPARE" "CONCAT" "COPY" "DATE" "DATESI" "EOF" "EQUAL" "ERROR" "EXIT" "GETCHAR/GETC" "GETDATE" "GETLINE" "GETSTR" "GETUMC" "GETVEC" "HIST" "LENGTH" "LINUMB" "LOWERCASE" "MAX" "MIN" "NARGS" "NOBRKS" "NULLSTRING" "OPEN" "PRINT" "PRINTF" "PROMPT" "PUTCHAR/PUTC" "RAND" "READ/WRITE" "READF" "RESET/SETEXIT" "RLSEVEC" "SCAF" "SCAN" "SHELLSORT" "SIDATE" "SLEEP" "STRIP" "SYSTEM" "TABSET" "TIME" "TRIM" "ZERO"))

            ;; generate regex string for each category of keywords
            (b-keywords-regexp (regexp-opt b-keywords 'words))
            (b-types-regexp (regexp-opt b-types 'words))
            (b-functions-regexp (regexp-opt b-functions 'words))
            (b-routines-regexp (regexp-opt b-routines 'words)))

        `(
          (,b-types-regexp . font-lock-type-face)
          (,b-functions-regexp . font-lock-function-name-face)
          (,b-keywords-regexp . font-lock-keyword-face)
          (,b-routines-regexp . font-lock-keyword-face)
          ;; note: order above matters, because once colored, that part won't change.
          ;; in general, put longer words first
          )))

;;;###autoload
(define-derived-mode b-mode fundamental-mode
  "Major mode for editing B code"

  (setq font-lock-defaults '((b-font-lock-keywords))))

(provide 'b-mode)

;;; b-mode.el ends here
