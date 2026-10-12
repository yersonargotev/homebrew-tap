class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.90.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.90.0/dots_v0.90.0_darwin_arm64", using: :nounzip
      sha256 "720f3bc424744edfe5366d514595e617de80db7385a7db14ce99858e97358be2"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.90.0/dots_v0.90.0_darwin_amd64", using: :nounzip
      sha256 "4e0bcc66d51d0874085d69c4e2faa9d6dbb7fe6b6dc5775a646fe8ddd36dc009"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.90.0/dots_v0.90.0_linux_arm64", using: :nounzip
      sha256 "63ea81bf028fc0dcf17886c463909d50c38900c8878079da4207c0e3a4f8fe70"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.90.0/dots_v0.90.0_linux_amd64", using: :nounzip
      sha256 "e42fa5e0130b920fd01b391d83f19b91df9d1ab141d0b6bd7c94b5a319b3fafa"
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
