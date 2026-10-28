class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.34"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.34/packy_v0.2.34_darwin_arm64.tar.gz"
      sha256 "5b3b568c3d71a95783d286d008e1889f839ffa175c9091023663b18156623947"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.34/packy_v0.2.34_darwin_amd64.tar.gz"
      sha256 "6e3696c3f73d8c433170b5960e9c558a98899c15c00248b9028fffb3187e443a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.34/packy_v0.2.34_linux_arm64.tar.gz"
      sha256 "b66d4d3de8204fb1b5016df32d7a645d2419ee6133c1f8a22608ba07ce96dbc8"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.34/packy_v0.2.34_linux_amd64.tar.gz"
      sha256 "43b4228d41396ed81129f37510ceecaee5ebfbbf8dd817284a319e5fd59113e3"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
