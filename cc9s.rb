class Cc9s < Formula
  desc "A k9s-inspired TUI for managing Claude Code sessions"
  homepage "https://github.com/kincoy/cc9s"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-darwin-amd64"
      sha256 "7d398e3d3750ad64632f251cb22499c4e27de10ae318d9d1cd3e1e391eab6830"
    end
    on_arm do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-darwin-arm64"
      sha256 "e420f135fa9c8d732851ae7383ec2eb5cd86bd8c2014020755bb5b5636778ed5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-linux-amd64"
      sha256 "591bc757c9b0b6f31dadf745624a651f52a0b6e1dbd25f32fa0b29c2da4cd97d"
    end
    on_arm do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-linux-arm64"
      sha256 "e82ed0cc757bf5985aba67174ad75377f0fd9ed64bd29de1bec91e86b6b9f6ea"
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
