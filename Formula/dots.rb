class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.57.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.57.3/dots_v0.57.3_darwin_arm64", using: :nounzip
      sha256 "3800e267ce176c1a9cf7e3c2a53ccae54e1d5245758cd2786b261bccd8d2c044"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.57.3/dots_v0.57.3_darwin_amd64", using: :nounzip
      sha256 "2249abc8b19326fea02490178d1058f2cc4902a60331cb2a58234abeadc85264"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.57.3/dots_v0.57.3_linux_arm64", using: :nounzip
      sha256 "9ba4bc9582327c402342a2fbe966fa605695e90af416e316f57fba35c31e2935"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.57.3/dots_v0.57.3_linux_amd64", using: :nounzip
      sha256 "4cb24b35849f9ceaf7227ee130db1731c1bc1c843c435454bfdc0b68d4c10d68"
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
