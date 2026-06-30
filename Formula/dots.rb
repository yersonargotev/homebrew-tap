class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.47.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.47.0/dots_v0.47.0_darwin_arm64", using: :nounzip
      sha256 "ecdd76c8fb78e0bf57b095a29d5c8fb72abe0bc7e670c86299b17116ba7bb2b4"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.47.0/dots_v0.47.0_darwin_amd64", using: :nounzip
      sha256 "4fda2e5e7a2374dc931d7c15244f5e99ac465fbc5a904e97061fef6b2498ff1e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.47.0/dots_v0.47.0_linux_arm64", using: :nounzip
      sha256 "f8b66422e57f0f461aa12cec202dbac99b77126d0a75fd5de0a10b6b9e148209"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.47.0/dots_v0.47.0_linux_amd64", using: :nounzip
      sha256 "dba5172a99612b4775fad68eb4454376256c542664be7eb7f1b2fa17b511e815"
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
