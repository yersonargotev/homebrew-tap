class Tracky < Formula
  desc "Local-first, review-first personal finance CLI"
  homepage "https://github.com/yersonargotev/tracky"
  version "0.2.1"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/yersonargotev/tracky/releases/download/v0.2.1/tracky-aarch64-apple-darwin.tar.xz"
    sha256 "d52f47e0afc0df88b668985e72cc740b1a88bc93f1e53b8d0792c199df6cec5d"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/yersonargotev/tracky/releases/download/v0.2.1/tracky-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "a6f55e530d96a05b5c8f1549f4759784c0760c745e0cdc6c7e569e15487910d6"
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
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
