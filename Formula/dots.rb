class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.12.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.12.0/dots_v0.12.0_darwin_arm64", using: :nounzip
      sha256 "29a526841a4ad1716edf12619a5ff45678e1cb913d8b1fdb111b15a3e3539cea"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.12.0/dots_v0.12.0_darwin_amd64", using: :nounzip
      sha256 "aa5fa8e380fabb8138eee3793fe9967d6564df5f5f68cf8b24324e582cc90805"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.12.0/dots_v0.12.0_linux_arm64", using: :nounzip
      sha256 "0bd1d698e7dc7ce58ed24eb1feaa096825e7303033b328ec53f108ff375e7060"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.12.0/dots_v0.12.0_linux_amd64", using: :nounzip
      sha256 "c129015a36f5207dba7bd59a6b16d143d1cf2116f4a8948afbb16b551e94d5c6"
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
