class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.7.0/dots_v0.7.0_darwin_arm64", using: :nounzip
      sha256 "a7c911ae7e06b3c74f6e99bcdb41e3989af54326632aa9e95fb35938ae141c06"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.7.0/dots_v0.7.0_darwin_amd64", using: :nounzip
      sha256 "5b721773d76375c2999de321c97b350e9778cd45edee928d47c5b5f88c21800f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.7.0/dots_v0.7.0_linux_arm64", using: :nounzip
      sha256 "a31c4b3636af4324f9433daef4a784f71a7a5c3cc69fd6e9b53acd090160986e"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.7.0/dots_v0.7.0_linux_amd64", using: :nounzip
      sha256 "1e5eadb1db3d4f413572ab63c9fc7c93a2c4ea0136e4d62cb9f326772551fc2f"
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
