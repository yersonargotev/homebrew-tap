class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.24.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.24.0/dots_v0.24.0_darwin_arm64", using: :nounzip
      sha256 "6967d72de8aed5e3dcaf83bc676ea60bf85b4577dbe4b65f6221963a29d114fb"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.24.0/dots_v0.24.0_darwin_amd64", using: :nounzip
      sha256 "2f2b802ca7c5abc6cddd78c74e0af32cf1072f7e0af7c98fc3937b7187772180"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.24.0/dots_v0.24.0_linux_arm64", using: :nounzip
      sha256 "b321d89e33954888bb87d2cc1c449addb00f8ba088227db969d3d4098d87214f"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.24.0/dots_v0.24.0_linux_amd64", using: :nounzip
      sha256 "f36db247f32596d6a5c1a9153517a70fd4c0e7b678389c1df64eeaabdc500032"
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
