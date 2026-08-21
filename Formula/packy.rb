class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.17/packy_v0.2.17_darwin_arm64.tar.gz"
      sha256 "c114534b1b4524addefdf3bcfc5c6c90049f87099499384171fce775fd141e2f"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.17/packy_v0.2.17_darwin_amd64.tar.gz"
      sha256 "0b08813a262e576f756e77e1608977f5d432845ed3bb59c108365dc98e783d36"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.17/packy_v0.2.17_linux_arm64.tar.gz"
      sha256 "0d1a46659c190552762fbc5850fff3582bf8f0dcb42829e969321545e55c9520"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.17/packy_v0.2.17_linux_amd64.tar.gz"
      sha256 "d684bb22d7b9f5dcc8f3e72235c51578831697d983ca9f099cfaf511831e01ed"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
