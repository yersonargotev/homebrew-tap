class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.2/packy_v0.2.2_darwin_arm64.tar.gz"
      sha256 "567579f1a3c8d13b6cd3428f2cd3e7ec6fb249b2b74ec42cb27f4f15b69b3a89"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.2/packy_v0.2.2_darwin_amd64.tar.gz"
      sha256 "09559c42b9abb003ce10791aa54253ba644d6e9996861a64b1db8d7a789ddc77"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.2/packy_v0.2.2_linux_arm64.tar.gz"
      sha256 "edd78b0d4a111a29a8e923140338ee4124fbecd1af7b401e9f284284560e3d97"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.2/packy_v0.2.2_linux_amd64.tar.gz"
      sha256 "bfbb877b4647b94faa79ad9a1fe206be7958889b0fb5afea158854fa317663df"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
