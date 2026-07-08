class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.56.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.56.0/dots_v0.56.0_darwin_arm64", using: :nounzip
      sha256 "1c9ad84ac8bfb24677b482bac806135d50718e5586ce1fd2494861ac7115d361"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.56.0/dots_v0.56.0_darwin_amd64", using: :nounzip
      sha256 "0ad4c396c9bbd5c6c501eae2d2c5af176ddec885a15ab75d91ce7908894edd0c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.56.0/dots_v0.56.0_linux_arm64", using: :nounzip
      sha256 "7870d5a09f7fbb6d45c40411a5ee32da8d7504060a72ed6e0e88530e662c43db"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.56.0/dots_v0.56.0_linux_amd64", using: :nounzip
      sha256 "8259c81dc1484ea15e17a536003daa07efc9c381184b761db3e5a4fa32157ac5"
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
