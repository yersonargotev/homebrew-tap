class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.33.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.33.0/dots_v0.33.0_darwin_arm64", using: :nounzip
      sha256 "60fce80397c747852abff03ee46c4e5fa19cc113af5b6272be781337d6821996"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.33.0/dots_v0.33.0_darwin_amd64", using: :nounzip
      sha256 "0e2aad294b86cfc69a3ad9f0b1ae0ca2ab193b9f88dcbc738914ca4bf82a1ae9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.33.0/dots_v0.33.0_linux_arm64", using: :nounzip
      sha256 "15bf12e668370d741e31fb8dda4532d7d2f0d1564957b1dcdba8e861fbbb9e16"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.33.0/dots_v0.33.0_linux_amd64", using: :nounzip
      sha256 "ea83be9f5f4dd76dc3b8f51c319c10233017021281d6b3f4911837f60396bab4"
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
