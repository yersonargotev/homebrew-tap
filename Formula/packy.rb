class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.3/packy_v0.2.3_darwin_arm64.tar.gz"
      sha256 "0c14afc65902a581e8eb750cf078df0e75009023cb3b5605e76227d4ee683683"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.3/packy_v0.2.3_darwin_amd64.tar.gz"
      sha256 "e773cd4aeea1dcff375a3c7f78c1ffd35c7f71dc5906d9818a540dfa113a3903"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.3/packy_v0.2.3_linux_arm64.tar.gz"
      sha256 "577665f4efbc1816e5197ad36bfe2f8e90909f1133d5b1f0282db6962a49346e"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.3/packy_v0.2.3_linux_amd64.tar.gz"
      sha256 "b648b2d400a1b95a14f1298b02871bffde33086b1777acc47b176924e04cab03"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
