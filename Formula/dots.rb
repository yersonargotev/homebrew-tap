class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.93.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.93.0/dots_v0.93.0_darwin_arm64", using: :nounzip
      sha256 "9ef8d8ba27ca2cc441ae5488ab88c6a3112f3047917d87498ab389e5b9465f05"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.93.0/dots_v0.93.0_darwin_amd64", using: :nounzip
      sha256 "0eef81ce5daea5afd6458da52d930cbb461ee2f2f618a1664b234469d444fa9b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.93.0/dots_v0.93.0_linux_arm64", using: :nounzip
      sha256 "aa5f7928985ca9c9a025fc6308437fd258be2a8484cf85353381980474c9f9cb"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.93.0/dots_v0.93.0_linux_amd64", using: :nounzip
      sha256 "90a9a745b4d894e756716dbe479ee3dc5387c7f85e41924a6569a76fb30f1bda"
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
