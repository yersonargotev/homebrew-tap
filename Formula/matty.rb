class Matty < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/matty"
  version "0.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.6/matty_v0.1.6_darwin_arm64", using: :nounzip
      sha256 "be0cc89a5e950e486103959c0018acf54a7eb6c2e8bb8176d125faa419451d6e"
    else
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.6/matty_v0.1.6_darwin_amd64", using: :nounzip
      sha256 "23aad97dd8b4dab679107b2cc9d93537072d4a5d9fba30ad24d6266dcabfaf7e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.6/matty_v0.1.6_linux_arm64", using: :nounzip
      sha256 "95da9b82aaa1a4d6c28c7e975434c3b10f08094cadab46ad448142f33e007396"
    else
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.6/matty_v0.1.6_linux_amd64", using: :nounzip
      sha256 "d0659f393c8da65a5806fb5c4e3cdc3b44cfb7dd2f63d3f932e0a9dda630206b"
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
