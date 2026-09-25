class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.87.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.87.1/dots_v0.87.1_darwin_arm64", using: :nounzip
      sha256 "7652d716c93a616ecc9a9d34162e6c459cbf40e67506147d8c5d84b326d8c903"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.87.1/dots_v0.87.1_darwin_amd64", using: :nounzip
      sha256 "07a02d27d172800e6871c3e10b1baf8dbf4a15a226a08b42d7cff23e945694d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.87.1/dots_v0.87.1_linux_arm64", using: :nounzip
      sha256 "caab32aa13cf9d61ecd6c902f01263ddd52ecb54e234f6dfd8a059de2e55b134"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.87.1/dots_v0.87.1_linux_amd64", using: :nounzip
      sha256 "4bfdc7eda57a9eec23616fbbe9864b9846e9662361ef6161c3dc3a76a3b54d46"
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
