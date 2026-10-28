class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.33"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.33/packy_v0.2.33_darwin_arm64.tar.gz"
      sha256 "1325b09bd0d8984d8c0559602b85746509feca92bbfa8b12643f82e32f6a2790"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.33/packy_v0.2.33_darwin_amd64.tar.gz"
      sha256 "3efd26ef8abe1e945925ce1dd0a369b6a17d8bbddb35a11e356d6a5fcdbf1383"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.33/packy_v0.2.33_linux_arm64.tar.gz"
      sha256 "7065bb1cdb705b2fb09b4cebfac8172c5b63027797c1a8b4ac291d196ba6b3c4"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.33/packy_v0.2.33_linux_amd64.tar.gz"
      sha256 "d722dd936bd6da6d1316fe625090e10b7448101ea266ed793327fd3a5b281a07"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
