class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.1.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.7/packy_v0.1.7_darwin_arm64", using: :nounzip
      sha256 "8e95ed2888845aa06caca336f4ad70153fc2cfb7b45c21177a4d07877cccfd8b"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.7/packy_v0.1.7_darwin_amd64", using: :nounzip
      sha256 "d22c42c464deca8e2f574f8a86d1913e6c9dd38d976740f427bfc92503c2d293"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.7/packy_v0.1.7_linux_arm64", using: :nounzip
      sha256 "1212a53f764a54fe2158f49471d4972ced4a471122c907ff31c5a863f2b38e48"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.1.7/packy_v0.1.7_linux_amd64", using: :nounzip
      sha256 "ea0073925a2147def3c997cd0ca390eeb3783c8d3bdc625d1d0f7da9dd23678e"
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
