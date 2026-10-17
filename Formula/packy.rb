class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.29"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.29/packy_v0.2.29_darwin_arm64.tar.gz"
      sha256 "f1254e83cf01a10373b02f9ca57471e78821880c2af094796380adf9f6cd4d95"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.29/packy_v0.2.29_darwin_amd64.tar.gz"
      sha256 "1ddd501368f1296e5acbacb4f5972d20d91f03582548dec2a66d36c67ed89748"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.29/packy_v0.2.29_linux_arm64.tar.gz"
      sha256 "5d121f867e3c04062cc3fdb7b20b13fefb4596745f1016c0bc935b05d3344c5d"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.29/packy_v0.2.29_linux_amd64.tar.gz"
      sha256 "6e41b87a188d23db1b4f5ebaa47c6531bbc527db7e9cd1e75d6220ebe016cbf2"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
