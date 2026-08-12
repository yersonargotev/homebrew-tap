class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.73.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.73.0/dots_v0.73.0_darwin_arm64", using: :nounzip
      sha256 "199a41937edc490668c4c23dec9658d7f66b1248991492016524902670ca3ec5"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.73.0/dots_v0.73.0_darwin_amd64", using: :nounzip
      sha256 "9fc85b3776de5a0b23643fc310842ecac3061f088f6b3dbbd82834b482e29e1b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.73.0/dots_v0.73.0_linux_arm64", using: :nounzip
      sha256 "e6595ed0cf29ef3f9f64eb20313bc46445a09170c33ba4dd43fc47df18fbae8f"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.73.0/dots_v0.73.0_linux_amd64", using: :nounzip
      sha256 "2543587035fc1e43b5f82c1efc90da2fe989c4acbac66d3ec3ccfeaae8d4c07c"
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
