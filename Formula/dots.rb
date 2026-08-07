class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.66.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.66.3/dots_v0.66.3_darwin_arm64", using: :nounzip
      sha256 "6a470912bcc5029cd95611918ac00e2787a084936feb6689ea7cdb696765493e"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.66.3/dots_v0.66.3_darwin_amd64", using: :nounzip
      sha256 "46567b22f60e5af7dfb02d6e26863b8bfade53284aa585e02c172a3d8ca6b227"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.66.3/dots_v0.66.3_linux_arm64", using: :nounzip
      sha256 "df63ccc9847a4bcda8a6b89803080600cbf3bce28a0d290a13053c58a0f06bfd"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.66.3/dots_v0.66.3_linux_amd64", using: :nounzip
      sha256 "f4f09dcc2976f28460f56fd0399739b014739d39ca89e1566757ea92c88ab69a"
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
