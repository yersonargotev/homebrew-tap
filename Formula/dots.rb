class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.54.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.54.0/dots_v0.54.0_darwin_arm64", using: :nounzip
      sha256 "5c65b442fdf4bd156b8a0667c211a8439cf716bc50fd2fb589a3d579b780efdb"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.54.0/dots_v0.54.0_darwin_amd64", using: :nounzip
      sha256 "ed2d1888a6bee7968ba7ac02a133e8cc527e9a321574b0dd2b30e3c4516d7a18"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.54.0/dots_v0.54.0_linux_arm64", using: :nounzip
      sha256 "2d1df958cd52b087961b85aafe76cd08a45fefa5e47c93c50843e77f3be614b2"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.54.0/dots_v0.54.0_linux_amd64", using: :nounzip
      sha256 "643b0842e1ec6d5748043ecf307bd70df906173b4b1b0670a2679088aa5a6c50"
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
