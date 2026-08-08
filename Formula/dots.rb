class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.67.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.67.0/dots_v0.67.0_darwin_arm64", using: :nounzip
      sha256 "a1a0779ecd89c0629e809120a8b3a3184a177b08d2f113f80b2c915d9f78119b"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.67.0/dots_v0.67.0_darwin_amd64", using: :nounzip
      sha256 "75b234b88e9eefb3cd87c526501ad84db98c3bf8b9ca71da7a655f32873c6827"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.67.0/dots_v0.67.0_linux_arm64", using: :nounzip
      sha256 "e8777346d6bfc7a0651f5f3090735b03ae95a7b4afeee5cf3cfdaf63b44b354f"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.67.0/dots_v0.67.0_linux_amd64", using: :nounzip
      sha256 "a12e64d7486dd3f778013c839408b6886113a367aa681b1267c92faa0fb349b8"
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
