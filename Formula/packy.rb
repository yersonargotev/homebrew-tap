class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.13/packy_v0.2.13_darwin_arm64.tar.gz"
      sha256 "efb7c0dca83dfbca2217a24998d95fd62eae22094b19ce9f6aaa3cd0691fd8b9"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.13/packy_v0.2.13_darwin_amd64.tar.gz"
      sha256 "9a94a0a1c3a093e8bfa56d5417f9919804729ccdc75d3c16a502f1eb6bde98d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.13/packy_v0.2.13_linux_arm64.tar.gz"
      sha256 "30ddcd3e0c01c7d980acd2cc1fbf40c54479252695ffa3e0d7790e5c84886ab6"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.13/packy_v0.2.13_linux_amd64.tar.gz"
      sha256 "ac73c7038617c6a905045cee213a72ba65a275cc09cfe8e07affbc3f20241c17"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
