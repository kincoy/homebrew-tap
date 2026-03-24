class Cc9s < Formula
  desc "A k9s-inspired TUI for managing Claude Code sessions"
  homepage "https://github.com/kincoy/cc9s"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-darwin-amd64"
      sha256 "9ce679a2ee6d22bcd635d640946fcc8d5421a6a90bbacd3b263be80ff11256c3"
    end
    on_arm do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-darwin-arm64"
      sha256 "46bb7170f2abbc8473156ae9e227ab1f0e02305eb5a2ce6e601a3d1b90cab0e7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-linux-amd64"
      sha256 "b42d32ffb357773a793f551169aa824b08ad6b99366d6b227026cdf6a0b64f8f"
    end
    on_arm do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-linux-arm64"
      sha256 "b9f04e0bd8e093c1fd79881b5ca83cc4174b670d25eb9327c40828730600d262"
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
