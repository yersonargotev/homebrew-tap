class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.89.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.89.0/dots_v0.89.0_darwin_arm64", using: :nounzip
      sha256 "ed6b04fdbb99fbfe0f1239eee167883377a47700bb636ccd063948a43598105c"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.89.0/dots_v0.89.0_darwin_amd64", using: :nounzip
      sha256 "457bbc406ff6acb1a8c08b282bfe466062ca1b30440b5881814ea7e44424a4d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.89.0/dots_v0.89.0_linux_arm64", using: :nounzip
      sha256 "ad18abb3365064cd27f68e7131d2537fe67d16af12df0698867584fc97f10304"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.89.0/dots_v0.89.0_linux_amd64", using: :nounzip
      sha256 "e27544b22be32684ed315a98d0b77b388e583d4e91b0f09ac6af78f833dbe5f1"
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
