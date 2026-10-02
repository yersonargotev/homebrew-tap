class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.26/packy_v0.2.26_darwin_arm64.tar.gz"
      sha256 "b392b994a0775c7d53100e02886013ab10959b40d1ac39620e05c8d7bd941402"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.26/packy_v0.2.26_darwin_amd64.tar.gz"
      sha256 "f58da53b2ae08f56a89b1d2fa65cb6484dfc48b3129a2fe324359382b0899001"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.26/packy_v0.2.26_linux_arm64.tar.gz"
      sha256 "bf66bb66c24f4494b34dddb3729ea30704ac8c03032e5db45e07c620f86c5790"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.26/packy_v0.2.26_linux_amd64.tar.gz"
      sha256 "8a0a967ed5ada793e0707fb4c07aec6ba8f39476a2dc00eb54ea0625636c2b7e"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
