class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.80.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.80.0/dots_v0.80.0_darwin_arm64", using: :nounzip
      sha256 "a08dcd744a6c03381b743b8b53120378df918db9ac035a13a89e9e92066a799f"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.80.0/dots_v0.80.0_darwin_amd64", using: :nounzip
      sha256 "315097a0260d8f5b629503774f4b35b2ed7c6fdd0dc9c8fd742a83e6c8cd6f46"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.80.0/dots_v0.80.0_linux_arm64", using: :nounzip
      sha256 "956c8e6e84705b260923fff0e25ccf34358d36d379d0b3524ab6e948720f27d8"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.80.0/dots_v0.80.0_linux_amd64", using: :nounzip
      sha256 "62aeafd21ecbfa8f3e065c95432f9b663c3c5fa3716cf66df04727d0b964bc9e"
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
