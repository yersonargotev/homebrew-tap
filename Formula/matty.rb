class Matty < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/matty"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.0/matty_v0.1.0_darwin_arm64", using: :nounzip
      sha256 "a157494d0cf9132ca95fa54d52502756dae6f88185ad13c247637ab842c20dad"
    else
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.0/matty_v0.1.0_darwin_amd64", using: :nounzip
      sha256 "399ab30824840bc6f2c5740c872ccc95f89817894c9c1c4a7da04a68599b9bb1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.0/matty_v0.1.0_linux_arm64", using: :nounzip
      sha256 "bceea07c2c3e9a07d49f7ffff8b189e068bc7ea9b5c2ceec5db5f183b6b72844"
    else
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.0/matty_v0.1.0_linux_amd64", using: :nounzip
      sha256 "eaae389795fc8fe106f95bea2bf249d9208eb5d691ab1a1ee6bf5440a2fdb2f2"
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
