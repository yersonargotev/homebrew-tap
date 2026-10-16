class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.95.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.95.0/dots_v0.95.0_darwin_arm64", using: :nounzip
      sha256 "f57be175c63b8b379d02d22469622aa1370c2cfc25a9a64bd73ff4b23e028546"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.95.0/dots_v0.95.0_darwin_amd64", using: :nounzip
      sha256 "f9d78a531af4fc0b243a65d94a337ea3b7ac1441d183eb5d3749aff5bdf7a00c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.95.0/dots_v0.95.0_linux_arm64", using: :nounzip
      sha256 "5299854ef75ed8bfaff670dc30ce87989ec8e9007aa20ac5b1556d5353094b0e"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.95.0/dots_v0.95.0_linux_amd64", using: :nounzip
      sha256 "8cc3983ec9750c906fed1fae124c19bd3106f8d2822564ffd500408a5f51b6f6"
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
