class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.28"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.28/packy_v0.2.28_darwin_arm64.tar.gz"
      sha256 "df3fcd7056e48dad90190f1bab0b67de2fc1ccb91d56dadbeb1cb52903332eeb"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.28/packy_v0.2.28_darwin_amd64.tar.gz"
      sha256 "b6e9c1bd0458b62eaada405860f7e487fb0ee2e873a5e7c4a4de4baba9b75f33"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.28/packy_v0.2.28_linux_arm64.tar.gz"
      sha256 "34a012629c030b0955c31a94a053aba839309e125c52ea84175c6e8e5f0464a3"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.28/packy_v0.2.28_linux_amd64.tar.gz"
      sha256 "c803b96584e7b14f0723810a7a2147115be8d2f74bee81d08d7016913f0dcd0c"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
