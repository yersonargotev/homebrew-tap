class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.66.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.66.1/dots_v0.66.1_darwin_arm64", using: :nounzip
      sha256 "ba5c87c79e7a7cc5eeb71cd1764cb941f796eba79e4887d23783fbe6522e76a3"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.66.1/dots_v0.66.1_darwin_amd64", using: :nounzip
      sha256 "809d69dccd66c4d9a602068fb81d7a0cfe3b6e9f6cec8e1de67e86288104befb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.66.1/dots_v0.66.1_linux_arm64", using: :nounzip
      sha256 "61ff7bfdadcb940fe94973fbb8d69ee6ae278bd01206229f5f739cdbc65ac7fb"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.66.1/dots_v0.66.1_linux_amd64", using: :nounzip
      sha256 "743fb322783c15dcd948e54167acd826b6e271df7012b4ad5ff4e0204e820fdd"
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
