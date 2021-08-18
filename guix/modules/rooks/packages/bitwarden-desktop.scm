(define-module (rooks packages bitwarden-desktop))
(use-modules
  (guix utils)
  (guix packages)
  (guix git-download)
  (guix download)
  (guix build-system node)
  (guix licenses)
  (gnu packages node))

(define node-lts
  (package
    (inherit node)
    (version "14.17.4")
    (source
      (origin
        (method url-fetch)
        (uri "https://github.com/nodejs/node/archive/refs/tags/v14.17.4.tar.gz")
        (sha256 
          (base32 "1vzh3l5aldrs604rpn5p8sf1w0q909dkajq3wz5klg27gqhs28j7"))))))

(define-public bitwarden-desktop
  (package
    (name "bitwarden-desktop")
    (version "1.16.6")
    (source
      (origin
        (method git-fetch)
        (uri
          (git-reference
            (url "https://github.com/bitwarden/desktop/")
            (commit (string-append "v" version))))
        (sha256
          (base32 "1g3zp1wd1fjppckzrkr2lx40d9y4wj5f3ppr4jynbz577nk1rzz4"))))

    (build-system node-build-system)
    (inputs `(("node" ,node-lts)))
    (synopsis "Desktop Client for Bitwarden Password Manager")
    (description "Bitwarden Password Manager is the easiest and safest way for individuals, teams, and business organizations to store, share, and sync sensitive data.")
    (home-page "https://bitwarden.com")
    (license gpl3+)))
; vim:tabstop=1
