class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.10/packy_v0.2.10_darwin_arm64.tar.gz"
      sha256 "68b6bf844a4d3767321cfb79f73ccf5c92ab2410cd07f68a8bce530cef84cb18"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.10/packy_v0.2.10_darwin_amd64.tar.gz"
      sha256 "6b296accb8e5425889639928d2118e0086d9cc69d44aa5a168bec256e032bfdc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.10/packy_v0.2.10_linux_arm64.tar.gz"
      sha256 "7da80485cb671b223519c0235064fc9b0cabd69f488da3eac89079d1564c81e3"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.10/packy_v0.2.10_linux_amd64.tar.gz"
      sha256 "73b2d64d688adca5ee290bad8bc3de5bef99ab3296b722f911374a61a3a4cbef"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
