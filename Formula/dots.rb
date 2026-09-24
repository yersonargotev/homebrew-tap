class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.85.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.85.0/dots_v0.85.0_darwin_arm64", using: :nounzip
      sha256 "03c4d045de06806b87a8362e4c8ea16a3b227de1203f6b7bb3c2682cdbcb773e"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.85.0/dots_v0.85.0_darwin_amd64", using: :nounzip
      sha256 "e99ce0407e1eea2c51dc748008dc5b653f51e474c86cdde5086544711f89971d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.85.0/dots_v0.85.0_linux_arm64", using: :nounzip
      sha256 "ba8a4911108b61eeff9d1c195e1759a035bbfaa5ee962009c64a1377b6f53f79"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.85.0/dots_v0.85.0_linux_amd64", using: :nounzip
      sha256 "9dc7f87c3ebda390eb2341fabdbef663a1a8cd4ec23e457fdb9fa3018ff9c900"
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
