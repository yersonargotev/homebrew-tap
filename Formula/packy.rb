class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.1.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.13/packy_v0.1.13_darwin_arm64", using: :nounzip
      sha256 "d05d35460c1c137190846b43a6f0fdce263020718dde278a29c78830ef6491e9"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.13/packy_v0.1.13_darwin_amd64", using: :nounzip
      sha256 "f8b623ac92c8cb78d57880feb21dddb21f97b49f1cda279789f4b16d78c25770"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.13/packy_v0.1.13_linux_arm64", using: :nounzip
      sha256 "4dbf02b47a9e3608995ccc0d785beeaa865fd931d696f4e5f9b80c91b0db5f2b"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.13/packy_v0.1.13_linux_amd64", using: :nounzip
      sha256 "3b95b7091de4a1fd6cdfa2e2d1a071900c61ac3975782b2170fa909975a166fb"
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
