class PackyDelivery < Formula
  desc "Resumable issue-delivery orchestrator for Packy"
  homepage "https://github.com/yersonargotev/packy-delivery"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.4.0/packy-deliver_v0.4.0_darwin_arm64", using: :nounzip
      sha256 "aa7d594943735fbbefe9282201c4ef77289de2bb9a267d1b17294d58013543cf"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.4.0/packy-deliver_v0.4.0_darwin_amd64", using: :nounzip
      sha256 "1f9ee0269945efacfec3ead182be269ea02aed42de6b6dd3b92937d7f24c39d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.4.0/packy-deliver_v0.4.0_linux_arm64", using: :nounzip
      sha256 "da3c77a68650453323117d37f320417f4f2f35bfeed945035f84f84fcfc5bdc4"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.4.0/packy-deliver_v0.4.0_linux_amd64", using: :nounzip
      sha256 "1d07ffd3ceb0cd7cd75c9ca20d1d15aed720f8a95f1d136868f1f1cb02d91ac3"
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
