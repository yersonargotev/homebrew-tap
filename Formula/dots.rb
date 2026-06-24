class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.22.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.22.0/dots_v0.22.0_darwin_arm64", using: :nounzip
      sha256 "ce5e6b2df7d5bd9c4cdba183acff4f51f1e1cdc7e28f13568fb947c71ec98e47"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.22.0/dots_v0.22.0_darwin_amd64", using: :nounzip
      sha256 "325a92eaf01d6db673670c82634f577882777243e352bbcbc8595cebe6a87580"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.22.0/dots_v0.22.0_linux_arm64", using: :nounzip
      sha256 "c7aab824578850a75506d3e2a0cc2d6bd00357543ac878bc5350ddd60f5cbe00"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.22.0/dots_v0.22.0_linux_amd64", using: :nounzip
      sha256 "a58ecfa73b3dc30698ad281243b5cc8e609ce3a4f52347928718d5cd55401012"
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
