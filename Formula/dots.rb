class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.23.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.23.2/dots_v0.23.2_darwin_arm64", using: :nounzip
      sha256 "118fbb452c3491854f4d60ea1313203597f8f41fd3a8cce14b036045900d45de"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.23.2/dots_v0.23.2_darwin_amd64", using: :nounzip
      sha256 "2c046779e048964ca7a0b8c2f7946c1208cc297c046b90b9bdd3cb832863a7a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.23.2/dots_v0.23.2_linux_arm64", using: :nounzip
      sha256 "25153f28ef406c64143210479479cd5674e9dc9951a3e3d56f6a1dbaef56c8a4"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.23.2/dots_v0.23.2_linux_amd64", using: :nounzip
      sha256 "91f2ac0258ba5069faf92239a91845509db6eb014ecebc626b1a978055346c3f"
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
