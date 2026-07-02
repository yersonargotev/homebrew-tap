class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.49.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.49.1/dots_v0.49.1_darwin_arm64", using: :nounzip
      sha256 "1f8fcb31968450fa25c846719ed3fc9cb9f506495d2bc78dc6bfca5ae8a3ece8"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.49.1/dots_v0.49.1_darwin_amd64", using: :nounzip
      sha256 "e6031e8ab855c222bae15192bc6e9b73536f5c5967d80987e42349b23ab6e071"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.49.1/dots_v0.49.1_linux_arm64", using: :nounzip
      sha256 "91f141dd354aa8709acc20d0394e73159b15fb787fc25eedcf74498f1a114b32"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.49.1/dots_v0.49.1_linux_amd64", using: :nounzip
      sha256 "e7f1d4be60baf9cfef5431c6de837d4e1bb5464c9bc270ef0f5a05ca4d27f856"
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
