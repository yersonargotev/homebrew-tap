class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.29.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.29.0/dots_v0.29.0_darwin_arm64", using: :nounzip
      sha256 "01a3e0414cb6fd5151800dad2999e5d9454a22fbbc75afb545946b0708a22e67"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.29.0/dots_v0.29.0_darwin_amd64", using: :nounzip
      sha256 "0afd770c14cc060e6a2b535e833076dd6300475efbb9d431020c76b2b15c3233"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.29.0/dots_v0.29.0_linux_arm64", using: :nounzip
      sha256 "40dc9079169edd0198eb48ab3daa2dccc06a1e87db2408e89baed1c1a9419b0d"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.29.0/dots_v0.29.0_linux_amd64", using: :nounzip
      sha256 "e93b2786ae3e13b01b5e9d2e2501379d7f129011ab730a8c9aca543d4b4b9362"
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
