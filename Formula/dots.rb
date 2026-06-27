class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.27.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.27.0/dots_v0.27.0_darwin_arm64", using: :nounzip
      sha256 "0ab2f318f627af8cf638a96966d4a90749b2a807777746547f897cc9e8e1e7de"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.27.0/dots_v0.27.0_darwin_amd64", using: :nounzip
      sha256 "63c2ca0e7b1f4637bd2982af311dcb717e38a15ee72b690686d5c6ce9da45a0d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.27.0/dots_v0.27.0_linux_arm64", using: :nounzip
      sha256 "682a9222801d358bcb219bd61f4a35751c347d4d81aaa3d0f71705f6f28bd0c4"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.27.0/dots_v0.27.0_linux_amd64", using: :nounzip
      sha256 "e56cbe77426f8dad6efdd6e602a64e88d36e1582aa4f5e07b9d5f0c737feafe2"
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
