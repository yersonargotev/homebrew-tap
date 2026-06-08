class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.1.0/dots_v0.1.0_darwin_arm64", using: :nounzip
      sha256 "0d572a1966a25c40477669c98e0c74f27da5421c5ed935278055ad69a1a00a19"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.1.0/dots_v0.1.0_darwin_amd64", using: :nounzip
      sha256 "1bb87c231d2a6160fb5bf1cce05ef51bf188e751dd1baf80e7c798fb3105afcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.1.0/dots_v0.1.0_linux_arm64", using: :nounzip
      sha256 "111d45ce289f8a9c9cbbc24e90e6336b034d246e1b77e8e304ad09cbbfb414f1"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.1.0/dots_v0.1.0_linux_amd64", using: :nounzip
      sha256 "6511006a8015c4ce8b1d2b5d5539da10ca1c5ad70777f4addd88c90356d74380"
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
    system "#{bin}/dots", "--help"
  end
end
