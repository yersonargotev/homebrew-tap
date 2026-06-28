class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.42.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.42.0/dots_v0.42.0_darwin_arm64", using: :nounzip
      sha256 "282571d7efe92f3f482847e32db53a225f9c84157e38f34f7c373ab0f162ea76"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.42.0/dots_v0.42.0_darwin_amd64", using: :nounzip
      sha256 "ea6cf7668a5315b5227a04d558f1e2c120a19fccd1c21b6dc88017a58d2984c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.42.0/dots_v0.42.0_linux_arm64", using: :nounzip
      sha256 "73609182fdcf9af35a6c6eb178e880af5c82adaada64dd50750beb2cc3f155cc"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.42.0/dots_v0.42.0_linux_amd64", using: :nounzip
      sha256 "94f5807747fbbe603bd1fa8307eb0ad2feda71da9de06671af659a2564bf7a29"
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
