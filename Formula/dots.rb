class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.61.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.61.0/dots_v0.61.0_darwin_arm64", using: :nounzip
      sha256 "83eacc2422ee6b113ca99ab28a4a66fcbf8371ff08e5313cf70761179e548f78"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.61.0/dots_v0.61.0_darwin_amd64", using: :nounzip
      sha256 "13ecdcc0a282ac48c5422d392f471abf9586d0854fb3a946a5e498a30b7e049a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.61.0/dots_v0.61.0_linux_arm64", using: :nounzip
      sha256 "2a48867794d467444bb9fa057bc5d471d332a68ff03a323f912a5a46506dcc63"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.61.0/dots_v0.61.0_linux_amd64", using: :nounzip
      sha256 "90b732cebbbedf2ff593bdeb241dac8b19b905c4be9b3a67f8722aa25f52f2d9"
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
