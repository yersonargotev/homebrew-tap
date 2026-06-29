class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.44.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.44.0/dots_v0.44.0_darwin_arm64", using: :nounzip
      sha256 "c26eec9788670571378040f73465e271a201a0c1437c8794c5e993edeb0b10de"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.44.0/dots_v0.44.0_darwin_amd64", using: :nounzip
      sha256 "da2ebb7f494225995b879c60d6917e9193bf67eb6831028fad7b79f64b2f61a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.44.0/dots_v0.44.0_linux_arm64", using: :nounzip
      sha256 "4dde5b7d78215cceec5c618ea5119331bb98b7f4bf6ec16d8512ff837bd48440"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.44.0/dots_v0.44.0_linux_amd64", using: :nounzip
      sha256 "b4cda553b5e228f1991e907ed81c850d8ae5e5b3359701457ce8958ca2a524f3"
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
