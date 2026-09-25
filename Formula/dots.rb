class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.87.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.87.0/dots_v0.87.0_darwin_arm64", using: :nounzip
      sha256 "42c8b04e717edb89a1152e3c40dd65f961d41cedd20228fd651a78b4cdc7b8de"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.87.0/dots_v0.87.0_darwin_amd64", using: :nounzip
      sha256 "32c170f9c0aaf962629ea5261bfd96ce8792116bfe0832f3225b502bd5784f16"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.87.0/dots_v0.87.0_linux_arm64", using: :nounzip
      sha256 "70ceb88369af81a7a6be07eceb0c7fa3dfbdcf4bd91479633b8b387655354747"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.87.0/dots_v0.87.0_linux_amd64", using: :nounzip
      sha256 "3f7297e44c32126a79a666176bf46998cd9df65ec4237bdf0fb88291b0c28f7b"
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
