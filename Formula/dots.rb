class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.81.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.81.0/dots_v0.81.0_darwin_arm64", using: :nounzip
      sha256 "84a47a2dbeec1e161ba5c394ae766236b2314b18d453897816333ff115f99ceb"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.81.0/dots_v0.81.0_darwin_amd64", using: :nounzip
      sha256 "cdac0cd09a10db3b424cf0c7dd0052e3140bc08578045febcc4a12e7852253be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.81.0/dots_v0.81.0_linux_arm64", using: :nounzip
      sha256 "a32c034edf7f3201be33cfb20c1f3f4cd3b26c16c71ed2db50ada6d87f2af9c1"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.81.0/dots_v0.81.0_linux_amd64", using: :nounzip
      sha256 "04b3518e880c54a1317209481d4f5a10f2be7b61725f35be00b02c7049532d0a"
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
