class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.22.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.22.2/dots_v0.22.2_darwin_arm64", using: :nounzip
      sha256 "db0a13948e1607c873d4bd9b40a6999199a199e903454ad3c9b7646d03f3f05b"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.22.2/dots_v0.22.2_darwin_amd64", using: :nounzip
      sha256 "b35dfb71be777f20113c9d933dd637b46afbc4f48bc44cab5237a912c4c6d296"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.22.2/dots_v0.22.2_linux_arm64", using: :nounzip
      sha256 "b78cf5451525bb0b02433116993e50d89ab3a7a9a0404acfa779fb09559f4249"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.22.2/dots_v0.22.2_linux_amd64", using: :nounzip
      sha256 "76d51d9f179f3c2ffcc189c577f53a9052afff509b53b15369969ed90c69241d"
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
