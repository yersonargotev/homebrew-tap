class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.47.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.47.3/dots_v0.47.3_darwin_arm64", using: :nounzip
      sha256 "1c8ebb84e878eb621a49a01bf925332243e9eabe47850f9f09d5672787a50693"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.47.3/dots_v0.47.3_darwin_amd64", using: :nounzip
      sha256 "ee6958b5765c94ed0b1997da4b7cfc4e3dd9d2ab1cebc8682cb4bd704ef86701"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.47.3/dots_v0.47.3_linux_arm64", using: :nounzip
      sha256 "f12820c47a79aadc3a3b1bd15a16031accc7ddae6f27259090d7ab3bd4814213"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.47.3/dots_v0.47.3_linux_amd64", using: :nounzip
      sha256 "57c2d1f65187daab3037edbbcb788d64128d9121d6a1266d2663b76d2514a7e9"
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
