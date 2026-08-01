class PackyDelivery < Formula
  desc "Resumable issue-delivery orchestrator for Packy"
  homepage "https://github.com/yersonargotev/packy-delivery"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.6.1/packy-deliver_v0.6.1_darwin_arm64", using: :nounzip
      sha256 "dea9f6cbd4cda1989cc2a60501092a24ba5b6ed50cd0b032a180aad4db2ae4ca"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.6.1/packy-deliver_v0.6.1_darwin_amd64", using: :nounzip
      sha256 "69813e32a0bf0786b53ccdc40c3020bd4ca69d9198ed1ce77d8f2715258570e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.6.1/packy-deliver_v0.6.1_linux_arm64", using: :nounzip
      sha256 "9938749e0ff1dd3d6eba6329ae8dc4a735101ddd5b911a331553cdce4dd875a4"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.6.1/packy-deliver_v0.6.1_linux_amd64", using: :nounzip
      sha256 "a4ce5c8c8e3ad16c7ad70f371f09aa13eec607feee627f0e69471f41e1079080"
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
