class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.74.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.74.0/dots_v0.74.0_darwin_arm64", using: :nounzip
      sha256 "3e416d62e8a66c106d96bcbd29b23d5926b34ae47982cafb1cabf68beeb1c5a1"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.74.0/dots_v0.74.0_darwin_amd64", using: :nounzip
      sha256 "af59960e0f05991ac8d8f0480a22b54f0bf9288a4b8b030bebf420df571fe88f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.74.0/dots_v0.74.0_linux_arm64", using: :nounzip
      sha256 "d6ed1aeed720762eddbf3e3d2b9a1180d543b07a621ac193d72fa26ab7c2bea5"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.74.0/dots_v0.74.0_linux_amd64", using: :nounzip
      sha256 "c14f712ea8cab048d70d29c372652b9e7fd2f5400752d57646fa3ac86f1f83c2"
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
