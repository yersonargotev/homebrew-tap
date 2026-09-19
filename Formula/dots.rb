class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.82.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.82.0/dots_v0.82.0_darwin_arm64", using: :nounzip
      sha256 "99d65db5284b671d5d29a2e91b01392e4aea835c1f4c9023e91a89bdfea31de0"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.82.0/dots_v0.82.0_darwin_amd64", using: :nounzip
      sha256 "a6b13f01ccc0edcd59953303505c88a4947b92456a6e64514662f035f11c44f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.82.0/dots_v0.82.0_linux_arm64", using: :nounzip
      sha256 "bfe8c024bffcce47d819c15fdebc938b5a95b532e479bbf381f48d4c1f101c99"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.82.0/dots_v0.82.0_linux_amd64", using: :nounzip
      sha256 "65531d9577a74e2300c0f1c2021202a5423358679f26ea73c75ee7e92ba3afc7"
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
