class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.1/packy_v0.2.1_darwin_arm64.tar.gz"
      sha256 "44f8edd3d2b9e240f9a7211fd71ebc94022676841a4f2a3cae544c434f224a68"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.1/packy_v0.2.1_darwin_amd64.tar.gz"
      sha256 "96321b69cbd65232282ec96dbe188e01cbc4946be35065a9858a484c28ad9fc1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.1/packy_v0.2.1_linux_arm64.tar.gz"
      sha256 "342530d72d496f1d7f707ef0444bd47835b891cd20d7d834bdcd9b5d6af27d4f"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.1/packy_v0.2.1_linux_amd64.tar.gz"
      sha256 "c5d312f40a632fc13ca5f71462711a5072e88bb183ba4ea1d86efd7cd5353386"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
