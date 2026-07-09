class Matty < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/matty"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.2/matty_v0.1.2_darwin_arm64", using: :nounzip
      sha256 "03f8a9190c0c6d4c8220040ef7836c866921c0ee7b8d9ecd620890269e2277fc"
    else
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.2/matty_v0.1.2_darwin_amd64", using: :nounzip
      sha256 "10572424e73981ededf0501aa6fa4e5529efee7a844aafdb6a83f27cff6be6b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.2/matty_v0.1.2_linux_arm64", using: :nounzip
      sha256 "c070aa4ad9e79b77ab552ea28fe21bb7862651a08ca1ea61954728b19f030df8"
    else
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.2/matty_v0.1.2_linux_amd64", using: :nounzip
      sha256 "6db5a958ca92911fb6c1f971bb10744be7cde7dcaa4fe905d1cea7c32cc25e05"
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
