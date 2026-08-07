class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.0/packy_v0.2.0_darwin_arm64.tar.gz"
      sha256 "b20f949b3cd22fb7045a030291d54bcd398a588bcabb176fa0c29f9787034032"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.0/packy_v0.2.0_darwin_amd64.tar.gz"
      sha256 "66a32d784b3212a76a5e589c76d751fd241768d01c0899e63860255f876a80ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.0/packy_v0.2.0_linux_arm64.tar.gz"
      sha256 "0ed2e9325792e9b13c2c9eb95e8f33003596f381b2802a3f66c6f9fc661e5bd1"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.0/packy_v0.2.0_linux_amd64.tar.gz"
      sha256 "64d1d5ca3385ab931ec67088146bda8804c0169da6968542c3e0e0ac152fa895"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
