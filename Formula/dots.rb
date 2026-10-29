class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.96.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.96.1/dots_v0.96.1_darwin_arm64", using: :nounzip
      sha256 "e975fb35b7778c2a201898eb2dbddac96a788173867b183abe22fc1a8e2670e8"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.96.1/dots_v0.96.1_darwin_amd64", using: :nounzip
      sha256 "35360b813d7249307545125961d8241ab4da8b85834953947c405450eb655eaf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.96.1/dots_v0.96.1_linux_arm64", using: :nounzip
      sha256 "8bda95cd8d35cb54d38d3deffe2231b0b3e84bb4b4754c03c690b0b62ec77cd0"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.96.1/dots_v0.96.1_linux_amd64", using: :nounzip
      sha256 "703a27419b464ed9a1b39b9b87f69e143b5eeff37b75e9e99535aeb8766e8086"
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
