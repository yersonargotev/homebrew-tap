class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.50.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.50.1/dots_v0.50.1_darwin_arm64", using: :nounzip
      sha256 "a82311d9ea041c0c845f37321f3a532351a4e66d0826234f65a378932a23c3e7"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.50.1/dots_v0.50.1_darwin_amd64", using: :nounzip
      sha256 "76f610a2f8b7d37f859ff75828d6781f23e4dbe7e8e281bde87ba40c59684d62"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.50.1/dots_v0.50.1_linux_arm64", using: :nounzip
      sha256 "83c93a8ea3488316d7f4e8a2c29236fde5f614b48868c9fd35b895f8d7c56362"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.50.1/dots_v0.50.1_linux_amd64", using: :nounzip
      sha256 "d0fbf14cae72fb7279f3f8f3e3883b69719df50b7c9d0f15073e94a326f6dd76"
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
