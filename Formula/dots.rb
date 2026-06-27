class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.28.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.28.0/dots_v0.28.0_darwin_arm64", using: :nounzip
      sha256 "6156aca93803da718dfeae3b766aad95855819ab9247f785bf799b76acb38b84"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.28.0/dots_v0.28.0_darwin_amd64", using: :nounzip
      sha256 "a8260963c71fb405bb6a9ff0d733082afb68e3c76cfe47979f40c0a285253514"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.28.0/dots_v0.28.0_linux_arm64", using: :nounzip
      sha256 "c346d10160ecd5153b426d8ece16692e48cb7252e0f92d1cf8970c48e7bec689"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.28.0/dots_v0.28.0_linux_amd64", using: :nounzip
      sha256 "81ff6e67b4e315dd1d3cb6b2f5ef8da6fc30eff32e87544408d19bb3938118dc"
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
