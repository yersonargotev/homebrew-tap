class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.53.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.53.0/dots_v0.53.0_darwin_arm64", using: :nounzip
      sha256 "fe716b2e5e4584d4aa409db9d194a211c8ebcf061d3ad02ac2602651f2b2daf0"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.53.0/dots_v0.53.0_darwin_amd64", using: :nounzip
      sha256 "f923890ce530ef96cd559afaf1aa3288b8e19e44f02e104bbdf1ccb8d8d13208"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.53.0/dots_v0.53.0_linux_arm64", using: :nounzip
      sha256 "9c24706f98e2dedec6082f2d1dd9811ea83a2b9173583c3b5971175445bad029"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.53.0/dots_v0.53.0_linux_amd64", using: :nounzip
      sha256 "1ae0d483932b9aa39754c80a699baace637c190d5943eada3fb044fc8c850613"
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
