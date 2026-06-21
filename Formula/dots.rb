class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.15.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.15.0/dots_v0.15.0_darwin_arm64", using: :nounzip
      sha256 "d26e42c6abfabb8937de02241d4568be0a0d29c63e26f55355c98b3a0219bbe6"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.15.0/dots_v0.15.0_darwin_amd64", using: :nounzip
      sha256 "e11f3dc4b7edfb2a0228f43939f55339f00235310eccc8b9674e7cb9e0581c30"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.15.0/dots_v0.15.0_linux_arm64", using: :nounzip
      sha256 "8921c664719337b3ea040a4735c1e2eb0a7b0f19ccd01be46258d40c86fcac64"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.15.0/dots_v0.15.0_linux_amd64", using: :nounzip
      sha256 "9f2ea576b2aa5b09ecd67980ef2150768ad351e7608d2e82eac0ef3b1b8d593c"
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
