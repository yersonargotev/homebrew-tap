class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.14.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.14.0/dots_v0.14.0_darwin_arm64", using: :nounzip
      sha256 "1f9928b6c7bdb09737d829451626d6f16f704278f617c004bceb93e81d131767"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.14.0/dots_v0.14.0_darwin_amd64", using: :nounzip
      sha256 "868cb20fe1bd27800bcec22e907b9822c75480255836d22e7d2df48780f93d34"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.14.0/dots_v0.14.0_linux_arm64", using: :nounzip
      sha256 "4e5252a2edbd17672902ddb5840834642e59f2088a1b0421415ecce1c5d5e059"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.14.0/dots_v0.14.0_linux_amd64", using: :nounzip
      sha256 "5a5e404fe9806ebe0671cc8371febd48cc60ece87b23fa3b6f634d60fde6e39f"
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
