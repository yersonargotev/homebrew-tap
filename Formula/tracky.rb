class Tracky < Formula
  desc "Local-first, review-first personal finance CLI"
  homepage "https://github.com/yersonargotev/tracky"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/tracky/releases/download/v0.1.0/tracky-aarch64-apple-darwin.tar.xz"
      sha256 "ec5b1d6046b8a56836357be0a2597c67bf413865c4a427cd9b3535ff729c1c73"
    end
    if Hardware::CPU.intel?
      url "https://github.com/yersonargotev/tracky/releases/download/v0.1.0/tracky-x86_64-apple-darwin.tar.xz"
      sha256 "d34005a987c6b56f49b9eba364409ad28a7d862e0b4fceb0fce8dab2f77f3515"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/yersonargotev/tracky/releases/download/v0.1.0/tracky-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "128061216e110e3555333268f3a863034bef30c1123f18ab3bef249f46740e0d"
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
    "x86_64-apple-darwin":      {},
    "x86_64-unknown-linux-gnu": {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "tracky" if OS.mac? && Hardware::CPU.arm?
    bin.install "tracky" if OS.mac? && Hardware::CPU.intel?
    bin.install "tracky" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
