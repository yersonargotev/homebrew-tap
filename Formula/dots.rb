class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.21.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.21.0/dots_v0.21.0_darwin_arm64", using: :nounzip
      sha256 "92f04ef91f7de06d37e505d51b1ef38a28746dff23edb347c88c1befc56c7eb7"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.21.0/dots_v0.21.0_darwin_amd64", using: :nounzip
      sha256 "efcb15085769bfb3f31a03799de6287cf397790e1e35690bd4aade847c1fcb8b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.21.0/dots_v0.21.0_linux_arm64", using: :nounzip
      sha256 "c724578ac8537f535fe05551e772fee24633c0ead07351b54c17ef33b0d49255"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.21.0/dots_v0.21.0_linux_amd64", using: :nounzip
      sha256 "545c714dba564ab5b1b3bb013a3922edede26f77aa55031a118c7f135c98513a"
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
