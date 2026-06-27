class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.26.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.26.0/dots_v0.26.0_darwin_arm64", using: :nounzip
      sha256 "9cf5176820484e521fbd9d78f0804e51c38de5e26882c20a35a4dee9e067cefa"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.26.0/dots_v0.26.0_darwin_amd64", using: :nounzip
      sha256 "13a590f92dd68528ed63adf64f1d3391559b696cae7487a285d4237cf9f9f899"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.26.0/dots_v0.26.0_linux_arm64", using: :nounzip
      sha256 "1d4b579c8df5eb055d9dfeaff6aa481044c5a696f206f9858844cbe773c8b269"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.26.0/dots_v0.26.0_linux_amd64", using: :nounzip
      sha256 "8813ef1a61c4bf653d3c7f8747c9837256daadfdb6d453f1a78d46f47297d28c"
    end
  end

  def downloaded_binary
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    "dots_v#{version}_#{os}_#{arch}"
  end

  def install
    bin.install downloaded_binary => "dots"
  end

  test do
    system "#{bin}/dots", "--version"
  end
end
