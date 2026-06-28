class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.37.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.37.1/dots_v0.37.1_darwin_arm64", using: :nounzip
      sha256 "a401f21cf61926652106bdd61cca4a9b15c067bf79633e653d1a2157f7564052"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.37.1/dots_v0.37.1_darwin_amd64", using: :nounzip
      sha256 "a1998ad3b3b040b3a34970146db0d0ebb8cd585a22ad0a586956b1780d5f78e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.37.1/dots_v0.37.1_linux_arm64", using: :nounzip
      sha256 "1c93665457f1da764f432a2a8da0077005344da334ade87efc9c950f98c118d9"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.37.1/dots_v0.37.1_linux_amd64", using: :nounzip
      sha256 "b2282d8f919d81fe6a5ed762f49d1fa3e19bdf9729290072a816a368ce4d457d"
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
