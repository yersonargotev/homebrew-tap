class PackyDelivery < Formula
  desc "Resumable issue-delivery orchestrator for Packy"
  homepage "https://github.com/yersonargotev/packy-delivery"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.1.0/packy-deliver_v0.1.0_darwin_arm64", using: :nounzip
      sha256 "218c0b2b698de2081832a13b61ee354dc73d74d81872e482c9118480061182b2"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.1.0/packy-deliver_v0.1.0_darwin_amd64", using: :nounzip
      sha256 "a28e61b532af4327906b17ec419c5c3f0ff07b611933dfe6e2df75f6e3267e63"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.1.0/packy-deliver_v0.1.0_linux_arm64", using: :nounzip
      sha256 "206c9fc962ad15fd6dfa6b626275df67a5b9374359407b2f6da0ed6b0a6b8727"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.1.0/packy-deliver_v0.1.0_linux_amd64", using: :nounzip
      sha256 "043407ff03c7c40a362bd03916ce5c8575b93d2dec3230bfc78582b35ec1583c"
    end
  end

  def install
    downloaded_binary = Dir["packy-deliver_*"].first
    odie "downloaded packy-deliver binary not found" if downloaded_binary.nil?
    bin.install downloaded_binary => "packy-deliver"
  end

  test do
    assert_equal "#{version}\n", shell_output("#{bin}/packy-deliver version")
  end
end
