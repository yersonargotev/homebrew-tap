class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.55.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.55.0/dots_v0.55.0_darwin_arm64", using: :nounzip
      sha256 "b1b6dd0da14b4313549bf74e0aaae74dbc8cb4a58c36ecc47a0519e838c6445a"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.55.0/dots_v0.55.0_darwin_amd64", using: :nounzip
      sha256 "68445538fba65679ddf7b0d698dec8195bd5a42b751fe423118b6cee9ec1ebb3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.55.0/dots_v0.55.0_linux_arm64", using: :nounzip
      sha256 "19075d23aefa2feabbfbcadbff364f3b0b9210379099346d47b21cfd25a6ad9e"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.55.0/dots_v0.55.0_linux_amd64", using: :nounzip
      sha256 "e1cca3114974f3a58e45b9702b729d102de6956481613c7660d2b5fcd6d88827"
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
