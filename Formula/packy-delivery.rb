class PackyDelivery < Formula
  desc "Resumable issue-delivery orchestrator for Packy"
  homepage "https://github.com/yersonargotev/packy-delivery"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.3.0/packy-deliver_v0.3.0_darwin_arm64", using: :nounzip
      sha256 "29d157dc6b32f2d40abf46989c3a2184b5802ef2df40d9c61a82514f2cb0c98c"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.3.0/packy-deliver_v0.3.0_darwin_amd64", using: :nounzip
      sha256 "55d553c18a086645d27dcceae8a1de1ae7acbaa6ebf18b3caca5f2baaa000f2b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.3.0/packy-deliver_v0.3.0_linux_arm64", using: :nounzip
      sha256 "a17635be754ec178d53c3eae9a35b5e738d5dfb6b08244043a29d09d7e63b624"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.3.0/packy-deliver_v0.3.0_linux_amd64", using: :nounzip
      sha256 "5feecb93288baaaf678e90537b0128f545bef8fdea3b0fcd1487d1c90917dd24"
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
