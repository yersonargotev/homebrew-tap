class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.10.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.10.0/dots_v0.10.0_darwin_arm64", using: :nounzip
      sha256 "b74f779cb0c0134bb00206ad4b78a2f7213c1b6df328b81356d607ddfe972318"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.10.0/dots_v0.10.0_darwin_amd64", using: :nounzip
      sha256 "f6bed65900e27a685dc1d9c0788ec58e072c4be6a59e250a7638f4d3ef670445"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.10.0/dots_v0.10.0_linux_arm64", using: :nounzip
      sha256 "98321f9a5a837e04321216410b23f8372a9045eb86dc8330edc00d39e9283965"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.10.0/dots_v0.10.0_linux_amd64", using: :nounzip
      sha256 "ae3c0637302504e70ee611c8126b52ce977f560e3bc92c0656fd5a5af89eaffb"
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
