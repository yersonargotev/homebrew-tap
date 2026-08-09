class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.5/packy_v0.2.5_darwin_arm64.tar.gz"
      sha256 "223071b177abcc0a3c863b7ebd800081501bc535a6dc1556110e39bf0d60748d"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.5/packy_v0.2.5_darwin_amd64.tar.gz"
      sha256 "f77b0aef25298d01d585fdf29caf10bd73de3f19054d71ab35dfdefb93b9a2ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.5/packy_v0.2.5_linux_arm64.tar.gz"
      sha256 "05e9474035f1cc77799197caf7a60a4a25ecb65cd750c054c4dd64a00ebd127b"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.5/packy_v0.2.5_linux_amd64.tar.gz"
      sha256 "00cba23564f0960e654674a2d358dd1753859c37bd24ac34c8d1e4da2bb5e035"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
