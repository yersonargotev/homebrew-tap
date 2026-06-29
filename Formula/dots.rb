class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.43.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.43.0/dots_v0.43.0_darwin_arm64", using: :nounzip
      sha256 "9035698affb175454d5b9c5e813b5bae03d526b0a5fdddb7982178e10c17b928"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.43.0/dots_v0.43.0_darwin_amd64", using: :nounzip
      sha256 "12d3d1b3d9d209ca8cc50ab28e943ecbbc5af8b9f64ef3340a15e28b7aba3cf2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.43.0/dots_v0.43.0_linux_arm64", using: :nounzip
      sha256 "f35a46c3007abc78ba89ac9c7a32e6a6c264c0222bd53be6d85cde0a2ff1c420"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.43.0/dots_v0.43.0_linux_amd64", using: :nounzip
      sha256 "7722109fd2828fba1329b1dd460eec4166a91566df6cf52b0328d26875786599"
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
