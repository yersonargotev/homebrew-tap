class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.52.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.52.1/dots_v0.52.1_darwin_arm64", using: :nounzip
      sha256 "a60900aaa405964f9dd0c583c5702846bf5e0576d996516238f04aeff1d259dc"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.52.1/dots_v0.52.1_darwin_amd64", using: :nounzip
      sha256 "82563cd9f227f0cda7e2221249cd3090ae610f17e11d8adb31a8c7a2de9f4660"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.52.1/dots_v0.52.1_linux_arm64", using: :nounzip
      sha256 "138ae0adb4b4766583303c74a6a9544422e76e93fef9d753150a193073d8646d"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.52.1/dots_v0.52.1_linux_amd64", using: :nounzip
      sha256 "bccc5a82b350c88b43841af92d536f281428ee72ae40a04fb904856937024896"
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
