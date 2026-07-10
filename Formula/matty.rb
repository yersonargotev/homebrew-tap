class Matty < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/matty"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.3/matty_v0.1.3_darwin_arm64", using: :nounzip
      sha256 "66f04b7110e1ebd210910d7f012c707937c1df130ae17d750ed4cdfd31f20bee"
    else
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.3/matty_v0.1.3_darwin_amd64", using: :nounzip
      sha256 "acd11aa06666ed179db656cc22fd61ba0e9ac0bcd633f8f475164a99f8764978"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.3/matty_v0.1.3_linux_arm64", using: :nounzip
      sha256 "4638b34ddd0e69ac16b1ac5154c9b905357e8ebd1bcc7b0985d928789507eb52"
    else
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.3/matty_v0.1.3_linux_amd64", using: :nounzip
      sha256 "8dcaa9a935ef5186eae587537c2c6134e79f9ca4b8a198711866d011dbe597d3"
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
