class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.38.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.38.0/dots_v0.38.0_darwin_arm64", using: :nounzip
      sha256 "d1d7267672ca5f22f35b8de3130b637cb5d4fc5839f4430243b31be42cd0029e"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.38.0/dots_v0.38.0_darwin_amd64", using: :nounzip
      sha256 "e1c439c86972f9df816bb572e799752e8abfbebdd4b601659681168619f9d6cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.38.0/dots_v0.38.0_linux_arm64", using: :nounzip
      sha256 "3bcc067db69570d4f7ffed920ddcb2787c63598704f1bd73502b1d7fa4130ce3"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.38.0/dots_v0.38.0_linux_amd64", using: :nounzip
      sha256 "3c30f0388402d297132e4b6d42027222a233402a133dc46fec109901b0967483"
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
