class PackyDelivery < Formula
  desc "Resumable issue-delivery orchestrator for Packy"
  homepage "https://github.com/yersonargotev/packy-delivery"
  version "0.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.6.2/packy-deliver_v0.6.2_darwin_arm64", using: :nounzip
      sha256 "42da44abed7a8dd37203982ca633c8249fc6f513d6ffd9dedb8aeed5c1aeb798"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.6.2/packy-deliver_v0.6.2_darwin_amd64", using: :nounzip
      sha256 "684f10f18e165dcfc4bc3d724a024ee4f9f91c75744d562bf30abf23b14b28c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.6.2/packy-deliver_v0.6.2_linux_arm64", using: :nounzip
      sha256 "4296edd34b26b915619c97acd3e4eacce771bca6e086e84379ea93d02e2c6b29"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.6.2/packy-deliver_v0.6.2_linux_amd64", using: :nounzip
      sha256 "79bdaaa48622fc4dd8ef7e3175ac364fce9beab10454d616b4a42da99b6df821"
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
