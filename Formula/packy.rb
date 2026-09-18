class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.24"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.24/packy_v0.2.24_darwin_arm64.tar.gz"
      sha256 "5c54034d78f34aa712c5471ce2217f2e557b62fc5d1f7e88889ab99e875dc8ca"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.24/packy_v0.2.24_darwin_amd64.tar.gz"
      sha256 "b924b03cf79cad3cf513f251a081496651934e14acf17ff51de6c1987e3011d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.24/packy_v0.2.24_linux_arm64.tar.gz"
      sha256 "83ec5914eb4fc9feaad1f3af57876a8e3a72413d978a13e8a0cc11e47fae77de"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.24/packy_v0.2.24_linux_amd64.tar.gz"
      sha256 "208252f1dd8ea7273a3ab0d00ad56a4b1d2301ac52d1133425d86bd4bd489f2e"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
