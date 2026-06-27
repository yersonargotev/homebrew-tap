class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.37.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.37.0/dots_v0.37.0_darwin_arm64", using: :nounzip
      sha256 "814d347ef43d89b5b0c22fc1a3c2599893e96f151fde358bc735f49a7a259fdf"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.37.0/dots_v0.37.0_darwin_amd64", using: :nounzip
      sha256 "6494d487329c35433d47bc77db17845ba84cd826cf49bd32d2a114e6ce36d6d9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.37.0/dots_v0.37.0_linux_arm64", using: :nounzip
      sha256 "3e6bd45ce892e15511fa7931b0381e2fb99e2d8523d669c546d89dd39a86c9cc"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.37.0/dots_v0.37.0_linux_amd64", using: :nounzip
      sha256 "8ea231f21709b0964d84263c213a735333c1551e8b494b2795a87f80eceadb78"
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
