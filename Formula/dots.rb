class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.5.0/dots_v0.5.0_darwin_arm64", using: :nounzip
      sha256 "0956314b00b1327abb1d2568d96d6a4601b0460fe720e01b1f420b2e3e974aff"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.5.0/dots_v0.5.0_darwin_amd64", using: :nounzip
      sha256 "eabfd43d82db925f6330c0908e1bcacc04d6da3731edd509a4365b222ca68629"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.5.0/dots_v0.5.0_linux_arm64", using: :nounzip
      sha256 "f00505f49f81fcf6ffee8081956928d845fee3664c97beac289251540c59a25d"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.5.0/dots_v0.5.0_linux_amd64", using: :nounzip
      sha256 "54d6fc06fdcce00fa98e1bc4ad5baed076db962c6428c54c210fe1ec617eeea6"
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
    system "#{bin}/dots", "--help"
  end
end
