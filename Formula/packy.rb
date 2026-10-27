class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.32"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.32/packy_v0.2.32_darwin_arm64.tar.gz"
      sha256 "c477d55df114fb2d9f057f5369c51cd3b806412e1003adce8887d89c60a713fd"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.32/packy_v0.2.32_darwin_amd64.tar.gz"
      sha256 "a4bb4c2cd6760430386958febe772622c3d413b5a7b4164a1ccf5518f30f03f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.32/packy_v0.2.32_linux_arm64.tar.gz"
      sha256 "9d3fe5e61f5f1106b8e40a3137bb8a9c13e3941bb7dae6a21125f7ccb6caedb4"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.32/packy_v0.2.32_linux_amd64.tar.gz"
      sha256 "ad94960087c33d3413552fd66348215dc9d94aa7ec656ed5950df79e15044c3d"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
