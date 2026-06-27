class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.24.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.24.1/dots_v0.24.1_darwin_arm64", using: :nounzip
      sha256 "574eac8083d387aa14eba93c396340ab7e7af87297631185b548ebfd6ceac277"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.24.1/dots_v0.24.1_darwin_amd64", using: :nounzip
      sha256 "d020724c4f89d5feafa15933831aed0b1e3c3c40e36c5268cf8dbbf9d57810b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.24.1/dots_v0.24.1_linux_arm64", using: :nounzip
      sha256 "5691ec1dd06cfd21cc89ca68551989cd1de319c4331a35792a92ed76ea507fd3"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.24.1/dots_v0.24.1_linux_amd64", using: :nounzip
      sha256 "5ae8d46e13841b055ecdab69fdb790e647a12b27b8acbf2ebfecd4764da131dc"
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
