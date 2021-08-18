(define-module (rooks packages gruvbox-material-gtk))
(use-modules
  (guix packages)
  (guix git-download)
  (guix build-system copy)
  ((guix licenses) #:prefix license:))

(define-public gruvbox-material-base
  (package
    (name "gruvbox-material-base")
    (version "2418ff7988411c57f8974f14adeb70a64e7f25c1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                     (url "https://github.com/sainnhe/gruvbox-material-gtk.git")
                     (commit version)))
              (file-name (git-file-name name version))
              (sha256 (base32 "09mm3rwmp049sx9ml3kw62y0zxggsanh5qq5z4z1x76w67rjx8z7"))))
    (build-system copy-build-system)

    (synopsis "Gruvbox Material GTK Icons/Themes")
    (description "Gruvbox Material for GTK, Gnome, Cinnamon, XFCE, Unity, Plank and Icons")
    (home-page "https://github.com/sainnhe/gruvbox-material-gtk")
    (license license:expat)))

(define-public gruvbox-material-theme
  (package
    (inherit gruvbox-material-base)
    (name "gruvbox-material-theme")
    (arguments
      `(#:install-plan
        `(("themes" "share/themes"))))))

(define-public gruvbox-material-icons
  (package
    (inherit gruvbox-material-base)
    (name "gruvbox-material-icons")
    (arguments
      `(#:install-plan
        `(("icons" "share/icons"))))))
