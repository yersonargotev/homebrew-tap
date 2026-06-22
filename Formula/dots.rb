class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.16.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.16.0/dots_v0.16.0_darwin_arm64", using: :nounzip
      sha256 "b0d7c749f9ea4c596ce25f8a563ca7c68791b58a9660ce00e48bdf9bd42a58dc"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.16.0/dots_v0.16.0_darwin_amd64", using: :nounzip
      sha256 "2bea41314cf8b3afb9f4017029a175aa43eb430a21ba7b9776719a7ad2411c63"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.16.0/dots_v0.16.0_linux_arm64", using: :nounzip
      sha256 "15c5f3e29e47103c8f0a9512ff507555e7a5d5ba1923f35b087f7b3e055e2003"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.16.0/dots_v0.16.0_linux_amd64", using: :nounzip
      sha256 "074db6eab9f72d037da40b6d87ebfa568bf91afdc160205b1db77eda4d7770d5"
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
