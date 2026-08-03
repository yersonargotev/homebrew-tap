class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.1.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.15/packy_v0.1.15_darwin_arm64", using: :nounzip
      sha256 "69e377347e79cf9f93ca64e8612e3ceef6dc861c4e99edfeb43da766c6f8d0d2"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.15/packy_v0.1.15_darwin_amd64", using: :nounzip
      sha256 "be3855dcdb631718923190bcecb8a0f315098fb1c03cffbc4f52c7cbc499a9d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.15/packy_v0.1.15_linux_arm64", using: :nounzip
      sha256 "f01801f75bc4495e1c5fef1a6135d06ba807effcd66471d3af048e9d5791fd09"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.15/packy_v0.1.15_linux_amd64", using: :nounzip
      sha256 "74a973fe57a7155dfcd4936200cf83eeb19ca12862b7ecc611ea7e0a8f3cc150"
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
