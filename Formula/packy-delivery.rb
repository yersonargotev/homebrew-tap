class PackyDelivery < Formula
  desc "Resumable issue-delivery orchestrator for Packy"
  homepage "https://github.com/yersonargotev/packy-delivery"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.2.0/packy-deliver_v0.2.0_darwin_arm64", using: :nounzip
      sha256 "fef7c514316846fdd0e804fbdc27811314a7aa610ddf4549d4de5012d9efb2aa"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.2.0/packy-deliver_v0.2.0_darwin_amd64", using: :nounzip
      sha256 "38552a1fd444de12e1e2574f956a951c7e1b1a8fbd4b9cd98cb96c83a9b8f1df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.2.0/packy-deliver_v0.2.0_linux_arm64", using: :nounzip
      sha256 "8b67a8143a41350233005414d9af4493fd2a5d92fbc86b128b84729681605d53"
    else
      url "https://github.com/yersonargotev/packy-delivery/releases/download/v0.2.0/packy-deliver_v0.2.0_linux_amd64", using: :nounzip
      sha256 "0adf51883c3cd04009eb7746feffe8ff4c435e072aa6d9f449df888d882ae695"
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
