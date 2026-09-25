class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.88.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.88.0/dots_v0.88.0_darwin_arm64", using: :nounzip
      sha256 "b081496a2c2a82ef7a5e047e0311cf9a3c309f1da1c6283b25b5551caeac1157"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.88.0/dots_v0.88.0_darwin_amd64", using: :nounzip
      sha256 "acd278a3d6484401afb92b600c128382f3ea1da5361e229b7565de23156c39f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.88.0/dots_v0.88.0_linux_arm64", using: :nounzip
      sha256 "e53642c1ba07105a8abc85d9d45dcf562df7b104c7443a3415654ba213b1042a"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.88.0/dots_v0.88.0_linux_amd64", using: :nounzip
      sha256 "f163968935aa846a31d8d5ba2732f5e32244076be5b538c53934d722be27f821"
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
