class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.22.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.22.3/dots_v0.22.3_darwin_arm64", using: :nounzip
      sha256 "f30cc2b54a03d5bc444ee4cd97ca4a7b0e2263513fe6e474442839ab72b956c9"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.22.3/dots_v0.22.3_darwin_amd64", using: :nounzip
      sha256 "507dc9b74c978b6ab0ae45ece6d07d3a9aafbf4c16f223cb382fc3e8732a5704"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.22.3/dots_v0.22.3_linux_arm64", using: :nounzip
      sha256 "7a0b1b965a845c5e94fe21f9122eeb8956089b691085ea180527222dd4410659"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.22.3/dots_v0.22.3_linux_amd64", using: :nounzip
      sha256 "30a0ab374ab25757abb79d157e0dc892664b8c1f3e3984f8ef6d50aa757fe35c"
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
