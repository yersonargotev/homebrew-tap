class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.40.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.40.0/dots_v0.40.0_darwin_arm64", using: :nounzip
      sha256 "f7ccd531a0bf63cab25940683ae8c69e2beae4622a4c1393f1653c349cf1e332"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.40.0/dots_v0.40.0_darwin_amd64", using: :nounzip
      sha256 "66c4b322365e16715b3f3912fb8a5e3f8accf01736549d97515113a024a8d12f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.40.0/dots_v0.40.0_linux_arm64", using: :nounzip
      sha256 "ecf22282e19715740e7a3b82259ebdcb382324750458e8be38365456efb1d327"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.40.0/dots_v0.40.0_linux_amd64", using: :nounzip
      sha256 "f56636e526038a6bd64186b6100c9b3433570f512316c76f8932c185e8b19861"
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
