class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.23/packy_v0.2.23_darwin_arm64.tar.gz"
      sha256 "8e57a6a50a208b3f7d9d46cf227d0245c3f623f5dcac2d95bc13eea4a27e5f9f"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.23/packy_v0.2.23_darwin_amd64.tar.gz"
      sha256 "ef670fa81ed561079a80ffef4eece84109d0f85545d066531bb70d82c9bc94d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.23/packy_v0.2.23_linux_arm64.tar.gz"
      sha256 "921925333ebbc462ac00505397f6d04dcae7a7bb278b47b83e69be50c8d2204b"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.23/packy_v0.2.23_linux_amd64.tar.gz"
      sha256 "00e9ec398b6d5b8b305a6ea7c9103245cc5b40bf68723736f41ce96c8020cc12"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
