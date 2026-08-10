class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.72.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.72.0/dots_v0.72.0_darwin_arm64", using: :nounzip
      sha256 "2f5de29f61f103ee76f13554cb0072cc17f8734c566d6dc821ef967c7b835839"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.72.0/dots_v0.72.0_darwin_amd64", using: :nounzip
      sha256 "7f9e4cba3380d74bf6ca68cc2cc69b0627827eaa610543a0e6452d1395d05303"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.72.0/dots_v0.72.0_linux_arm64", using: :nounzip
      sha256 "4ae7a2c2d0a28c2567f695a8b3febd78ee1c86bcff5e9af9618d1c388bf59d81"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.72.0/dots_v0.72.0_linux_amd64", using: :nounzip
      sha256 "2cb70dba20e9a1cdc3459e7d5951228f4f976619e1c551c2a8a0e2592970c755"
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
