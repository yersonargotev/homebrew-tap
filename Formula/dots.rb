class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.36.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.36.0/dots_v0.36.0_darwin_arm64", using: :nounzip
      sha256 "1dc6b13800e6994cc1d69d21f06eb8f0342b527e05e65962999c4d34354e87b9"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.36.0/dots_v0.36.0_darwin_amd64", using: :nounzip
      sha256 "648063085a52eb440eb6d6a3bd3cb93dbcd1344686fda980da2594e69bf8c22d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.36.0/dots_v0.36.0_linux_arm64", using: :nounzip
      sha256 "59c2b4e1237c3cf7ae3a8605e2f62526a48f3b4db52c729c4b3b2efef6fd66db"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.36.0/dots_v0.36.0_linux_amd64", using: :nounzip
      sha256 "a86ac065177d27c53b4e5fa8a67a6ea89362097afe117b4d482eeeb8a427d127"
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
