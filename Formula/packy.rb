class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.21"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.21/packy_v0.2.21_darwin_arm64.tar.gz"
      sha256 "fcbe1c8c5c2d57b4a8260f604626d4c5640c0481773efb555364450c60979b8a"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.21/packy_v0.2.21_darwin_amd64.tar.gz"
      sha256 "8fb982de47d842e9f5e2c7538aa61923133c05a46566ab05ce2cf328f8acfd6c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.21/packy_v0.2.21_linux_arm64.tar.gz"
      sha256 "01555b140eed86089890caf09e0d292f2dc13a42fd4c4090ee11b78a63be3777"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.21/packy_v0.2.21_linux_amd64.tar.gz"
      sha256 "3b42afc8e7ca6c4435e7d064d9f8fab22adfe9308c3acb5d7c464ee37d494c8b"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
