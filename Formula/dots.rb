class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.49.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.49.2/dots_v0.49.2_darwin_arm64", using: :nounzip
      sha256 "78e893ef31acf87a21d18672a8b56c5ffebc2d8d0789deeea2e19c6ff9c08919"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.49.2/dots_v0.49.2_darwin_amd64", using: :nounzip
      sha256 "09be1d30d80c252f0fba40805a3ae2a4b7b3ac402a287c94ba0a7bfe7bac0282"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.49.2/dots_v0.49.2_linux_arm64", using: :nounzip
      sha256 "3155aa9251dc6feeb23070e845070d507b57b5f4693c8b010ea992f342ba14a8"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.49.2/dots_v0.49.2_linux_amd64", using: :nounzip
      sha256 "6d84445d54e6ad23273025805baf1932aefb196c6ae41e76df69cd44fb339aaa"
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
