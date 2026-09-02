class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.20/packy_v0.2.20_darwin_arm64.tar.gz"
      sha256 "7e1c9a9f42e64df93a398ccacbbc3790b74374dd8d914cff37056ecf129241b9"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.20/packy_v0.2.20_darwin_amd64.tar.gz"
      sha256 "97a9fc7a2be07257a2df49bd0ed93fdbe75765186bd10c6222dae11053c867a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.20/packy_v0.2.20_linux_arm64.tar.gz"
      sha256 "649409e9ff79867122ff1047b834d60a147e1d3497c262c0e653086cd3917203"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.20/packy_v0.2.20_linux_amd64.tar.gz"
      sha256 "bf1085fae926fbe7c500f0769384769cb0cd3e65487e5545d4c6055c86666da1"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
