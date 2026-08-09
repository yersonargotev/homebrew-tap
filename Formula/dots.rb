class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.68.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.68.0/dots_v0.68.0_darwin_arm64", using: :nounzip
      sha256 "f8b8ada515fb1942fe91b65804986af6597d8cefc47a93b267f94fc2370049e3"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.68.0/dots_v0.68.0_darwin_amd64", using: :nounzip
      sha256 "9f2893dc072b85bacb986109aa38a5ee211c6c786f96834c8e95181038fb161e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.68.0/dots_v0.68.0_linux_arm64", using: :nounzip
      sha256 "ba7b79713e6f48ff2fdfc3bad51b6ed322a545df42d5839563c86596f9be12a8"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.68.0/dots_v0.68.0_linux_amd64", using: :nounzip
      sha256 "3c64b710a2c1e27b087ec89731c83e3c8b37d910d7358db01e03ed7b9f3f0b3c"
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
