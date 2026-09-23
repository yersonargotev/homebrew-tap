class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.84.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.84.1/dots_v0.84.1_darwin_arm64", using: :nounzip
      sha256 "9d2c91a052c0c230054b4ddc47700d0138f25a99a38d7a423d39a30a2afd1371"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.84.1/dots_v0.84.1_darwin_amd64", using: :nounzip
      sha256 "35460b8ca87d3b8def98bc2ca6a5b1520853b0447d11468ec34ee05f70cd2f02"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.84.1/dots_v0.84.1_linux_arm64", using: :nounzip
      sha256 "a6213598a7a4f40b7aff3065b6a844b1c23ae828af234319448cd54b93689737"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.84.1/dots_v0.84.1_linux_amd64", using: :nounzip
      sha256 "1b4b4935cea19848950c94cf4fbcf3484f8b12e7adea1478805357e43f0d7b47"
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
