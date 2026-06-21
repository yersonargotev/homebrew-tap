class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.11.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.11.0/dots_v0.11.0_darwin_arm64", using: :nounzip
      sha256 "3dbdeeb0b054550ba308d08d935e957f9f24436d6f03884940411a525d677f26"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.11.0/dots_v0.11.0_darwin_amd64", using: :nounzip
      sha256 "4325dcdefa370a882092f86b8138982978ac7b5d961345ec009f2ccbe3cc749d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.11.0/dots_v0.11.0_linux_arm64", using: :nounzip
      sha256 "b51116978387a958e611b4f48fd5cf8dce720e47629d3d732be363b512117cea"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.11.0/dots_v0.11.0_linux_amd64", using: :nounzip
      sha256 "c8c73ff4ca599fd11e5ef0a7ecdc2174d68af1f2ff689d7f23ee60f43eddfdfe"
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
