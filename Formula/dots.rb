class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.5.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.5.1/dots_v0.5.1_darwin_arm64", using: :nounzip
      sha256 "b7e333b02229e527288a8b05b41638d37ed5c6abbb8984bbfeddb7e242612011"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.5.1/dots_v0.5.1_darwin_amd64", using: :nounzip
      sha256 "cc4a2133e27e376cfeb17a7abdba39d56684c7650f1bdc35ef734aa8ae101d2d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.5.1/dots_v0.5.1_linux_arm64", using: :nounzip
      sha256 "361024c50a798dfc53f2c2b96de8d8985d2b48dde9e71403f7fc350c894d1655"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.5.1/dots_v0.5.1_linux_amd64", using: :nounzip
      sha256 "ff4f420f461d9fc8b473fb49f5b24f6b0ca4915aecbaaa0ce89923442882d50b"
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
