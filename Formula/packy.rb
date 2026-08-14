class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.16/packy_v0.2.16_darwin_arm64.tar.gz"
      sha256 "c53f03ef27bb579cc3bc189cc65adaf777bf8825b721e01c47d7d8a4a3780f07"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.16/packy_v0.2.16_darwin_amd64.tar.gz"
      sha256 "49d89f154c0f6a29b56e4f7ce067fd339c2cc0300c0e7430027d4cca7a108f60"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.16/packy_v0.2.16_linux_arm64.tar.gz"
      sha256 "7c668150ae219c3ceb46f701c9250008cc644b33958e9e40e0739a0fbf5a0e0f"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.16/packy_v0.2.16_linux_amd64.tar.gz"
      sha256 "e271805f171c28faeedae48c2b6749750ee663035d5d3a8bd7983e94ed15be21"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
