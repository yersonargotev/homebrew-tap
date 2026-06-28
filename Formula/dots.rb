class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.41.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.41.0/dots_v0.41.0_darwin_arm64", using: :nounzip
      sha256 "e8e3da79fb54dd9d0637101ff0c2b980fcca9645b9f18a72f5884ba5215c135f"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.41.0/dots_v0.41.0_darwin_amd64", using: :nounzip
      sha256 "c3519aefacb6d317ebee9b555c92d5e74d4f73fd238a0fda00a6272a0007f20b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.41.0/dots_v0.41.0_linux_arm64", using: :nounzip
      sha256 "dc58a47364cf7f3740faf034b62e60791734af9db66fb9abc9a7c13488f36e2f"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.41.0/dots_v0.41.0_linux_amd64", using: :nounzip
      sha256 "3c49b06df64090eac38f11dc3ab3a3b645c939d24c4fe8940d592ece0d8f6984"
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
