class Tabby < Formula
  desc "Herdr plugin for automatic tab labels"
  homepage "https://github.com/yersonargotev/tabby"
  version "0.1.3"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/yersonargotev/tabby/releases/download/v0.1.3/tabby-aarch64-apple-darwin.tar.xz"
    sha256 "e6847b8e8e892cca694c67e9a00653aeda73a510e72872a3a63528e83062b9b4"
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
