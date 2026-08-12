class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.75.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.75.0/dots_v0.75.0_darwin_arm64", using: :nounzip
      sha256 "9561b5777c8e84f100e7ea59793e8374debdfb1bbf51b10f60ba5e33dfac3c83"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.75.0/dots_v0.75.0_darwin_amd64", using: :nounzip
      sha256 "66431dc1d0d5aeea2abebc898b3e10469115ca91a835c2441d89cb42ab6ea59f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.75.0/dots_v0.75.0_linux_arm64", using: :nounzip
      sha256 "6037c84e9f03a0b07f6716585ad970aeef4e332a2c135303b00a251f0a54d774"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.75.0/dots_v0.75.0_linux_amd64", using: :nounzip
      sha256 "5ca10022ff1699b0cb6a524579c6791c9146e33cad9916040d8c0b6301da165e"
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
