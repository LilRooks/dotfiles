;; This is an operating system configuration generated
;; by the graphical installer.

(use-modules (srfi srfi-1)
             (guix channels)
             (guix download)
             (guix packages)
             (guix inferior)
             (gnu)
             (nongnu packages linux)
             (nongnu system linux-initrd))
(use-package-modules certs gl vulkan xorg xdisorg shells wm terminals linux)
(use-service-modules desktop networking ssh xorg linux)


(define %brightnessctl-udev-rules
  (file->udev-rule
    "90-brightnessctl.rules" (local-file "/gnu/store/zq2aiw7g74i34xsc55vgl7v6d42va57n-brightnessctl-0.5.1/lib/udev/rules.d/90-brightnessctl.rules")))
(define %steam-input-udev-rules
  (file->udev-rule
    "60-steam-input.rules"
    (origin
      (method url-fetch)
      (uri "https://raw.githubusercontent.com/rpmfusion/steam/master/60-steam-input.rules")
      (sha256 (base32 "1k6sa9y6qb9vh7qsgvpgfza55ilcsvhvmli60yfz0mlks8skcd1f")))))
(define thinkpad-acpi-config
  (plain-file "thinkpad_acpi.conf"
              "options thinkpad_acpi fan_control=1"))
;;(define thinkfan-service-type
;;  (service-type (name 'thinkfan)
;;                (description "Runs the thinkfan fan control daemon, @command{thinkfan}.")
;;                (extensions
;;                  (list (service-extension shepherd-root-service-type thinkfan-shepherd-service)))))V

(define home-drive
  (file-system
    (mount-point "/home")
    (device
      (uuid "449183af-042a-498f-98c8-267362b338fb"
            'ext4))
    (type "ext4")))
(define true-drive
  (file-system
    (mount-point "/home/zant/true")
    (device
      (uuid "f2cf7b03-85c4-4f84-9b58-af0700c4d6f3"
            'ext4))
    (type "ext4")
    (dependencies (list home-drive))))
(define (%steam-directory) "/home/zant/true/Games/SteamLibrary")

(operating-system
  (kernel 
    (let*
      ((channels
        (list (channel
               (name 'nonguix)
               (url "https://gitlab.com/nonguix/nonguix")
               (commit "e16999ccaee2d09bfb27a444cdf9a63a1920b616"))
              (channel
               (name 'guix)
               (url "https://git.savannah.gnu.org/git/guix.git")
               (commit "684259dfbc9b9d5ce4c82cef0c1f7ad29cec0fd6"))))
       (inferior
        (inferior-for-channels channels)))
      (first (lookup-inferior-packages inferior "linux" "5.13.5"))))
  (initrd microcode-initrd)
  (firmware (list linux-firmware))
  (locale "en_US.utf8")
  (timezone "America/New_York")
  (keyboard-layout (keyboard-layout "us" "mac" #:options '("caps:swapescape" "compose:rctrl")))
  (host-name "hal")
  (users (cons* (user-account
                  (name "zant")
                  (comment "Mal Zant")
                  (group "users")
                  (home-directory "/home/zant")
                  (supplementary-groups
                    '("wheel" "netdev" "audio" "video" "input" "lp"))
                  (shell (file-append zsh "/bin/zsh")))
                %base-user-accounts))
  (packages
    (append
      (list
        ;; window managers and tools
        xf86-video-amdgpu vulkan-loader mesa
        bspwm sxhkd alacritty zsh acpi
        ;; for https
        nss-certs)
      %base-packages))
  (services
    (append
      (list (pam-limits-service
              (list
                (pam-limits-entry "*" 'both 'nofile 524288)))
            (service kernel-module-loader-service-type '("thinkpad_acpi"))
            (simple-service 'thinkpad-acpi-config etc-service-type
                            (list `("modprobe.d/thinkpad_acpi.conf" ,thinkpad-acpi-config)))
            (service xfce-desktop-service-type)
            (service openssh-service-type)
            (bluetooth-service #:auto-enable? #t)
            (set-xorg-configuration
              (xorg-configuration
                ;;(drivers '("intel"))
                (keyboard-layout keyboard-layout)
                (extra-config '("Section \"Device\"
  Identifier \"device-amdgpu\"
  Driver \"amdgpu\"
  BusID \"PCI:2:0:0\"
EndSection"))))
            (udev-rules-service 'brightnessctl-rules %brightnessctl-udev-rules)
            (udev-rules-service 'steam-input-rules %steam-input-udev-rules))
      (modify-services %desktop-services
        (guix-service-type config =>
          (guix-configuration
            (inherit config)
            (substitute-urls (append (list "https://mirror.brielmaier.net")
                               %default-substitute-urls))
            (authorized-keys (append (list (local-file "/mirror.brielmaier.net.pub"))
                               %default-authorized-guix-keys)))))))
  (bootloader
    (bootloader-configuration
      (bootloader grub-bootloader)
      (target "/dev/sda")
      (keyboard-layout keyboard-layout)))
  (swap-devices
    (list (uuid "e4a9d10a-b10d-448e-b3df-803a66a60763")))
  (file-systems
    (cons* home-drive
           true-drive
;;           (file-system
;;             (device (%steam-directory))
;;             (mount-point "/home/zant/.local/share/guix-sandbox-home/SteamLibrary")
;;             (type "none")
;;             (flags '(bind-mount))
;;             (dependencies (list true-drive)))
           (file-system
             (mount-point "/")
             (device
               (uuid "dddd824a-e6af-4146-9c37-7d95cea03d27"
                     'ext4))
             (type "ext4"))
           %base-file-systems)))
