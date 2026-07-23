class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.63.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.63.0/dots_v0.63.0_darwin_arm64", using: :nounzip
      sha256 "f4e4b8d65994569fc3c1af96ba04bd62bfaa78eb10a0fc30c43e2be232864349"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.63.0/dots_v0.63.0_darwin_amd64", using: :nounzip
      sha256 "3a85b231dab54fce8beaa1bfca373e0376b0b91bae3d3003661a0b33963a4feb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.63.0/dots_v0.63.0_linux_arm64", using: :nounzip
      sha256 "676ff2fbc479ff1fe2c8f6bf6cb3993a6129849ea07b77ffa839913caa0c2784"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.63.0/dots_v0.63.0_linux_amd64", using: :nounzip
      sha256 "eebefbd46793f74fb0541e26ab2a6418e4fe10ae469ccbe737895b4f475d8e29"
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
