class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.65.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.65.0/dots_v0.65.0_darwin_arm64", using: :nounzip
      sha256 "ec52642eb7e03734d79068960782731df7f8203fc35374bef762c3bb93eab3ba"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.65.0/dots_v0.65.0_darwin_amd64", using: :nounzip
      sha256 "24381f57b9e66820d6287abd4327d2fc754a33d0157bad1fd7bd48c8df4d7c1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.65.0/dots_v0.65.0_linux_arm64", using: :nounzip
      sha256 "8ab39684217b172e4c9d577465d101099c5e833a589c8ba219d6f3f0695bbeec"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.65.0/dots_v0.65.0_linux_amd64", using: :nounzip
      sha256 "53fb37b9260cb2490da051cb9338ff7bbcfb8adb3e0fffb3eaed5aaf0f118c35"
    end
  end

  def downloaded_binary
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    "dots_v#{version}_#{os}_#{arch}"
  end

  def install
    bin.install downloaded_binary => "dots"
  end

  test do
    system "#{bin}/dots", "--version"
  end
end
