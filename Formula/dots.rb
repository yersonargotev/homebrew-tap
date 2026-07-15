class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.58.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.58.0/dots_v0.58.0_darwin_arm64", using: :nounzip
      sha256 "a52658af3fbbbb1c48293f2ae3d1be88e8cf83c59f1d272338eeb753673b127a"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.58.0/dots_v0.58.0_darwin_amd64", using: :nounzip
      sha256 "c221d45a19d3527471a3b1f342a3dbe24576ea733be4032435273a7bde6017bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.58.0/dots_v0.58.0_linux_arm64", using: :nounzip
      sha256 "220ab6bc803cb3ef2ff46fd1e69ef1859bdad53aabb693e70debd4c9071669c3"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.58.0/dots_v0.58.0_linux_amd64", using: :nounzip
      sha256 "76cc9832e0a1f6c4930c1883adbd6b78585611e712bc47b7e3f27c0a1fa195f0"
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
