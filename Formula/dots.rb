class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.79.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.79.0/dots_v0.79.0_darwin_arm64", using: :nounzip
      sha256 "bd866afc8ec3952daef8454f3946c5fbcfae33f8a306c4c7eceb9f190503b773"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.79.0/dots_v0.79.0_darwin_amd64", using: :nounzip
      sha256 "7570f7c1a4b4375750a0112f2e5fa4cce58c3c8450c888e23779715d110e5b37"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.79.0/dots_v0.79.0_linux_arm64", using: :nounzip
      sha256 "22f2af340a80d232df06a6bb1fa1f9fa26f89abfb957e88f548b92fc3e3d1df5"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.79.0/dots_v0.79.0_linux_amd64", using: :nounzip
      sha256 "8776d3cbb4d1ad615cd2ba2b67568c6a5223cfdea9e46fc2ab7997e02ac2f974"
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
