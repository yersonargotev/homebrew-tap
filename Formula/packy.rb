class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.36"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.36/packy_v0.2.36_darwin_arm64.tar.gz"
      sha256 "049f9c971fdd8591879f1312ec83fe6a2eb9382b9a8b5114e8a37aaeb2e78829"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.36/packy_v0.2.36_darwin_amd64.tar.gz"
      sha256 "c980e1f20c8d810d9e6b97d12fc5162b5ee02645decc8c9ba6cc24643f46c2ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.36/packy_v0.2.36_linux_arm64.tar.gz"
      sha256 "8f7b5d83121ce784342b04a2997d204236904819b1a52cbdbaf3b917cf967b6e"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.36/packy_v0.2.36_linux_amd64.tar.gz"
      sha256 "ec612d71f9de05aca032b4f84b91a6c13a322ea342996129934a4f3cd0d38d0a"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
