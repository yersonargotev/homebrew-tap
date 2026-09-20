class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.83.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.83.0/dots_v0.83.0_darwin_arm64", using: :nounzip
      sha256 "2f903a7b60973271f5736252b560d3ba20e130dd13cdddb73c9dc152b595ab01"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.83.0/dots_v0.83.0_darwin_amd64", using: :nounzip
      sha256 "37c2409fb4614fb9d3a25b020ca4b6fd0c3e83fba4aeda7aa2fb47cea00e88d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.83.0/dots_v0.83.0_linux_arm64", using: :nounzip
      sha256 "1363a3747ae8f2f4f6351b4672d2f06ad546c55bb0cdfe405a3f1d3c4f0a458c"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.83.0/dots_v0.83.0_linux_amd64", using: :nounzip
      sha256 "52b33cd3e71e536e790a43dbb48f4db39133d1181ed688328a2de142750778eb"
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
