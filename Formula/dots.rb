class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.13.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.13.0/dots_v0.13.0_darwin_arm64", using: :nounzip
      sha256 "6e53a69b45bb1dacf160a8ae5f1fa260fd43f620f2b405e5c482685098b4db1a"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.13.0/dots_v0.13.0_darwin_amd64", using: :nounzip
      sha256 "203cb4b405d4523aaeca11a08bdf948883259b1121ce588e34f5f6820e147043"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.13.0/dots_v0.13.0_linux_arm64", using: :nounzip
      sha256 "38a5b63eab90dc27f1e1fe4b2df49d283698b70f6e28a9801d00a2ea74f1d4d8"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.13.0/dots_v0.13.0_linux_amd64", using: :nounzip
      sha256 "4538ba615e6b42b54cfe137f3f013ff2c9a2472c7b404bde49b53bad479e630a"
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
