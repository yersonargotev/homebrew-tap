class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.31"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.31/packy_v0.2.31_darwin_arm64.tar.gz"
      sha256 "2f1946ff545e8c5b71ecdd005d6c500b6c514721d1f52b52c723a262ec9f351b"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.31/packy_v0.2.31_darwin_amd64.tar.gz"
      sha256 "b9a3999e49cda98715205470d33feafefe3549ebde0b92bed92a6bbc32506fe9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.31/packy_v0.2.31_linux_arm64.tar.gz"
      sha256 "40df4eeedd17b5b9c4a39a60090902a78837869e47471eb2596aee43bdac6530"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.31/packy_v0.2.31_linux_amd64.tar.gz"
      sha256 "9128a6e3688fbae992c69b334c3d34b9e8c3274515dee57b8d711c4106bbcfa3"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
