class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.18.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.18.0/dots_v0.18.0_darwin_arm64", using: :nounzip
      sha256 "b210c70830dbb3ad39107e990cf3be67b7f71cdfc363304d3d4293dcd631fdc6"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.18.0/dots_v0.18.0_darwin_amd64", using: :nounzip
      sha256 "2c11ed48d6962dab4df070996179286b3f5d11800c79a0a32ddce158238e61fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.18.0/dots_v0.18.0_linux_arm64", using: :nounzip
      sha256 "7f623f15a8850a455771ed9876202dcc45effa347af6805b3f3264c0c8ed7a00"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.18.0/dots_v0.18.0_linux_amd64", using: :nounzip
      sha256 "9fe59046c857d2b615cdea52d7cc90dd52da33d907357d2901a76a6b89dc7bef"
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
