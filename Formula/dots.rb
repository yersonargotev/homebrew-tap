class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.17.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.17.0/dots_v0.17.0_darwin_arm64", using: :nounzip
      sha256 "2ad59ef7c0a4305b26f78db83a9046167f4df4a90e184e78b3012ab602b312fd"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.17.0/dots_v0.17.0_darwin_amd64", using: :nounzip
      sha256 "3ea4ba3c5a6b189c3f6cedf42f7f78a57637e347199999bce485be41d58343df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.17.0/dots_v0.17.0_linux_arm64", using: :nounzip
      sha256 "1b5df50ea4bf8d3a87345bd1c54af736117b40e523259750db7f4fd342b3e15a"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.17.0/dots_v0.17.0_linux_amd64", using: :nounzip
      sha256 "424daa6b077a9411dfc71053f74901bc7f626d1f702e84f30acce40369285e11"
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
