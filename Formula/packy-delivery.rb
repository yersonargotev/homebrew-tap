class PackyDelivery < Formula
  desc "Resumable issue-delivery orchestrator for Packy"
  homepage "https://github.com/yersonargotev/packy-delivery"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.7.0/packy-deliver_v0.7.0_darwin_arm64", using: :nounzip
      sha256 "6779b95339c815cb99ecba5f7efe748bcc1d3ad470fa84dfa9e6c720f0571ff1"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.7.0/packy-deliver_v0.7.0_darwin_amd64", using: :nounzip
      sha256 "4b1b750ea0437764f42057e4978874dd57c578db09340177c58ef747b3dddd40"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.7.0/packy-deliver_v0.7.0_linux_arm64", using: :nounzip
      sha256 "d005a37e0e95ac48ab74121898508ce2b4199679bbd54fe25e9ad27469f5e9c9"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.7.0/packy-deliver_v0.7.0_linux_amd64", using: :nounzip
      sha256 "1cad20a646651ae2263a424a0ae98e797d3332cbed9aaec1daad458c2a17e0f2"
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
