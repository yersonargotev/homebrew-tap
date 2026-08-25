class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.78.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.78.0/dots_v0.78.0_darwin_arm64", using: :nounzip
      sha256 "5d79954203e1094c142fbd37929e75c38d2a107e7eac3939481217a4749e2dfa"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.78.0/dots_v0.78.0_darwin_amd64", using: :nounzip
      sha256 "c9b8c2996697bebec46134432e935b11834e74bb29a7f1aa769d21129254ff6b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.78.0/dots_v0.78.0_linux_arm64", using: :nounzip
      sha256 "8bb8a00b0e1ea8ae72c154f74951ab0a7cd455d0a58ec664766332ce82992787"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.78.0/dots_v0.78.0_linux_amd64", using: :nounzip
      sha256 "9b0d41649c867e52fca92df00ff0c6e337a03747e9f7d96d4a5f6421cdb6f296"
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
