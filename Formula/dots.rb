class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.70.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.70.0/dots_v0.70.0_darwin_arm64", using: :nounzip
      sha256 "6899524158da5979bfce3364fda54023dd284efd8c031a79b3d37c3b95d4e792"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.70.0/dots_v0.70.0_darwin_amd64", using: :nounzip
      sha256 "0539f2d671cc9d4ff9627705210875c88ccb6b2f464304a8cc421a4147127c8c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.70.0/dots_v0.70.0_linux_arm64", using: :nounzip
      sha256 "01d8324d540d9b8536a1b73ea7e981e76f234562bec723c8034a8aed1d1e72b0"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.70.0/dots_v0.70.0_linux_amd64", using: :nounzip
      sha256 "18bda3aee57afb02fc8256a9f0ecfdcf5da1cb4e6cef9e2f204299a37205e804"
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
