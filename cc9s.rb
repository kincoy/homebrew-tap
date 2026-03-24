class Cc9s < Formula
  desc "A k9s-inspired TUI for managing Claude Code sessions"
  homepage "https://github.com/kincoy/cc9s"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-darwin-amd64"
      sha256 "cdea1448d0a762a98d3c71d2cf2059fcb15c99b962dfce3c842f1d3d1cd0bf74"
    end
    on_arm do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-darwin-arm64"
      sha256 "6a92c961ffdf24ce10ed0cca83ef917643f920b67f49be0139db72c706d5b0e9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-linux-amd64"
      sha256 "78cbf9d489150bb299ff58020bc7445db0d40c0353fb7622b2d3e15954894440"
    end
    on_arm do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-linux-arm64"
      sha256 "2afddc1e0367ccf147cefeec2aac3ffbebcdbdcbb55cea87d67be884145d8686"
    end
  end

  def install
    bin.install "cc9s-darwin-amd64" => "cc9s" if OS.mac? && Hardware::CPU.intel?
    bin.install "cc9s-darwin-arm64" => "cc9s" if OS.mac? && Hardware::CPU.arm?
    bin.install "cc9s-linux-amd64" => "cc9s" if OS.linux? && Hardware::CPU.intel?
    bin.install "cc9s-linux-arm64" => "cc9s" if OS.linux? && Hardware::CPU.arm?
  end

  test do
    assert_match "cc9s", shell_output("#{bin}/cc9s --help", 1)
  end
end
