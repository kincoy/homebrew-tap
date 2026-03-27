class Cc9s < Formula
  desc "A k9s-inspired TUI for managing Claude Code sessions, skills, and agents"
  homepage "https://github.com/kincoy/cc9s"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-darwin-amd64"
      sha256 "e9b9e60a3a2612e5ff8fd1437267caa822b5e68f119d918ef5e9261e925945e4"
    end
    on_arm do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-darwin-arm64"
      sha256 "fe860015048b3dba1109aad38ab52cbf005023197188b64aee86b79c4a61e83e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-linux-amd64"
      sha256 "04fa59962a0a9b57fe81e14e375b8ecccfe7826c9233edca5fc53c6bb3606acc"
    end
    on_arm do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-linux-arm64"
      sha256 "d685a332a343ad9fc7814642f47e51ef9701005af311ff18d0f52fb06a17fb53"
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
