class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.3.0/dots_v0.3.0_darwin_arm64", using: :nounzip
      sha256 "c5f079ee82b8cc08622cc3a46a6a358de404d8127f98825c8dc5c876ae81be48"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.3.0/dots_v0.3.0_darwin_amd64", using: :nounzip
      sha256 "c8cb8b64650a1332822d9846c709eb6b3e5d250f293e5c2b05daf0ab04071d62"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.3.0/dots_v0.3.0_linux_arm64", using: :nounzip
      sha256 "63e183c5f94d83e3baa1d2b25bd52b90aa8f09dae6a3a24624f77956dc16bd6a"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.3.0/dots_v0.3.0_linux_amd64", using: :nounzip
      sha256 "9c373d14ee8c62522a174c8e90e0d08c6280689f5a8d40218ede621df2d46d10"
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
    system "#{bin}/dots", "--help"
  end
end
