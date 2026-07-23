class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.1.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.10/packy_v0.1.10_darwin_arm64", using: :nounzip
      sha256 "366112b9a710771d3db9d85d2be149b9c92c4eeeefefdd2fcaf24b029024bee2"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.10/packy_v0.1.10_darwin_amd64", using: :nounzip
      sha256 "9d73a631df49aa97629322b2ac39add494f6e038dc74d08f44311cbae4b753aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.10/packy_v0.1.10_linux_arm64", using: :nounzip
      sha256 "83be8ccedb65c1fbdd80182e851f0a4ace9430e6eb75524b6f7092af89e33adc"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.10/packy_v0.1.10_linux_amd64", using: :nounzip
      sha256 "589c0edb19bbc2b8c503c54bb12eb919558191d40625d0753fa3ac3e26c59880"
    end
  end

  def install
    downloaded_binary = Dir["packy_*"].first
    odie "downloaded packy binary not found" if downloaded_binary.nil?
    bin.install downloaded_binary => "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
