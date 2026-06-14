class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.4.0/dots_v0.4.0_darwin_arm64", using: :nounzip
      sha256 "c71660981d47fd0b6d04a1fc0274ae389b5856adad9819f69dd5228225e2e733"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.4.0/dots_v0.4.0_darwin_amd64", using: :nounzip
      sha256 "dceeac930b9557834f43d3098c8a58e45508fd7c867aaf82e48a6ac9113a2ef0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.4.0/dots_v0.4.0_linux_arm64", using: :nounzip
      sha256 "c116414ff7a4acacbbc7681bf5a76156a1a328c25679c3e60158f0a4c3319f0a"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.4.0/dots_v0.4.0_linux_amd64", using: :nounzip
      sha256 "6f1b2d7d408586fa8f9aec36a6eb2413f8d82574fd5d649e9e6f51404d3488da"
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
    system "#{bin}/dots", "--help"
  end
end
