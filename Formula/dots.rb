class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.24.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.24.2/dots_v0.24.2_darwin_arm64", using: :nounzip
      sha256 "1cee09355c6f1c7b8406363840fff50d881998fb69cc00854925e59a65aec287"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.24.2/dots_v0.24.2_darwin_amd64", using: :nounzip
      sha256 "ce0dcfa495d3ee93bf0b2be873e957b2debb0c52a0d37ad35a02c6744884d5bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.24.2/dots_v0.24.2_linux_arm64", using: :nounzip
      sha256 "19324b505eea26ebfa76eefcb55d9c856364016689d6e8118f434f426a08a64e"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.24.2/dots_v0.24.2_linux_amd64", using: :nounzip
      sha256 "08a8e8a14c6e528540458103ed934ba37b898752b782a85e0f3ad388b216369e"
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
