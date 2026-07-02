class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.48.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.48.1/dots_v0.48.1_darwin_arm64", using: :nounzip
      sha256 "d090640136628a00ac033ecf309e8f39c772b55bce2f00c93640f97f8a8b1e48"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.48.1/dots_v0.48.1_darwin_amd64", using: :nounzip
      sha256 "7c746638b43d615bbcb71aabef210328c3fe56b983b07e62d2d5875aca7d14d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.48.1/dots_v0.48.1_linux_arm64", using: :nounzip
      sha256 "95de53c303e47e1a0805f5a7e0c83d6b715dfab53fcea5818ad58b08fed53911"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.48.1/dots_v0.48.1_linux_amd64", using: :nounzip
      sha256 "eeed896ae158938f0826c28c411eb8214f2c5b703c2343aeeffc2b98787c4f50"
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
