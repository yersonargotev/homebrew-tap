class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.60.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.60.0/dots_v0.60.0_darwin_arm64", using: :nounzip
      sha256 "8d9a3aac961c463379e21de6e1d8ea255efabdcf0d05f67a337b0ee1e61fd8c6"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.60.0/dots_v0.60.0_darwin_amd64", using: :nounzip
      sha256 "dbe8a3b84cc7e6cda68cf39f50f6aa7f6d703a69dd0a17e5c17cf1e5feff71a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.60.0/dots_v0.60.0_linux_arm64", using: :nounzip
      sha256 "e956bbe4bf78a33f3ed96a60106b89fa079190fbe050775714ced717831de02b"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.60.0/dots_v0.60.0_linux_amd64", using: :nounzip
      sha256 "669fe50b0fef84ca59b4fe052d5066693b03cf3a8c91798a809fc2a68856b170"
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
