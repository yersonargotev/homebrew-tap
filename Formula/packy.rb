class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.37"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.37/packy_v0.2.37_darwin_arm64.tar.gz"
      sha256 "bba973b664b84f8ffe100846728dcc4313c757739f8f3d74bddb21efdedcff26"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.37/packy_v0.2.37_darwin_amd64.tar.gz"
      sha256 "ce00173393ff9ebbe4d86e39600315046fa49b2c366db17c8381dc9eaf9abece"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.37/packy_v0.2.37_linux_arm64.tar.gz"
      sha256 "3153e10f2ff36dc9ba5455ea4a796a43deda7d908f83f9057275a3d2751fc42a"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.37/packy_v0.2.37_linux_amd64.tar.gz"
      sha256 "44a34ede0f5154e94c5ec3bc0b04806b3b7f21ccfa1670df5fd48e7d45c3d67a"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
