class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.32.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.32.0/dots_v0.32.0_darwin_arm64", using: :nounzip
      sha256 "592926e47687d7ea778196d131e7e3c6c810387609e66624060e93a4e294b7bb"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.32.0/dots_v0.32.0_darwin_amd64", using: :nounzip
      sha256 "2e9cfa9f649b3b35d2c76b37b652e937b0a412c1cc0d559b10eff561a950fae7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.32.0/dots_v0.32.0_linux_arm64", using: :nounzip
      sha256 "1b9048fb2b7eb57660aff7ef52fadc57beba1dd915704c5eef02053f66cd3d69"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.32.0/dots_v0.32.0_linux_amd64", using: :nounzip
      sha256 "3eaa86332b9c893ac5160f60078c8a5dbc22347d6aeaf00861d74a542748edd5"
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
