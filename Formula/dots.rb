class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.68.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.68.1/dots_v0.68.1_darwin_arm64", using: :nounzip
      sha256 "7063bda0c830b1886aa5fdd27606a3629749a598c6973b9caa048661bf789908"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.68.1/dots_v0.68.1_darwin_amd64", using: :nounzip
      sha256 "b7f5f40d712d25f18baaa97165ef1e2ef34fda515abf4907ab6a757b9aa282fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.68.1/dots_v0.68.1_linux_arm64", using: :nounzip
      sha256 "458ac51a890c9923d13788c3173e749b042f7e8365aef161f987c9205315d020"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.68.1/dots_v0.68.1_linux_amd64", using: :nounzip
      sha256 "c1e20fc8861bd71aea3c6093ed60495456c9cb75edbbaef971427ecc34579b5c"
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
