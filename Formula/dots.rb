class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.97.0"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/yersonargotev/dots/releases/download/v0.97.0/dots_v0.97.0_darwin_arm64", using: :nounzip
    sha256 "639a9105000b5d131e9cf537a5dcda06a4bd4366ce9268c783a37567e06a7aa2"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.97.0/dots_v0.97.0_linux_arm64", using: :nounzip
      sha256 "6cc258fafd347aaca601e801a6874e8c93802997365e2d9cfca779cc59eeb9c5"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.97.0/dots_v0.97.0_linux_amd64", using: :nounzip
      sha256 "62e6d510a11efc9b621badc0f31be322ef5e4a5a2731e3fdf37e0fbbad83d212"
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
