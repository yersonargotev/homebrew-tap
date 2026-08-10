class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.6/packy_v0.2.6_darwin_arm64.tar.gz"
      sha256 "686cbbd104cb3b0f78fe63f8bcc89858de63a674bd1ec1c9aa064d619894b277"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.6/packy_v0.2.6_darwin_amd64.tar.gz"
      sha256 "2c3e2720f69f2a91ece5f9eaa3f0b8ef93835a5ee803088a4abdfbca9d7b287f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.6/packy_v0.2.6_linux_arm64.tar.gz"
      sha256 "ed2f25764b2d93b59dc301ccd69be45864bd3469e9d234c2d8b914b16e1e40cb"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.6/packy_v0.2.6_linux_amd64.tar.gz"
      sha256 "a1d77cf50938cebe1023cff29f5e60b7c39b2b5b9ac8452d9ebf40075bd46261"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
