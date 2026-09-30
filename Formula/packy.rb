class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.25"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.25/packy_v0.2.25_darwin_arm64.tar.gz"
      sha256 "c026e75db908a7c1d0330aa47f75631ee11018a60cedebf837cbff0a19ea4065"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.25/packy_v0.2.25_darwin_amd64.tar.gz"
      sha256 "4d8fcc37aadb71a970dad9cff144683d8f87c811abf9de3a8eda41f4b738b6f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.25/packy_v0.2.25_linux_arm64.tar.gz"
      sha256 "70aea141f4b985f1ad30680f6d24e77ed40658a20f8da627bc86c860e2549ad2"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.25/packy_v0.2.25_linux_amd64.tar.gz"
      sha256 "b5ce3c60f212cf5f644c81eb6bb83648c2c0827db02ff5173b4a4bf2ab6ed787"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
