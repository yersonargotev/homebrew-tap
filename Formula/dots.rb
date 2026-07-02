class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.48.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.48.2/dots_v0.48.2_darwin_arm64", using: :nounzip
      sha256 "c31babcd7428d2aba449027200b46f567505271684b218e5f5c1cd6959b1baff"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.48.2/dots_v0.48.2_darwin_amd64", using: :nounzip
      sha256 "6019ca0a619c173809394d7dd37cf07efcdbcfc1f277e2718eed3fad510a13d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.48.2/dots_v0.48.2_linux_arm64", using: :nounzip
      sha256 "b05d573530ebae8cb015b7728cc0f9da899f27d49482f428639e77f60a636aee"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.48.2/dots_v0.48.2_linux_amd64", using: :nounzip
      sha256 "ae980555b645d528f31f1b50b7e1b0bc7659b53db84c7c84f36b5421ead5ca58"
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
