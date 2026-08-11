class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.9/packy_v0.2.9_darwin_arm64.tar.gz"
      sha256 "e9ff14cdaff02ad5df425de0d184d2e66d1d218dadbc11ae49120d4e422f7e5b"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.9/packy_v0.2.9_darwin_amd64.tar.gz"
      sha256 "8a62bd8eebdfc275b4935526074791f42e12f09cf93e430d79f4e8909b2ff914"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.9/packy_v0.2.9_linux_arm64.tar.gz"
      sha256 "28ca482410de4fc8b4e7a3b8b120d9334cf98f5dfdbfbf09de1c78f6dc1416b7"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.9/packy_v0.2.9_linux_amd64.tar.gz"
      sha256 "d25390ade9bc60d6e3cd7b30973fcbc4e8cf13a7d9b55849e629ec0590574bbe"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
