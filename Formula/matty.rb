class Matty < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/matty"
  version "0.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.4/matty_v0.1.4_darwin_arm64", using: :nounzip
      sha256 "6103c015ad71e9b753db6517db51e6a2ba9eedc32a4d9f34dec743ac45a40d74"
    else
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.4/matty_v0.1.4_darwin_amd64", using: :nounzip
      sha256 "caac198928169c34f7b501fbfc398ddaa9624ad1939a39782cac7564dcf8aceb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.4/matty_v0.1.4_linux_arm64", using: :nounzip
      sha256 "181c8039cdfe8c8b4962829cd95ee7b8267a7585ed3fd010cba3e8ca6dc5d3fb"
    else
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.4/matty_v0.1.4_linux_amd64", using: :nounzip
      sha256 "ddc2a4a18da2bdebc40200100a5c130ec0854e501227b26e68782588bf942dae"
    end
  end

  def install
    downloaded_binary = Dir["matty_*"].first
    odie "downloaded matty binary not found" if downloaded_binary.nil?
    bin.install downloaded_binary => "matty"
  end

  test do
    system "#{bin}/matty", "--version"
  end
end
