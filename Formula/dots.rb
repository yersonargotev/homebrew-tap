class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.2.0/dots_v0.2.0_darwin_arm64", using: :nounzip
      sha256 "b6aa88dd5f888ae2242e58cd7c8f2dee14332b22088e1d0532dda649653985fd"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.2.0/dots_v0.2.0_darwin_amd64", using: :nounzip
      sha256 "b4be8bd831854fd71545d47a361681bebfd9944a6f91d34cee18af9e0ec0d2e7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.2.0/dots_v0.2.0_linux_arm64", using: :nounzip
      sha256 "e101b4b260487670f11caa94957f96a4006844be4c778f6bf7e1f387dace45bc"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.2.0/dots_v0.2.0_linux_amd64", using: :nounzip
      sha256 "a095d3a0ec06c7d2142557adadbf76dac4d2a94636260a99b36bec42b47f4416"
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
