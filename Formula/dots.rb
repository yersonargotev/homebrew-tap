class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.35.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.35.0/dots_v0.35.0_darwin_arm64", using: :nounzip
      sha256 "a63b06f27288ad3cf2d8a6c68efc96e5cc6936703de4d919b24528397ad3fd18"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.35.0/dots_v0.35.0_darwin_amd64", using: :nounzip
      sha256 "d0443bbb6350e5dd22f90e2f0104f17bc6b105ba1aba38af1293f544ff443598"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.35.0/dots_v0.35.0_linux_arm64", using: :nounzip
      sha256 "725faee00e126525b05a870c27d98c4f37312ad70e27d3bfe224a84f7b23d14f"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.35.0/dots_v0.35.0_linux_amd64", using: :nounzip
      sha256 "4f5b8dfa310d8e5ab6711b8040974a152276748af27d9630a1d5dc88cd7783db"
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
