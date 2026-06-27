class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.30.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.30.0/dots_v0.30.0_darwin_arm64", using: :nounzip
      sha256 "eb0b81f3476b04843532b03dc06bdc244348cd79047742f49d348b510f0ed7ed"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.30.0/dots_v0.30.0_darwin_amd64", using: :nounzip
      sha256 "7b08b9a9715e245ba2634dd8818def4b227c73ebe95c0c71dd013c2fd74f93b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.30.0/dots_v0.30.0_linux_arm64", using: :nounzip
      sha256 "0cca7ff8997213c6e7b00d6d0b1134fe4713b6b5061c9a4558159ef3b7f0ddd1"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.30.0/dots_v0.30.0_linux_amd64", using: :nounzip
      sha256 "8bec9fada505f0669e3924570c755dd056333a89bdb977631805c4a633bcb2e1"
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
