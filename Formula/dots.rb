class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.92.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.92.0/dots_v0.92.0_darwin_arm64", using: :nounzip
      sha256 "a966c72e8d0fd18067847b25763aa2eba0a7e0018a9c4f282ccd7af8da5e9645"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.92.0/dots_v0.92.0_darwin_amd64", using: :nounzip
      sha256 "0e1006365533929c4b0c04de4bd7b97b13ca03d0a502888a6d739fda2cb5d9e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.92.0/dots_v0.92.0_linux_arm64", using: :nounzip
      sha256 "a6d1e0447595a59a2ebbf36ea9b3a2b88c06d09fbe3c79dd438088476f34948a"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.92.0/dots_v0.92.0_linux_amd64", using: :nounzip
      sha256 "c2ce4a402233b17ac598d1101510b4ebdcc3d96a31aea083bed895f39f70dc14"
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
