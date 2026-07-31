class PackyDelivery < Formula
  desc "Resumable issue-delivery orchestrator for Packy"
  homepage "https://github.com/yersonargotev/packy-delivery"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.2.1/packy-deliver_v0.2.1_darwin_arm64", using: :nounzip
      sha256 "ef8088444de407962dc0e5b51142779a7c98086a2f24cc4fae82b2a3435b267e"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.2.1/packy-deliver_v0.2.1_darwin_amd64", using: :nounzip
      sha256 "b26f7fafc47caec2f056bf36a1ad47ae12205e7e1129d93279ac9577cbc404c0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.2.1/packy-deliver_v0.2.1_linux_arm64", using: :nounzip
      sha256 "b4274755ebcd8e4052b0111f3b1edb769ef51d96bb3729d7cccc5567dc74e54a"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.2.1/packy-deliver_v0.2.1_linux_amd64", using: :nounzip
      sha256 "84b7fab5f12c47a4c8bd82fc8fcede606836826a8f9ae3da15ad306815ccab48"
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
