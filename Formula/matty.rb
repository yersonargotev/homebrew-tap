class Matty < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/matty"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.5/matty_v0.1.5_darwin_arm64", using: :nounzip
      sha256 "156f5a116d955db3f4679303e94467eec1b892bf1c40844788b52ce0dea88c6d"
    else
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.5/matty_v0.1.5_darwin_amd64", using: :nounzip
      sha256 "25bbb7a11fd2264bfab0a9c93a410403085b0dfb935381d1a993a27281c8aeb6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.5/matty_v0.1.5_linux_arm64", using: :nounzip
      sha256 "d9e57d410a22ff63162bb051221adbc327d0bc46bcc29a3ebaa87c9af5faef27"
    else
      url "https://github.com/yersonargotev/matty/releases/download/v0.1.5/matty_v0.1.5_linux_amd64", using: :nounzip
      sha256 "eb953fa5d30b223f37db90fe67c2a8528533846f18d6f547f6094a0c515f37fa"
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
