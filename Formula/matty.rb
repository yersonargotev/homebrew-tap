class Matty < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/matty"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.1/matty_v0.1.1_darwin_arm64", using: :nounzip
      sha256 "1a61dd5f3fe8e609dd23a852d5abfe6511d4b907def57d28977b9dbb05cfa877"
    else
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.1/matty_v0.1.1_darwin_amd64", using: :nounzip
      sha256 "f849f9241cbb219f0c0b3d10ee542ca9f99204ae967f0a2bdf04de0d50dabf76"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.1/matty_v0.1.1_linux_arm64", using: :nounzip
      sha256 "319546b279853f95505d1943a388eab9e04adee74e06dc65ee3dd4ccf8efb220"
    else
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.1/matty_v0.1.1_linux_amd64", using: :nounzip
      sha256 "dda93b3557f282e05cd33389e495cf4f8cd7478b6493d0649917947a00ccf0aa"
    end
  end

  def install
    downloaded_binary = Dir["matty_*"].first
    odie "downloaded matty binary not found" if downloaded_binary.nil?
    bin.install downloaded_binary => "matty"
  end

  test do
    system "#{bin}/matty", "--version"
  end
end
