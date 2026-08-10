class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.71.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.71.0/dots_v0.71.0_darwin_arm64", using: :nounzip
      sha256 "e68a547ec8890f492512e82fb7688fb787fbfe29ea2943e9beb7e468c2002977"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.71.0/dots_v0.71.0_darwin_amd64", using: :nounzip
      sha256 "40da9976f9ba6a0ef0dc07dcf5732766224f63f54c182780edce9c6594edb171"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.71.0/dots_v0.71.0_linux_arm64", using: :nounzip
      sha256 "8dbbe4f5ef5bbcd936356f76ea6b1942b973e71109bacffba58ffb182e4ce2ca"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.71.0/dots_v0.71.0_linux_amd64", using: :nounzip
      sha256 "503faea112cf5d4bb207e097cafcb079747968da9d96de16d7441ed4201f1e5b"
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
