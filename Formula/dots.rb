class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.31.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.31.0/dots_v0.31.0_darwin_arm64", using: :nounzip
      sha256 "d2dcf55c4834ae2917f035bd05835d40e37a12722f4627c32a6fa513136f592e"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.31.0/dots_v0.31.0_darwin_amd64", using: :nounzip
      sha256 "3b8833d810d582eb09964e368313eb89657ca267145fe08a1b57e121850e5540"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.31.0/dots_v0.31.0_linux_arm64", using: :nounzip
      sha256 "4b1cf6865eb848fa75f01c55950338674d80ffa4c1e039e071a4ecb0d65bd7d2"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.31.0/dots_v0.31.0_linux_amd64", using: :nounzip
      sha256 "66e357709343f0d4285956bfe0a810fbd0f041a47750288a894a164012b71999"
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
