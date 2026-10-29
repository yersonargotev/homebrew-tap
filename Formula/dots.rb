class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.96.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.96.0/dots_v0.96.0_darwin_arm64", using: :nounzip
      sha256 "b93b8ca845a3ed7f90daef0dbfb1c2b1e29d33261ef0fff9a6d5cefb70fcee59"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.96.0/dots_v0.96.0_darwin_amd64", using: :nounzip
      sha256 "7ee07558ecb7e754c3389fbf5b502cacd4d6c36d979430da73ab65c79687cb42"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.96.0/dots_v0.96.0_linux_arm64", using: :nounzip
      sha256 "5b4a2b8f7b0afd83481265500ac1d4bb73b3487fc8f823ba8ae60cec80dfbb07"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.96.0/dots_v0.96.0_linux_amd64", using: :nounzip
      sha256 "8668bde310698092c80e5c41d6df59569188d7f0f125b9aa60fc168aacffd06f"
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
