class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.78.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.78.1/dots_v0.78.1_darwin_arm64", using: :nounzip
      sha256 "073ed9e531c67f1f44707b0af3ed7712083e48e7ea06ca4cb8b5de1793a465ed"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.78.1/dots_v0.78.1_darwin_amd64", using: :nounzip
      sha256 "73b72462f611a52464fcae60534b7dee473abd49d880b04c353dd641c91b75aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.78.1/dots_v0.78.1_linux_arm64", using: :nounzip
      sha256 "2cd08145b89a1d08b0875724156723b0ab27c8061f3a72c265e7ba320d321587"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.78.1/dots_v0.78.1_linux_amd64", using: :nounzip
      sha256 "7ccf025e0b109fbec162b1d290dcb2dd198ecc369b0d8dadb298ef047f87498f"
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
