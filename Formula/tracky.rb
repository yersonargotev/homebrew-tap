class Tracky < Formula
  desc "Local-first, review-first personal finance CLI"
  homepage "https://github.com/yersonargotev/tracky"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/tracky/releases/download/v0.2.4/tracky-aarch64-apple-darwin.tar.xz"
      sha256 "1f372afbf7e87cd411564aab455b641f99c115ba175efd6e39ee5e4284059fdd"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/yersonargotev/tracky/releases/download/v0.2.4/tracky-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "396a03ce5b31061400e3307faf244485c13880567a462a053966862d4fe138e0"
    end
  end

  def install
    bin.install "tracky"
  end

  test do
    assert_match "tracky 0.2.4", shell_output("#{bin}/tracky --version")
  end
end
