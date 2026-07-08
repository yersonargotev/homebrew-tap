class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.57.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.57.1/dots_v0.57.1_darwin_arm64", using: :nounzip
      sha256 "2057b7e490bd932bf9c6b924c2bdf276603121a17d43b556430e8eb8a0e607d9"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.57.1/dots_v0.57.1_darwin_amd64", using: :nounzip
      sha256 "62f6e6a71ccf489af0e94ee364004c47ef2defe249139ef4a8848a5ac74fce47"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.57.1/dots_v0.57.1_linux_arm64", using: :nounzip
      sha256 "e806ed54e1cf4ae68d55e328176149d38cbd45b8a60d00c15512009241c2be52"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.57.1/dots_v0.57.1_linux_amd64", using: :nounzip
      sha256 "303945eda2d991b0d4cddf2e012527ac3fba2cef80d31e67b2fb8e109100c25b"
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
