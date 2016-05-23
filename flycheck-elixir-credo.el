;;; flycheck-elixir-credo.el --- Flycheck: Elixir linting support
;; Copyright (C) 2015 Gerard de Brieder

;; Author: Gerard de Brieder <smeevil@me.com>
;; Maintainer: Gerard de Brieder <smeevil@me.com>
;; URL: http://github.com/smeevil/flycheck-elixir-credo.el
;; Created: 27th February 2016
;; Version: 0.1
;; Keywords: tools
;; Package-Requires: ((flycheck "0.22"))

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Add Elixir linting support to Flycheck.
;;
;; Provide syntax & style checkers to check Elixir code using credo
;;
;; This requires that `mix credo` has been globally installed with mix archive.
;;
;; Installation:
;;
;; (eval-after-load 'flycheck '(flycheck-elixir-credo-setup))

;;; Code:

(require 'flycheck)

(flycheck-define-checker elixir-credo
  "Defines a checker for elixir with credo"
  :command ("mix" "credo" "--format" "flycheck" source-inplace)
  :standard-input t
  :error-patterns
  (
   (info line-start (file-name) ":" line ":" column ": " (or "F" "R" "C")  ": " (message) line-end)
   (info line-start (file-name) ":" line ": " (or "F" "D" "R" "C" "W")  ": " (message) line-end)
   (warning line-start (file-name) ":" line ":" column ": " (or "D" "W")  ": " (message) line-end)
   (warning line-start (file-name) ":" line ": " (or "D" "W")  ": " (message) line-end)
   )
  :modes (elixir-mode)
  :next-checkers ((warning . elixir-dogma))
)

;;;###autoload
(defun flycheck-elixir-credo-setup ()
  "Setup Flycheck for Elixir Credo."
  (add-to-list 'flycheck-checkers 'elixir-credo))

(provide 'flycheck-elixir-credo)
;;; flycheck-elixir-credo.el ends here
