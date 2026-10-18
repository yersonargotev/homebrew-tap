class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.30"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.30/packy_v0.2.30_darwin_arm64.tar.gz"
      sha256 "b04e65c4b9806cd00dc26ce23f700a9f65053567cb46a161c655281e46e620be"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.30/packy_v0.2.30_darwin_amd64.tar.gz"
      sha256 "d50f3563cf492a4e6b7287afc81c232056694ae1e39b2c1b747ece5c30fafe51"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.30/packy_v0.2.30_linux_arm64.tar.gz"
      sha256 "9cae3a208153dbaddf1ef68e296ed97d6e9ef4d9d4aafd33dc9c3a87abfe3326"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.30/packy_v0.2.30_linux_amd64.tar.gz"
      sha256 "c03c449577385a9ef762ed38e6901332159cef3123fb0c513062fd11b54e8a33"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
