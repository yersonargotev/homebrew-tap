class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.12/packy_v0.2.12_darwin_arm64.tar.gz"
      sha256 "aef7d8fbd74c2f8ce834724f4126421370eae9e656343216bc1533b355fa8e43"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.12/packy_v0.2.12_darwin_amd64.tar.gz"
      sha256 "93593120b91918de0c78a95e6504dbd1625b8213b6235d2b0b3e126752799de9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.12/packy_v0.2.12_linux_arm64.tar.gz"
      sha256 "dcfe329a7756e6efee974b7dc18884cd9a1262f3a532944a843630f67a9c6553"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.12/packy_v0.2.12_linux_amd64.tar.gz"
      sha256 "068d1b98ffe8de70d37e5ec11654c531adbf4376c9e1aaca8d2d95ac82d39a2a"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
