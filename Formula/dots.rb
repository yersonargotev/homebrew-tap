class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.64.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.64.0/dots_v0.64.0_darwin_arm64", using: :nounzip
      sha256 "71cf19fda401da1cb9afa52f54b40f32da88ffba4e9577733237974eaa87ea06"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.64.0/dots_v0.64.0_darwin_amd64", using: :nounzip
      sha256 "1e6423f87151bc39b1d36d70cd5a7cd098e3ae353879abe362145ada713f5676"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.64.0/dots_v0.64.0_linux_arm64", using: :nounzip
      sha256 "d99b0c23fc0a682a1318f8c502ed95160d9b07fd01b70f94a5422fbe7d86c346"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.64.0/dots_v0.64.0_linux_amd64", using: :nounzip
      sha256 "58f4a01b2689c089d5039532e30a5adb1681d6d3d59fb61c9a170ed36b231847"
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
