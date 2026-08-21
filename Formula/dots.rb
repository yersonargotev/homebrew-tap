class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.76.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.76.0/dots_v0.76.0_darwin_arm64", using: :nounzip
      sha256 "644d00a8ae3f4f2871e27fbcad637754971ae6e81232abed6f2041f052ed1293"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.76.0/dots_v0.76.0_darwin_amd64", using: :nounzip
      sha256 "47c823daeb0ececc2898bfec3124e3f8cfdf2bcea7c559302e9868b2a9da8d3c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.76.0/dots_v0.76.0_linux_arm64", using: :nounzip
      sha256 "36012b41aba33f4d1ad4bc7ac478c53a0cd9c9c8d90a8758d3dde0479089bd21"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.76.0/dots_v0.76.0_linux_amd64", using: :nounzip
      sha256 "9f4074ec1f04b4eac0f1a5a238c56d9d005fb228d9c87c44865f63ec80e1dcb7"
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
