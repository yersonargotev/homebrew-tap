class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.65.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.65.1/dots_v0.65.1_darwin_arm64", using: :nounzip
      sha256 "b93e350cdae7cfcd7d9e1f128fb08754bb19b1ae4023f7cdabc5a25383a0d7de"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.65.1/dots_v0.65.1_darwin_amd64", using: :nounzip
      sha256 "1b6105ea2e58d4dc97da79c1b0f78273feabee467f643918bfaf1016df3b08de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.65.1/dots_v0.65.1_linux_arm64", using: :nounzip
      sha256 "1f1fd06751c7a803bb25995349c995648674c2b620e3c2791699cf36a3fdaa52"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.65.1/dots_v0.65.1_linux_amd64", using: :nounzip
      sha256 "4a5697dccb5264ed66d451a721b35a277ae5180800610327766803c191e560ba"
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
