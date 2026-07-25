class Tracky < Formula
  desc "Local-first, review-first personal finance CLI"
  homepage "https://github.com/yersonargotev/tracky"
  version "0.2.3-rc.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/tracky/releases/download/v0.2.3-rc.1/tracky-aarch64-apple-darwin.tar.xz"
      sha256 "fb8aa113f50c8bd139b141fb2a9dca019647408476e727d6523768146239536c"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/yersonargotev/tracky/releases/download/v0.2.3-rc.1/tracky-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7d9e4755b10d77d5a0fa9cd8792e378bd9a021c15810f68d50b3ff549fb7e365"
    end
  end

  def install
    bin.install "tracky"
  end

  test do
    assert_match "tracky 0.2.3", shell_output("#{bin}/tracky --version")
  end
end
