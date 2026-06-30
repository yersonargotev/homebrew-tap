class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.47.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.47.2/dots_v0.47.2_darwin_arm64", using: :nounzip
      sha256 "67d3364dc30f0b13461f4e804a63b3a1e8a4f5c411f4beed3dcf52cc8e814f59"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.47.2/dots_v0.47.2_darwin_amd64", using: :nounzip
      sha256 "09f8c024eda06f4f0404609b98c3823bf325ca45ec83e855b956e96f8bd5a336"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.47.2/dots_v0.47.2_linux_arm64", using: :nounzip
      sha256 "91e00ad04099504ac6f0e22666d56cf095af3680dd8c47adb44fce1b872bb774"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.47.2/dots_v0.47.2_linux_amd64", using: :nounzip
      sha256 "57d96de82a970d18bbfcfa1f76c18f30e024af200b7811b6bde687d119ac7a80"
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
