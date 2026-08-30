class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.19/packy_v0.2.19_darwin_arm64.tar.gz"
      sha256 "42649c2dfbf53adf68f37fd46cf07d09162371fa1d5f3e9f339deb263d954068"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.19/packy_v0.2.19_darwin_amd64.tar.gz"
      sha256 "9b289ae9b85ab6ac6bb12cc559895ba17bbfd5aa0401890b81c96e9789a101d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.19/packy_v0.2.19_linux_arm64.tar.gz"
      sha256 "8d3d1341434528ad34a69c3242a0cae2478f38973049ea8e9466696ce17a6817"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.19/packy_v0.2.19_linux_amd64.tar.gz"
      sha256 "5d6e3014ab3f78fc5f1f441234b78e398c9c95cb6ab6b3a6481034325a9567dd"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
