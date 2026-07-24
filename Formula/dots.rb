class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.66.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.66.0/dots_v0.66.0_darwin_arm64", using: :nounzip
      sha256 "55d88fcffc41a6007ffc019792a5e930e385bab0f6fbbd47b829c725456243a2"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.66.0/dots_v0.66.0_darwin_amd64", using: :nounzip
      sha256 "86f70adad485f4350503cd033d959bd4722df37a67c0a31953a0a02de5795ad1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.66.0/dots_v0.66.0_linux_arm64", using: :nounzip
      sha256 "1d1edd932d7590489e3ed7258090090f0b7d837ac5b3035dbc86421c8c1022a9"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.66.0/dots_v0.66.0_linux_amd64", using: :nounzip
      sha256 "23d35ee9a647514c96f88d988046877a7f547d22d95a61007428efef26ad00eb"
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
