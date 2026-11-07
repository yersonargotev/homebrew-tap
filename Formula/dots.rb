class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.99.0"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/yersonargotev/dots/releases/download/v0.99.0/dots_v0.99.0_darwin_arm64", using: :nounzip
    sha256 "c3fc43013614152fc900c942a9112ac5be1e1a038463d453fdefe2019ea2e3f4"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.99.0/dots_v0.99.0_linux_arm64", using: :nounzip
      sha256 "b5d311bb50a9cd29d272f525ff0009bcc8ca792c53af45ceedc3499fc00a3b68"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.99.0/dots_v0.99.0_linux_amd64", using: :nounzip
      sha256 "db051329a23b724c7dca3c25f7e55667fe99d94095cfcd76638cb4802e540071"
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
