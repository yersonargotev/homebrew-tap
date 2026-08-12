class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.11/packy_v0.2.11_darwin_arm64.tar.gz"
      sha256 "7f5d6a6099c2798315ee4045c3513b3fcb28fd25dad570e5f80a5289eeadfd3d"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.11/packy_v0.2.11_darwin_amd64.tar.gz"
      sha256 "73589fc5cf9e87162b3d986801d6747355f51eaa1f6a76ccc5329d5d47ca150c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.11/packy_v0.2.11_linux_arm64.tar.gz"
      sha256 "5fe3b56b6afb1294280cc21920bd7c229f36bcc7a564ceabee6dfdc97f4c52a3"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.11/packy_v0.2.11_linux_amd64.tar.gz"
      sha256 "ba550a91fe46fe9e3434f70b4ade668c5491026b14c2f8fd4897b60d277aa674"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
