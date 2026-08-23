class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.77.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.77.0/dots_v0.77.0_darwin_arm64", using: :nounzip
      sha256 "b9a97c1a9265cea588308a5f95cd1ee89c47c9ba933487e03d55fdc0230e6dc3"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.77.0/dots_v0.77.0_darwin_amd64", using: :nounzip
      sha256 "0d0862b5568df9d453f785c54c5d7831270e13dfaf7a66dca15119a406d18eee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.77.0/dots_v0.77.0_linux_arm64", using: :nounzip
      sha256 "762ef4a0659be728ec94a3553cde04f32ba07166171038c3ad204680328877cd"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.77.0/dots_v0.77.0_linux_amd64", using: :nounzip
      sha256 "4e5156552a5650a224d2762cf2d47b7d8a0c601b56631ac960f89aa4043bdf34"
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
