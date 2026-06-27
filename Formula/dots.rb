class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.34.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.34.0/dots_v0.34.0_darwin_arm64", using: :nounzip
      sha256 "70a64baf7452cb6e8fcb03d5177418da4612a8d63cad191542ea75c0e708fa02"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.34.0/dots_v0.34.0_darwin_amd64", using: :nounzip
      sha256 "b812715c9f4ac97971ce9af0c098e4c44c54ed03a02a26a8cfadc33550aaa6cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.34.0/dots_v0.34.0_linux_arm64", using: :nounzip
      sha256 "04a77d0fbfa973d1e1dec4e4f72ac72611ec1e4cf5c7a203a18fcf26501e149a"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.34.0/dots_v0.34.0_linux_amd64", using: :nounzip
      sha256 "ad5e47a20c1a861b33e0c971bf54e8f85abe25d9a4e710dcdce2be77aa7c98f6"
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
