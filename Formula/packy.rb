class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.1.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.9/packy_v0.1.9_darwin_arm64", using: :nounzip
      sha256 "87e7bc28c793b71e4d85060b449cac7b3842a5c7d6a564921fae7caca76ce575"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.9/packy_v0.1.9_darwin_amd64", using: :nounzip
      sha256 "bc2ad3a0931772837557b92f9004462ee4d1584ab2ca2eb3a5342edb93f1ef57"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.9/packy_v0.1.9_linux_arm64", using: :nounzip
      sha256 "5b0f1c5fb3522a1d1c5ae63ecf6c57402d62b6e890f778890ed0f3b94cf89e01"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.9/packy_v0.1.9_linux_amd64", using: :nounzip
      sha256 "5481524b054f4ef9bc6cf1e0cebd27b5a728ee53dfaf999622df620bf80b622b"
    end
  end

  def install
    downloaded_binary = Dir["packy_*"].first
    odie "downloaded packy binary not found" if downloaded_binary.nil?
    bin.install downloaded_binary => "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
