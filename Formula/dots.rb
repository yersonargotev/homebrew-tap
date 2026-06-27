class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.23.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.23.1/dots_v0.23.1_darwin_arm64", using: :nounzip
      sha256 "87932c5d4ee746094cad302b83292455ad6554db4881c4667870fb3b05735fbc"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.23.1/dots_v0.23.1_darwin_amd64", using: :nounzip
      sha256 "819e15287d82de24bfeba9713daef79d0e00e758d962ad6f7c44e49d5486a49a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.23.1/dots_v0.23.1_linux_arm64", using: :nounzip
      sha256 "998a36754f9033b3eee04c27b5c361965872801fb8dcac756de077a253e6bded"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.23.1/dots_v0.23.1_linux_amd64", using: :nounzip
      sha256 "7b282af1148a7b1a5af002cf71bced1d30ae12876a39609197888d75a80650df"
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
