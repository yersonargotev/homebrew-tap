class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.86.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.86.0/dots_v0.86.0_darwin_arm64", using: :nounzip
      sha256 "5adf87a31a180bd54b460ec4053e4e7ad31ad3ba5d2c2dbc0df4e34f22454f29"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.86.0/dots_v0.86.0_darwin_amd64", using: :nounzip
      sha256 "866a6963a3268b36c33923ef51a085a6ddd5bc3575943348a223556c70bc802a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.86.0/dots_v0.86.0_linux_arm64", using: :nounzip
      sha256 "56e57b98c19eb5222cdb1deb002390f97d81a1d4455ec4efb2550004ce89e55d"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.86.0/dots_v0.86.0_linux_amd64", using: :nounzip
      sha256 "113fef2d0fcdd1defc94c1d38db6e3225655e785e5de923f4523e6a0effb8ff0"
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
