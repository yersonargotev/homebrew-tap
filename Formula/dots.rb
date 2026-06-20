class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.9.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.9.0/dots_v0.9.0_darwin_arm64", using: :nounzip
      sha256 "28662562e34b437502d541ea4f61d23b80fd14da744aeb62bec6072e823e730f"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.9.0/dots_v0.9.0_darwin_amd64", using: :nounzip
      sha256 "d80ead016fde67afb0889bca4d8df707fdf5aab316b76c4986296a4ee84aaa75"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.9.0/dots_v0.9.0_linux_arm64", using: :nounzip
      sha256 "dd725ea4ba6ca274419dd686cec537cd68dd8df3af33329c4c37998f74070593"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.9.0/dots_v0.9.0_linux_amd64", using: :nounzip
      sha256 "de00b65be303946647eea37770694d29a55a40832f945f25569243eefba75721"
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
