class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.24.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.24.3/dots_v0.24.3_darwin_arm64", using: :nounzip
      sha256 "980e0f3abb4d0fd739c419cb7b57f33c945a9ffb6235c2fd8aea32b1934591e4"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.24.3/dots_v0.24.3_darwin_amd64", using: :nounzip
      sha256 "0df0dade6bf4f256149efb5e73adcbcf2ff62929241f0d80bdd7a0dc8f2255bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.24.3/dots_v0.24.3_linux_arm64", using: :nounzip
      sha256 "0721113c9e01196d630d65a99071dbcdbf2a5feef60865fc4aa3afc1c346abd7"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.24.3/dots_v0.24.3_linux_amd64", using: :nounzip
      sha256 "d6ef92b7a7e0289b59cba76a46c344e1754076b255736f4b3316ff65b7c2335b"
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
