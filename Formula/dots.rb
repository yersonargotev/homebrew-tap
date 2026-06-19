class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.8.0/dots_v0.8.0_darwin_arm64", using: :nounzip
      sha256 "f1f4533960ff864bf11e283be633150c47e47497029c084a965d2249025eb1ef"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.8.0/dots_v0.8.0_darwin_amd64", using: :nounzip
      sha256 "2fd54151af9cc805f866e4aedb617d5a4bc0689730df145d3a45b241ea994007"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.8.0/dots_v0.8.0_linux_arm64", using: :nounzip
      sha256 "9018f0619b96c23d95f7ec261eeeb21286d8adf8c34033b2da5e036d8daac9be"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.8.0/dots_v0.8.0_linux_amd64", using: :nounzip
      sha256 "7795b1ca41744f083f9cb5aa5d171883168f7709d0147029879b593b03cba3cd"
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
