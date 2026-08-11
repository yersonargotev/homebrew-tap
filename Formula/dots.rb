class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.72.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.72.1/dots_v0.72.1_darwin_arm64", using: :nounzip
      sha256 "74aab0d8392fb02b8475a1b28567c3c3c1c7852805a84bff7ad11dffc948c74c"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.72.1/dots_v0.72.1_darwin_amd64", using: :nounzip
      sha256 "63360b6d64860b52cf032e1a8cd53701e3cc2f1e972ff3f3aae44d51a6981e83"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.72.1/dots_v0.72.1_linux_arm64", using: :nounzip
      sha256 "64c3efd2ad2eaeb468f1a6c8f1cdf1452ca78a23a5923e1001e7f487546bc5cc"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.72.1/dots_v0.72.1_linux_amd64", using: :nounzip
      sha256 "99c647cb589f835b95fb02d9c40ba7c220b64c12939a235e48b611d1394eeca3"
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
