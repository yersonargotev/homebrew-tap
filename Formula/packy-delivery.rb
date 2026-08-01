class PackyDelivery < Formula
  desc "Resumable issue-delivery orchestrator for Packy"
  homepage "https://github.com/yersonargotev/packy-delivery"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.6.0/packy-deliver_v0.6.0_darwin_arm64", using: :nounzip
      sha256 "186568df96209b8315050816a08c7f129ef4c70623903f3b8115e8af951643b4"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.6.0/packy-deliver_v0.6.0_darwin_amd64", using: :nounzip
      sha256 "d0f71508b3f7b1d9c60393bc2d05eb2355a6f6427cc181672fec575cbb9f73e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.6.0/packy-deliver_v0.6.0_linux_arm64", using: :nounzip
      sha256 "3cd787f6872a46c75762b4250604656b4659ae77d5c04bb07e3291d43d0d80da"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.6.0/packy-deliver_v0.6.0_linux_amd64", using: :nounzip
      sha256 "259c6baa8ef20eeab3ab022f7d250e3d2c2257112f2fdcb21d0cacede667cc2e"
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
