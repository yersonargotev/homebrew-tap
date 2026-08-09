class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.4/packy_v0.2.4_darwin_arm64.tar.gz"
      sha256 "e359ba99e2351c191fdb5ba2c86e374e94b29fa1448f876f4d04bce107cda973"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.4/packy_v0.2.4_darwin_amd64.tar.gz"
      sha256 "d862868c8cb20129fc628fb4465bff226deeebb42bf18034ce13a8f2f289df9a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.4/packy_v0.2.4_linux_arm64.tar.gz"
      sha256 "385f377120c4267f386309e26702e0aab9c2bcaf3069f71760d77637093a7913"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.4/packy_v0.2.4_linux_amd64.tar.gz"
      sha256 "7f125447dde12d49f5d56ab3974df88e9326198e47da9ebaecb2be0feaa84ff4"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
