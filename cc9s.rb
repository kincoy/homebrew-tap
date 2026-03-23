class Cc9s < Formula
  desc "A k9s-inspired TUI for managing Claude Code sessions"
  homepage "https://github.com/kincoy/cc9s"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-darwin-amd64"
      sha256 "bb47787b887cc31163320a48bf9a75cf50bbef66bd32cd3785216c361a3eada0"
    end
    on_arm do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-darwin-arm64"
      sha256 "2f07328f7383b144bb4391a9f10861f79a58a0bd679e65bcba3cb82a0d34a8f2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-linux-amd64"
      sha256 "2d88fd29755eab983460d3b8c22bab84a459204a2c2eb37d1f6348aa52ce865b"
    end
    on_arm do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-linux-arm64"
      sha256 "92a046b798529c04691863c486e62252e2e3fe0cf787e88b290fd6d24d6fd8e9"
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
