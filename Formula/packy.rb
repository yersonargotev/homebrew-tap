class Packy < Formula
  desc "AI coding workflow installer"
  homepage "https://github.com/yersonargotev/packy"
  version "0.2.22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.22/packy_v0.2.22_darwin_arm64.tar.gz"
      sha256 "d7aa4f84c3f776882b162f84e2355616793db0fd1c4350467083878ad79aa467"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.22/packy_v0.2.22_darwin_amd64.tar.gz"
      sha256 "dd8d1402a30b13e01d5af706b54cd9d73246dfb378f7fd601c067957ba908928"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.22/packy_v0.2.22_linux_arm64.tar.gz"
      sha256 "e2828931f3339e0a502eb5a0c9e537dd0ede4f84fb13ad9afdeb09917566c677"
    else
      url "https://github.com/yersonargotev/packy/releases/download/v0.2.22/packy_v0.2.22_linux_amd64.tar.gz"
      sha256 "4d94444e19438e61852aa976a46a5e93f80294e44566d944f136edd91fa3e85e"
    end
  end

  def install
    bin.install "packy"
  end

  test do
    system "#{bin}/packy", "--version"
  end
end
