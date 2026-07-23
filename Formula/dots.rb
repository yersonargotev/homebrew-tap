class Dots < Formula
  desc "Safe dotfiles installer"
  homepage "https://github.com/yersonargotev/dots"
  version "0.60.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.60.1/dots_v0.60.1_darwin_arm64", using: :nounzip
      sha256 "492f6fa27f98f1938b87d2877e26fba364733e070116e330394752d85f953cbd"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.60.1/dots_v0.60.1_darwin_amd64", using: :nounzip
      sha256 "30eb084fb5118866d9203320c66880ef551b00c4d743e546ee617ee8bd67aaa6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/dots/releases/download/v0.60.1/dots_v0.60.1_linux_arm64", using: :nounzip
      sha256 "8eb7bf0faa0ed61e212bbed0bfcd105722fe7ecf7e7e58607a0d974157ec4fb5"
    else
      url "https://github.com/yersonargotev/dots/releases/download/v0.60.1/dots_v0.60.1_linux_amd64", using: :nounzip
      sha256 "1077c5a949531f2f9c42ff43d55ab73e5063088ebb24618e50f862e0b7be4d3c"
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
    system "#{bin}/dots", "--version"
  end
end
