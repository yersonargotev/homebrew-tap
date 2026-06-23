class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.19.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.19.0/dots_v0.19.0_darwin_arm64", using: :nounzip
      sha256 "cb244dabc27239678313443d98727a3285d1ba9677eeb7cac3fd19e73c17830c"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.19.0/dots_v0.19.0_darwin_amd64", using: :nounzip
      sha256 "ead8601d721c5a1e1e370c241a2147e96f5eec5825c8fdbf56c0ccadaa4f267e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.19.0/dots_v0.19.0_linux_arm64", using: :nounzip
      sha256 "54d3b938fb0edc5cbf9d008e45a7593c729401e8f2ddbd589ea9352263bd1185"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.19.0/dots_v0.19.0_linux_amd64", using: :nounzip
      sha256 "1c2dfe455d8172ede73f4c865f8cfff110c5f64ba20cd8569d0af8b8297b4542"
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
