class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.20.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.20.0/dots_v0.20.0_darwin_arm64", using: :nounzip
      sha256 "0160ce8f1eb86010993734b0b63f7d69cc43c72a038553c6a10e9fd678e8fde8"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.20.0/dots_v0.20.0_darwin_amd64", using: :nounzip
      sha256 "d44f24401b83fce14631adae2c7e1234d0aa4c2cc9883c488bcfb34e11f22103"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.20.0/dots_v0.20.0_linux_arm64", using: :nounzip
      sha256 "095d6eed5126e631e6276ca88f9c50374eba92c70a5451435de43b882221e00c"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.20.0/dots_v0.20.0_linux_amd64", using: :nounzip
      sha256 "fd279cf609c9269923f3b90905550e3fb13bc1c35df373d15dde4a9d38498974"
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
