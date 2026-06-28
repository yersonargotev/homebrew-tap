class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.39.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.39.0/dots_v0.39.0_darwin_arm64", using: :nounzip
      sha256 "f49b2b4671c3defe73c1b542a2a399504a77d3c1336752d0f82e5ede97a83b18"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.39.0/dots_v0.39.0_darwin_amd64", using: :nounzip
      sha256 "752b1d8d794d688d97012e4bc314c22ff165a060c331efb8d3ce63bd0b17a94c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.39.0/dots_v0.39.0_linux_arm64", using: :nounzip
      sha256 "7707312272d01ae615fbbe0c4e449e404e845fe97c2fac72c011c7f510ce52b7"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.39.0/dots_v0.39.0_linux_amd64", using: :nounzip
      sha256 "52b7dca076a45163bcbd631b87d09f097308f52d4e2899ed77a9924716d59acc"
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
