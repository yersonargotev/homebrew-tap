class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.14/packy_v0.2.14_darwin_arm64.tar.gz"
      sha256 "69221db17ebbc269c1058e56c1074433613a7db88dc6506afc155c11be5000e9"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.14/packy_v0.2.14_darwin_amd64.tar.gz"
      sha256 "975829b97ce15c9a2858d058ed9956565a2b052f04828a3d36b7ae815dc597f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.14/packy_v0.2.14_linux_arm64.tar.gz"
      sha256 "daa8947bbcec4ebda209a48f3377c84f7b0454a95e8e7d21a98a204a3de757d2"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.14/packy_v0.2.14_linux_amd64.tar.gz"
      sha256 "11af3fda34b98a53b8ce00b8438a1c8c2cf741862b7a74a55a713bec63b1d47b"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
