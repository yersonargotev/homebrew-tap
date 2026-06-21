class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.10.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.10.2/dots_v0.10.2_darwin_arm64", using: :nounzip
      sha256 "225cde287172ccb41b6a4dee715b72b85321beedd909c14baaad8fe230a2ee78"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.10.2/dots_v0.10.2_darwin_amd64", using: :nounzip
      sha256 "05d8938b4d999098f1805a384ceee7134f6e518d12521c19a21c190a468c1e82"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.10.2/dots_v0.10.2_linux_arm64", using: :nounzip
      sha256 "c3b061e8d26e62a8edad37aa001ef4aa2b42a81e1c7d74624a4ddaf18df66242"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.10.2/dots_v0.10.2_linux_amd64", using: :nounzip
      sha256 "69547b589f09e75f855a691db7c16e516caec12471909ce3667d4777e37fb871"
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
