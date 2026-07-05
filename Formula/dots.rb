class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.52.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.52.2/dots_v0.52.2_darwin_arm64", using: :nounzip
      sha256 "2034ed761ff0985ea14934a5ca3e84a0071a7a3fe32c325af16b7d516218c36c"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.52.2/dots_v0.52.2_darwin_amd64", using: :nounzip
      sha256 "2bd04b45fd27a013f71c55508d1b9f11262e35f1da63f56954314cd3072eb0f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.52.2/dots_v0.52.2_linux_arm64", using: :nounzip
      sha256 "468f9a8f04b280ef6bfcb46050e4df514b1575495b277e3147e9e9f5d72fc274"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.52.2/dots_v0.52.2_linux_amd64", using: :nounzip
      sha256 "ebb4c70228aff1f82afb9d0c5b79729180f10f198afee1735a3611952860aef1"
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
