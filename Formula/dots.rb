class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.74.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.74.1/dots_v0.74.1_darwin_arm64", using: :nounzip
      sha256 "bed1c17ea98c68c732792462dca2ee29c539da2f71f8b082ef0d6b890af66c2f"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.74.1/dots_v0.74.1_darwin_amd64", using: :nounzip
      sha256 "d5fcf04f335da24d67ce609927201c2c49359bd2cce54a14368386d25182e4f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.74.1/dots_v0.74.1_linux_arm64", using: :nounzip
      sha256 "22275b56b4c86ea5d15e356e73bfd27a74f50ba03df8d27a252520c87060ab00"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.74.1/dots_v0.74.1_linux_amd64", using: :nounzip
      sha256 "8bf0df14e5f0f4f381a61d363e5c17c59bd0cb260b59a1d0cec10420ff18aa5d"
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
