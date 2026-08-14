class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.15/packy_v0.2.15_darwin_arm64.tar.gz"
      sha256 "dfa41714f1763b2d7e77d4e66db905f91112a18752c9ea26e3c463ce1ff948c6"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.15/packy_v0.2.15_darwin_amd64.tar.gz"
      sha256 "c1d085beca71cd13785488a2995e1fee186e635aa34459ff5a78889ca455b610"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.15/packy_v0.2.15_linux_arm64.tar.gz"
      sha256 "74d6e4048e1eca8f02ef189fe85b455f57e2b7a90f4a73db18f68296493df931"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.15/packy_v0.2.15_linux_amd64.tar.gz"
      sha256 "ef3ac530f9e99cb22542ea23a5e901d0143d3f686e44c0a8d6f9e211756fa895"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
