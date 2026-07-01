class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.48.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.48.0/dots_v0.48.0_darwin_arm64", using: :nounzip
      sha256 "5ebbd43978785da42b1d3a636a41d824188eadbd614fb5addefe89feaa25d07f"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.48.0/dots_v0.48.0_darwin_amd64", using: :nounzip
      sha256 "9bd973a199bb8cd189303505289704a3e64e2b66cbcf53969b1eb48802f199c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.48.0/dots_v0.48.0_linux_arm64", using: :nounzip
      sha256 "11dbb7daac1c42249e5ba11e57076b015e12ccabc4795be62fd6779093a13f18"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.48.0/dots_v0.48.0_linux_amd64", using: :nounzip
      sha256 "7b635fc940c20387560727312e0aeefcc27affdc14259393627ebdac77e4db72"
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
