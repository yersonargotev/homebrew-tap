class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.45.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.45.0/dots_v0.45.0_darwin_arm64", using: :nounzip
      sha256 "ce468f1d88c069cd246a553604ca0603f91ecc53fbb328d7c69457039524c604"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.45.0/dots_v0.45.0_darwin_amd64", using: :nounzip
      sha256 "1b9ed1939622fb37d5577fc445bbca2f8669a98abe63ef3cb5da25e76d726ffe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.45.0/dots_v0.45.0_linux_arm64", using: :nounzip
      sha256 "79c9ba4892d8a63646bf28d4415e62fad7761829fad962cab383ba0e3fee6045"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.45.0/dots_v0.45.0_linux_amd64", using: :nounzip
      sha256 "f343a29f5ff137b09784b2492cb0e99d24cda28c177e293273b15239d427dadd"
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
