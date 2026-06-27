class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.23.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.23.0/dots_v0.23.0_darwin_arm64", using: :nounzip
      sha256 "22a3c043135949509eae7dba7bf5f94dc364cb4308bbf600efa390517cedcad9"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.23.0/dots_v0.23.0_darwin_amd64", using: :nounzip
      sha256 "3d45e8ddb4b291f638f7eec007edcc538415a5ae3b6f30f67abb0a49ba82895e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.23.0/dots_v0.23.0_linux_arm64", using: :nounzip
      sha256 "28e1cc37535f6f7df8167618480f3223c7a8192d9acd42c63fe70c97b153b4e4"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.23.0/dots_v0.23.0_linux_amd64", using: :nounzip
      sha256 "00829558c870e98ef7ee868d31a8c69f3d12e10f62cf910c4bc4222ccc874130"
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
