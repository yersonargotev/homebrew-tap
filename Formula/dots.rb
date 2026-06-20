class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.10.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.10.1/dots_v0.10.1_darwin_arm64", using: :nounzip
      sha256 "89c6ce133299c3ae01d1e4c1ef90947f5a4cc66c7e0f666c19152839df330f4d"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.10.1/dots_v0.10.1_darwin_amd64", using: :nounzip
      sha256 "23360338b8d4f60edffc3358e97057db25b17a307d68794fcaadcf3ecd95e0bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.10.1/dots_v0.10.1_linux_arm64", using: :nounzip
      sha256 "1639e48559fd44e119bd2538a903e0129c9a5fff274525528ee08ddf6f0a381d"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.10.1/dots_v0.10.1_linux_amd64", using: :nounzip
      sha256 "d76a2b6e1f31db5798c99a73658c8354cd0d6265cad1b1b44d8f1ff7a18f6934"
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
