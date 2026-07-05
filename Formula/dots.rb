class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.52.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.52.0/dots_v0.52.0_darwin_arm64", using: :nounzip
      sha256 "d4dcb8a6a77ce90b65b8bb3bd0f3c0f96cb03d5f811dddc732801af76d837884"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.52.0/dots_v0.52.0_darwin_amd64", using: :nounzip
      sha256 "632630fcee0e32a7b2510e88982c5ea71ad891e9c7fc4fcc0424db8d4a2e271e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.52.0/dots_v0.52.0_linux_arm64", using: :nounzip
      sha256 "7c15260b942935e12999cb67fcc062935dc107aa70eda0c0f1c03e3d16d49d5e"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.52.0/dots_v0.52.0_linux_amd64", using: :nounzip
      sha256 "73f6d386b167c646260587ffcabbacdca1d97c9fbb3425178106998ea5cc1aff"
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
