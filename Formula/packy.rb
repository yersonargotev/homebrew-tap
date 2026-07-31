class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.1.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.11/packy_v0.1.11_darwin_arm64", using: :nounzip
      sha256 "553e690e4b55509fec5345802187d730b9592a8349ffca5aaa2006c4be2c4b38"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.11/packy_v0.1.11_darwin_amd64", using: :nounzip
      sha256 "8bbf841f1b8cbca4aaba891c822eef73a5fb44f7ee1c420bc43a2ed4d0b7921a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.11/packy_v0.1.11_linux_arm64", using: :nounzip
      sha256 "9f4c41e8eb910b298174c7fd8f6dd918ffe5c86063cbae200f0ac259e085e0d7"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.11/packy_v0.1.11_linux_amd64", using: :nounzip
      sha256 "b1c9045dea6e63b032ad2a93d90d5d9b565662e50a83232765882a902b52c873"
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
