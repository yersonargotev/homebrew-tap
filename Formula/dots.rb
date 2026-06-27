class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.25.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.25.0/dots_v0.25.0_darwin_arm64", using: :nounzip
      sha256 "de20c10c7c1205bba72f56efa88350168fcd397ed0e76caaed1b3769464a14a8"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.25.0/dots_v0.25.0_darwin_amd64", using: :nounzip
      sha256 "3a0306c7a90d802a36452f9efb0a1e920a41424c602ee37cae81f89fcaffa5b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.25.0/dots_v0.25.0_linux_arm64", using: :nounzip
      sha256 "ef7f9ea6bc31b0aa50a6058b9c18f70cd263f264f1a78527725e58037d6d8fd7"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.25.0/dots_v0.25.0_linux_amd64", using: :nounzip
      sha256 "d83234629feb8a6cd7d3ddfe292ad747cdbe11c070d93daad6878eeba5f102d2"
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
