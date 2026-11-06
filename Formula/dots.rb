class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.98.0"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/yersonargotev/dots/releases/download/v0.98.0/dots_v0.98.0_darwin_arm64", using: :nounzip
    sha256 "c02c90176e400726580ca3e66e877f255e269f58e92621be63ff8eb575dc13d1"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.98.0/dots_v0.98.0_linux_arm64", using: :nounzip
      sha256 "4670d7a92d3444232fb60fab63998afc2ed59a0c06d1bd4b741caf458d82ddd2"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.98.0/dots_v0.98.0_linux_amd64", using: :nounzip
      sha256 "864d246bb3dcc9c16a0f827404298edbfc62c5087d3477be4dc5f6bc7e4fc2a2"
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
