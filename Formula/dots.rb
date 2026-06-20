class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.9.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.9.1/dots_v0.9.1_darwin_arm64", using: :nounzip
      sha256 "a26ab1abf112f028c92462bacb2c2cb90408fc94ecf10f9ee1debdca472d3ec8"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.9.1/dots_v0.9.1_darwin_amd64", using: :nounzip
      sha256 "daa9dc28ef91a0a37d8f656b36b40cca413e2bf80a5823e423e50312050a65a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.9.1/dots_v0.9.1_linux_arm64", using: :nounzip
      sha256 "aa646bae81b3febcc9040de2a17863ed505acaf32c12fc24aca955daead90cda"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.9.1/dots_v0.9.1_linux_amd64", using: :nounzip
      sha256 "b9cdfcbebbf6a56840e2d3198979e9db2ce19d1af4d2dc0023275ba52dc10c14"
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
