class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.46.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.46.0/dots_v0.46.0_darwin_arm64", using: :nounzip
      sha256 "102d737636015aa6822986aa71369ee7eae453b44084ad8dce898dd7eceb7f32"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.46.0/dots_v0.46.0_darwin_amd64", using: :nounzip
      sha256 "303eec32604714b7ac09251c350e8a13428d143250447fc38ef9672ae5486803"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.46.0/dots_v0.46.0_linux_arm64", using: :nounzip
      sha256 "fec7ee1240807ee714696174ade9fd67c1db53c149803c3752d8659c9df6d72c"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.46.0/dots_v0.46.0_linux_amd64", using: :nounzip
      sha256 "cdb7389b1998575dd56c3743e756e65fe6602119cb9675a2c4b69082ea42adee"
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
