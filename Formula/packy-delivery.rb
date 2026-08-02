class PackyDelivery < Formula
  desc "Resumable issue-delivery orchestrator for Packy"
  homepage "https://github.com/yersonargotev/packy-delivery"
  version "0.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.6.3/packy-deliver_v0.6.3_darwin_arm64", using: :nounzip
      sha256 "08ab44f1ed44e6e6049a9e7b8506b7f7eeab5a5e66301fd7dec64fcacf09522d"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.6.3/packy-deliver_v0.6.3_darwin_amd64", using: :nounzip
      sha256 "af750dd394635312202782e660e2470ba5cb762dac4eeb7cd2bbe787842a852a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.6.3/packy-deliver_v0.6.3_linux_arm64", using: :nounzip
      sha256 "2d1b5e2c4056e462a71cc857d0daa5d1c8aad1fb652920a1ac5522398253fca7"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.6.3/packy-deliver_v0.6.3_linux_amd64", using: :nounzip
      sha256 "64be73fc5125d4658851812dc2615a524b7e276c8f1a4763be3ead9ff4b5a68c"
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
