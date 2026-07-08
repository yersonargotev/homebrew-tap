class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.57.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.57.0/dots_v0.57.0_darwin_arm64", using: :nounzip
      sha256 "7efeddb60ab4e1a05784de1bee8f08de037cc0a8ae1a20d709439c176f776f5e"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.57.0/dots_v0.57.0_darwin_amd64", using: :nounzip
      sha256 "56f33816ad50d33a80dea04d0b714fa73d500961f25bd7692dc9b04b3566f956"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.57.0/dots_v0.57.0_linux_arm64", using: :nounzip
      sha256 "68135825ec8b753f191fd16d7ee95e8b1242dac9f5623471c92a7b845ae126a6"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.57.0/dots_v0.57.0_linux_amd64", using: :nounzip
      sha256 "a944c16ebd98fb7011a3ceb6f8f0f432b9c8d6060f5c50c8d2acc9d7e714a41e"
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
