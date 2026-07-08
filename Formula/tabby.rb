class Tabby < Formula
  desc "Herdr plugin for automatic tab labels"
  homepage "https://github.com/yersonargotev/tabby"
  version "0.1.1"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/yersonargotev/tabby/releases/download/v0.1.1/tabby-aarch64-apple-darwin.tar.xz"
    sha256 "39d08d7b68e8e43552e132ce8b93d446948348046b73dbab11cfc9ff8fe4a3ac"
  end
  license "Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
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
    bin.install "tabby" if OS.mac? && Hardware::CPU.arm?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
