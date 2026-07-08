class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.57.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.57.2/dots_v0.57.2_darwin_arm64", using: :nounzip
      sha256 "6a0520664a1a28b0dfc96c66d39d229908ed2b72c1c5077db1fcb3e4cb5cc5e7"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.57.2/dots_v0.57.2_darwin_amd64", using: :nounzip
      sha256 "3287186055074a1433df26f639e356e064e51bed4945350e024b50b58b62de7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.57.2/dots_v0.57.2_linux_arm64", using: :nounzip
      sha256 "c1a3ce41d7409a5ba5a049c66b0a54e11759c672f2518c4d0a902c1cd6242e10"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.57.2/dots_v0.57.2_linux_amd64", using: :nounzip
      sha256 "a269576884564cc9e7ab705cc37ba7822f00b880359456d6841590091e7b343c"
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
