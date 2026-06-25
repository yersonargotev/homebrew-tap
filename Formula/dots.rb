class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.22.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.22.1/dots_v0.22.1_darwin_arm64", using: :nounzip
      sha256 "45b82ac3dab466fda77050d1cc422d8604b7c3343f0647b479f2536db72b2058"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.22.1/dots_v0.22.1_darwin_amd64", using: :nounzip
      sha256 "a27be21404745b2fb3113570c92ac0a4273bfbcf5ba5cb80a874732311d38dd8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.22.1/dots_v0.22.1_linux_arm64", using: :nounzip
      sha256 "1dc18fa1f12d160749831351d280dcbd18b445962d71f76a966279d8f7cef1ef"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.22.1/dots_v0.22.1_linux_amd64", using: :nounzip
      sha256 "ca277c2805dc559506d9a3a1f52b30c7674406b6267453198b3aba8f43362409"
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
