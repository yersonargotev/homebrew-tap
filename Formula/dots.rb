class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.51.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.51.0/dots_v0.51.0_darwin_arm64", using: :nounzip
      sha256 "61d6e18b852a7f8f92b9e435f3371eefe37a9dd91710bb4c12f1d9e51a13867b"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.51.0/dots_v0.51.0_darwin_amd64", using: :nounzip
      sha256 "b6f024d949af6b95355d6370c782d67f12598ae5efdb1eeca611c9bbcd13a9d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.51.0/dots_v0.51.0_linux_arm64", using: :nounzip
      sha256 "f91206f9f471bb603cf95280c74cf99c0363a98e38639478a5cc83d4dd9a33b7"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.51.0/dots_v0.51.0_linux_amd64", using: :nounzip
      sha256 "6b2b99c57e11054cadb08347f81159e1cb117d422f5ba589e402abdd0ec4c2a4"
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
