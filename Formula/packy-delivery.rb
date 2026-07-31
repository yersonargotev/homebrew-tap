class PackyDelivery < Formula
  desc "Resumable issue-delivery orchestrator for Packy"
  homepage "https://github.com/yersonargotev/packy-delivery"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.5.0/packy-deliver_v0.5.0_darwin_arm64", using: :nounzip
      sha256 "bc436dadc1abdb57db03d9d2a79d0ec978303e942189d0461055b2a4a7b558c4"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.5.0/packy-deliver_v0.5.0_darwin_amd64", using: :nounzip
      sha256 "d7c2dbb6a0d83810450c0e28a40e6eb75d273af42c7028d345173c0d541d2176"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.5.0/packy-deliver_v0.5.0_linux_arm64", using: :nounzip
      sha256 "fc93c4201ce09c466ab45bace5b207b09a211598d99ad855d55f94e1629876a3"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.5.0/packy-deliver_v0.5.0_linux_amd64", using: :nounzip
      sha256 "4de57b072dda4538f9daceba780aa725327289efeeecac2729d7f3915f9e035f"
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
