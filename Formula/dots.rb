class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.94.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.94.0/dots_v0.94.0_darwin_arm64", using: :nounzip
      sha256 "62db723e7d99e6089f01908799a281246edb2865fc79d43f10d696d5fda983c1"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.94.0/dots_v0.94.0_darwin_amd64", using: :nounzip
      sha256 "d45d7a1bb0e0b20572f83df2977079532483e1756c106dd956221cc4e6592c51"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.94.0/dots_v0.94.0_linux_arm64", using: :nounzip
      sha256 "367e4ae7e194eb93800fe2bcdc21e08d2166f20702787a06f58fd5147d19428f"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.94.0/dots_v0.94.0_linux_amd64", using: :nounzip
      sha256 "4adeaabf0edb2a9458d85e4313acfefcb1bd609e58bc103724e09d34b38cacbc"
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
