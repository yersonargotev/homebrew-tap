class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.18/packy_v0.2.18_darwin_arm64.tar.gz"
      sha256 "6c76942308a388633e7bffc9a6f31b59849207c483ead82abb5f0c31a9d01cf6"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.18/packy_v0.2.18_darwin_amd64.tar.gz"
      sha256 "dda4adc2c1924392d515d37f2966d4a92d3341250c3c0553a5f2a4f8820ef6b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.18/packy_v0.2.18_linux_arm64.tar.gz"
      sha256 "602e236ad013be128e71f6812b2c94e3beca8b9e88960eafce6bf6d5d4d5ce05"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.18/packy_v0.2.18_linux_amd64.tar.gz"
      sha256 "34c7a764c8c85d9843a88fb1c521d1a97c20774c95b7df41d32851c7f1834eec"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
