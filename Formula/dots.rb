class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.6.0/dots_v0.6.0_darwin_arm64", using: :nounzip
      sha256 "aa55461bdf93c2d1cebec973a61639760ef5d60624144211e1f09b0138b21298"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.6.0/dots_v0.6.0_darwin_amd64", using: :nounzip
      sha256 "34b5e1d0d9616870d93352deefb4ed8a9030a4cc53894d258864e2fb06184c75"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.6.0/dots_v0.6.0_linux_arm64", using: :nounzip
      sha256 "f33e02ebe7a2cdfa2d22a4fb30761e58705d4aed33c7fb1213a36fedd873ca4f"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.6.0/dots_v0.6.0_linux_amd64", using: :nounzip
      sha256 "523ba3de0556a5b4b84fd9be2f46780c548f36b12e76153ad6ff1acf78093186"
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
    system "#{bin}/dots", "--help"
  end
end
