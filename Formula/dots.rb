class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.59.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.59.0/dots_v0.59.0_darwin_arm64", using: :nounzip
      sha256 "fb2303356361ca45a1e46aa40d80da6a13e6e477c647db838d177ee7ace45f92"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.59.0/dots_v0.59.0_darwin_amd64", using: :nounzip
      sha256 "a01c1ff362c68d6d9fd8251ae500a9d5f7b4e981aa30ee2499c2983c52704614"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.59.0/dots_v0.59.0_linux_arm64", using: :nounzip
      sha256 "76398b8842114e989b55b069251e8eb3b39ab5b910bc9d943752ba8dc5f7d9b4"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.59.0/dots_v0.59.0_linux_amd64", using: :nounzip
      sha256 "5c958193d4ceed7ff588f29249d7f17a5c8bc9b02cf5455a154b28e0c678841b"
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
