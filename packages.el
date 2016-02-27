(setq elixir-credo-packages
      '(flycheck
        (flycheck-elixir-credo :location (recipe :fetcher github :repo "smeevil/flycheck-elixir-credo"))
         ))

(defun elixir-credo/init-flycheck-elixir-credo ()
  (use-package flycheck-elixir-credo
               :defer t
               :init (add-hook 'elixir-mode-hook 'flycheck-elixir-credo-setup)))

(defun elixir-credo/post-init-flycheck ()
  (add-hook 'elixir-mode-hook 'flycheck-mode))
