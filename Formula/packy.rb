class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.1.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.16/packy_v0.1.16_darwin_arm64", using: :nounzip
      sha256 "7b492a9c434b15aab9dcaafca78f6f3f69e4e2db7761e95ce9f93917b7f5966d"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.16/packy_v0.1.16_darwin_amd64", using: :nounzip
      sha256 "d8c9250b7f18f680aeb01ebe07f8a0a3842f32bba83444286260155321f3eaa2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.16/packy_v0.1.16_linux_arm64", using: :nounzip
      sha256 "14ff80fe764a3700b3df948259c477165806d1bceb170fba534d124910e48cf3"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.16/packy_v0.1.16_linux_amd64", using: :nounzip
      sha256 "7e9d2d1d7ffadd6b136d8183cbeda876b2187c588994c8fa057431e6b1253d13"
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
