class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.62.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.62.0/dots_v0.62.0_darwin_arm64", using: :nounzip
      sha256 "02e9f8409a6a62afbed4ea404da662e05d768f319a19a2e88322e25b4b07e236"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.62.0/dots_v0.62.0_darwin_amd64", using: :nounzip
      sha256 "daaf4b4391fceeb451d51101f44096ff3cf30c2a9e7fb37291416a01075cbe6e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.62.0/dots_v0.62.0_linux_arm64", using: :nounzip
      sha256 "01200596dbad82a3f9aaed6deb6ba523cf45959928184068bf1c0b6a2e189ba6"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.62.0/dots_v0.62.0_linux_amd64", using: :nounzip
      sha256 "b081e7f3ab461fc2d36173a279cf7bb15ff4e9059c0ce73e81d825d4ee3a9714"
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
