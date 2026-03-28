class Cc9s < Formula
  desc "A k9s-inspired TUI for managing Claude Code sessions, skills, and agents"
  homepage "https://github.com/kincoy/cc9s"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-darwin-amd64"
      sha256 "529b7b39c3f446054c65db1f555dae0cdee52dec54801df72aa28e6e9698d2b2"
    end
    on_arm do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-darwin-arm64"
      sha256 "9305b1322705b1ba8062169a6060efce20161872609bff86bab49c9007a9e95e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-linux-amd64"
      sha256 "05932d4cf9dc25d958c81172a8098967e3605f1c83515fc139c959df0f38c71e"
    end
    on_arm do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-linux-arm64"
      sha256 "8c65dd6758ff739f4ceb5910d0dc85c8bc53f4df905bc2759e327486db5983ea"
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
