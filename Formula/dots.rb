class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.83.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.83.1/dots_v0.83.1_darwin_arm64", using: :nounzip
      sha256 "d3845538842a18caee860aac4c42d707e203897c84b753a513ea4098cbfd4a55"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.83.1/dots_v0.83.1_darwin_amd64", using: :nounzip
      sha256 "d522c1ea4af0724ffa840b62710fe9fd8b6c1852760b3112d9999edb75c8a413"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.83.1/dots_v0.83.1_linux_arm64", using: :nounzip
      sha256 "433daa4009c18f16b83c71f7c9200735f97c8f408b214f45618c474eab474d7b"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.83.1/dots_v0.83.1_linux_amd64", using: :nounzip
      sha256 "cd1ed2364b19c3bd7a8d4362f6a658fa5a7c3ca6e7ab8acc7d8e856dea5e6688"
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
