class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.91.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.91.0/dots_v0.91.0_darwin_arm64", using: :nounzip
      sha256 "99ba2f78e30b7dc52d5abb1684f22420aa702a1231e6750d9368f99830e45aab"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.91.0/dots_v0.91.0_darwin_amd64", using: :nounzip
      sha256 "7a31f8db407eb92d72d6a9cf00b419b3c82d8dfddcdb16a999ba1007a3d39a37"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.91.0/dots_v0.91.0_linux_arm64", using: :nounzip
      sha256 "5d628b51f94e8b6ff9f838d6b6bbfadea4cd8cc87df100427a96aa1a85f9c8cd"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.91.0/dots_v0.91.0_linux_amd64", using: :nounzip
      sha256 "ef7f92ca4fffdf34f2e64ce0b2358b8e856bf7707bb6fe1807524d21bedf6845"
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
