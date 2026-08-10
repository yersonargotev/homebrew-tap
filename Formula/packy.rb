class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.7/packy_v0.2.7_darwin_arm64.tar.gz"
      sha256 "6d54ed496105beb6547fc6de35558f8dc4e01cd994eac5e13b1ffdc7c6cbe8f8"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.7/packy_v0.2.7_darwin_amd64.tar.gz"
      sha256 "7e61b58c8e7bada380d501d1d42d1075eb2524991e493455cc0f47869df1d0df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.7/packy_v0.2.7_linux_arm64.tar.gz"
      sha256 "9ae3126fdcde02dde988879003f5ca68e12f8ca6e18b338790765550ba5a28aa"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.7/packy_v0.2.7_linux_amd64.tar.gz"
      sha256 "b455b32077b16221d351cc46666e5da826d2670aa6e975770819ab30b4d8c9ae"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
