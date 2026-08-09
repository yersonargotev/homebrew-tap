class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.69.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.69.0/dots_v0.69.0_darwin_arm64", using: :nounzip
      sha256 "9d3e71655676c2f8ae473e86064566561eb14b1e00be5de35cd0332f8230a461"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.69.0/dots_v0.69.0_darwin_amd64", using: :nounzip
      sha256 "78cacfd6e3ff8c4a8d5799c7e73736319f40ac4f1d7f1e8ac30f60ae334d6a71"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.69.0/dots_v0.69.0_linux_arm64", using: :nounzip
      sha256 "07e9560ba2218811825c637b4dd708b22c615216c82799c69b4dd80f8ccd4458"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.69.0/dots_v0.69.0_linux_amd64", using: :nounzip
      sha256 "241bbea4f1b4f9bb1a6af58df36cdf10302b4bf1e71c30c0e5d245b5cb23ccc3"
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
