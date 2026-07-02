class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.49.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.49.0/dots_v0.49.0_darwin_arm64", using: :nounzip
      sha256 "2485b282ea72aca1b3757dd8732fbeca7f939e1c33b4c59ac7a2128d3700b184"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.49.0/dots_v0.49.0_darwin_amd64", using: :nounzip
      sha256 "8a08d7d97f1e1a06c38be9344d5ec52724200a71d9cd1ab961dbe0dcbb98f97b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.49.0/dots_v0.49.0_linux_arm64", using: :nounzip
      sha256 "4a221f5bec9b76336df93ec522007eb8aa57a5f9dcb5a82234e4908df0b9e442"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.49.0/dots_v0.49.0_linux_amd64", using: :nounzip
      sha256 "ec8d3bd11833b56f77da90c874cfaee8015783abd64add36525bebd8b3a94437"
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
