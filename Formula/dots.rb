class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.66.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.66.2/dots_v0.66.2_darwin_arm64", using: :nounzip
      sha256 "eaeafd8b7b297a6a9ca60fda4c4ee05da8c83643a135c037cf053ac9d8440cdd"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.66.2/dots_v0.66.2_darwin_amd64", using: :nounzip
      sha256 "260d7e0ef89cf19cf1e5b39c1174f936e2efb4a6b6490e671ed8afef45f94596"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.66.2/dots_v0.66.2_linux_arm64", using: :nounzip
      sha256 "37fef4e574527b13c658dcab1d6f8e30228f3a08eb2e3c9ea86fc3e08bf9068d"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.66.2/dots_v0.66.2_linux_amd64", using: :nounzip
      sha256 "e775b736705cc676f555ed361ca7a2b8e46b196ee4bc00c37ad6123c0dbe446d"
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
