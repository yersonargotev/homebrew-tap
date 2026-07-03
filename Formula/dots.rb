class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.50.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.50.0/dots_v0.50.0_darwin_arm64", using: :nounzip
      sha256 "a5667ebf673048c742e3cf1826ba9065a22646dfaf26a7b0a8fdaefa42a4b3ef"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.50.0/dots_v0.50.0_darwin_amd64", using: :nounzip
      sha256 "cff9d7bbc00c6490ce12c9a4dfd0d93cdd43a1e5f99da4822a2647b8f179104f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.50.0/dots_v0.50.0_linux_arm64", using: :nounzip
      sha256 "da25de9acd21eb506e0918370e81706611d5b8ce556f830a0719d90455ffa798"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.50.0/dots_v0.50.0_linux_amd64", using: :nounzip
      sha256 "50f9e56ebbde286188f5aa0a3f281224caa86f3864a9603c6baa1002593ce6f7"
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
