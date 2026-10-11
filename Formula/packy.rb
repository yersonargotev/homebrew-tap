class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.27"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.27/packy_v0.2.27_darwin_arm64.tar.gz"
      sha256 "b777a4c9d520e5edf424cfd3db68411e2ea087b2107bfcef750e9fa4aeec898b"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.27/packy_v0.2.27_darwin_amd64.tar.gz"
      sha256 "a848ea20e3a2edfe091623483d056c99fbe1f6aefc9f5c138ecf0e8444409889"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.27/packy_v0.2.27_linux_arm64.tar.gz"
      sha256 "2c02758cc3120207738eb4ed84a11bc161cc7cbd1aea4e707c86ed66ff32902f"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.27/packy_v0.2.27_linux_amd64.tar.gz"
      sha256 "14e6db2dd5a7872c8aaadc45efa2f760b1fd766772c9d25a2d468c7374098c47"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
