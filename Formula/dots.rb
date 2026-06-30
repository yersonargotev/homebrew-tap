class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.47.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.47.1/dots_v0.47.1_darwin_arm64", using: :nounzip
      sha256 "ee99c25f2683e1e8805d3ea7da73c397ffc85531b63890a38e7d8e4b89e46dfb"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.47.1/dots_v0.47.1_darwin_amd64", using: :nounzip
      sha256 "d03d8a7d3dfc6413629544c4038f28450ae1ecb5b327773a1acd22d4a6a99a0e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.47.1/dots_v0.47.1_linux_arm64", using: :nounzip
      sha256 "b273c448c84003e9c00ffe266d0f1fc84c2ef87e0c131910006307973d36306c"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.47.1/dots_v0.47.1_linux_amd64", using: :nounzip
      sha256 "9602ece3c1d40f3cdbfc850c25a1b03599cb9e9ada6dc19a7877cfdd1207847e"
    end
  end

  def downloaded_binary
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    "dots_v#{version}_#{os}_#{arch}"
  end

  def install
    bin.install downloaded_binary => "dots"
  end

  test do
    system "#{bin}/dots", "--version"
  end
end
